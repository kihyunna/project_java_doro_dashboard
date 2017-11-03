package egovframework.application;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import egovframework.com.sdtic.fecrs.service.fecTunnelVO;
import egovframework.com.sdtic.fecrs.service.impl.fecTotlInsrDAO;
import egovframework.com.sdtic.fecrs.service.impl.fecTotlInsrFcltDAO;

@Component
public class FecEventTunnelScheduler {	
	
	@Autowired
	private fecTotlInsrDAO fecTotlInsr;
	@Autowired
	private fecTotlInsrFcltDAO fecTotlInsrFclt;
		
	@SuppressWarnings("deprecation")
	public void Execute() {
		backgroundInstanceClass appinstance = (backgroundInstanceClass)backgroundInstanceClass.getInstance();
		if (appinstance.getExcute() == false)
			return; 
		
		System.out.println ("터널 이벤트 가져오기 시작");	
		boolean bEvent = false;
		try { 
			fecTotlInsr.getSqlMapClient().startTransaction();
			fecTotlInsr.getSqlMapClient().startBatch(); 
				
			//=========터널 이벤트 =============
			// 터널 이벤트 max seq 가져오기(관제DB)
			
		    String max_Tunnelseq = "0";
		    try {
		    	max_Tunnelseq = fecTotlInsr.fecGetEventTunnelMaxSeq();
		    	if (max_Tunnelseq == null)
		    		max_Tunnelseq = "1";
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println ("터널 이벤트 max seq 가져오기 실패");
			}
		    
		   // 터널 이벤트 데이터 가져오기(시설물DB)
		    List<fecTunnelVO> fecTunnelVOList = null;
		    try {
		    	fecTunnelVOList = fecTotlInsrFclt.fecGetEventTunnel(max_Tunnelseq);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println ("터널 이벤트 데이터 가져오기 실패");
			}	  
		    
		   // 터널 이벤트 데이터 추가(관제 DB)
	 	    try { 
	 	    	fecTotlInsr.fecInsertEventTunnelList(fecTunnelVOList);
	 		} catch (Exception e) {
	 			// TODO Auto-generated catch block
	 			e.printStackTrace();
	 			System.out.println ("터널 이벤트 데이터 추가 실패");
	 		} 	
	 	    
	 	   if (fecTunnelVOList.size() > 0)
	 		  bEvent = true;
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally { 
			
		}
    	
		try {
			fecTotlInsr.getSqlMapClient().executeBatch();
			fecTotlInsr.getSqlMapClient().commitTransaction(); 
			fecTotlInsr.getSqlMapClient().endTransaction();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			return;
		} finally{
			
		}
		
		if (bEvent){
			System.out.println ("터널 이벤트 발생");
			AppSendToUxp appSendToUxp =  new AppSendToUxp();
			appSendToUxp.SendDatatoUXP("EventTunnel");	
		}
	}
}