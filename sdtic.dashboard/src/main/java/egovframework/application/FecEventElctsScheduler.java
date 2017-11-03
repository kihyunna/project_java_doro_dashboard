package egovframework.application;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import egovframework.com.sdtic.fecrs.service.fecElrmVO;
import egovframework.com.sdtic.fecrs.service.impl.fecTotlInsrDAO;
import egovframework.com.sdtic.fecrs.service.impl.fecTotlInsrFcltDAO;

@Component
public class FecEventElctsScheduler {	
	
	@Autowired
	private fecTotlInsrDAO fecTotlInsr;
	@Autowired
	private fecTotlInsrFcltDAO fecTotlInsrFclt;
	
	
	@SuppressWarnings("deprecation")	
	public void Execute() {
		backgroundInstanceClass appinstance = (backgroundInstanceClass)backgroundInstanceClass.getInstance();
		if (appinstance.getExcute() == false)
			return; 
		
		System.out.println ("전기 이벤트 가져오기 시작");	
		boolean bEvent = false;
		try { 
			fecTotlInsr.getSqlMapClient().startTransaction();
			fecTotlInsr.getSqlMapClient().startBatch(); 
				
			
			//=========전기 이벤트 =============
			// 전기 이벤트 max seq 가져오기(관제DB)
		    String max_Dstbxseq = "0";
		    try {
		    	max_Dstbxseq = fecTotlInsr.fecGetEventElctyMaxSeq();
		    	if (max_Dstbxseq == null)
		    		max_Dstbxseq = "1";
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println ("전기 이벤트 max seq 가져오기 실패");
			}
		    
		   // 전기 이벤트 데이터 가져오기(시설물DB)
		    List<fecElrmVO> fecElrmVOList = null;
		    try {
		    	fecElrmVOList = fecTotlInsrFclt.fecGetEventElcty(max_Dstbxseq);	    	
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println ("전기 이벤트 데이터 가져오기 실패");
			}
		  
		    
		    // 전기 이벤트  데이터 추가(관제 DB)
	 	    try {
	 	    	fecTotlInsr.fecInsertEventElctyList(fecElrmVOList);
	 		} catch (Exception e) {
	 			// TODO Auto-generated catch block
	 			e.printStackTrace();
	 			System.out.println ("전기 이벤트  데이터 추가 실패");
	 		}	
	 	    
		    
	 	   if (fecElrmVOList.size() > 0)
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
		} finally{
			
		}
		
		if (bEvent){
			System.out.println ("전기 이벤트 발생");
			AppSendToUxp appSendToUxp =  new AppSendToUxp();
			appSendToUxp.SendDatatoUXP("EventElcts");	
		}
		
	}
}