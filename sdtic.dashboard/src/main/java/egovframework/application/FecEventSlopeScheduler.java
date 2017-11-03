package egovframework.application;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import egovframework.com.sdtic.fecrs.service.fecSlpVO;
import egovframework.com.sdtic.fecrs.service.impl.fecTotlInsrDAO;
import egovframework.com.sdtic.fecrs.service.impl.fecTotlInsrTotDAO;

@Component
public class FecEventSlopeScheduler {	
	
	@Autowired
	private fecTotlInsrDAO fecTotlInsr;
	@Autowired
	private fecTotlInsrTotDAO fecTotlInsrTot;
		
	@SuppressWarnings("deprecation")
	public void Execute() {
		backgroundInstanceClass appinstance = (backgroundInstanceClass)backgroundInstanceClass.getInstance();
		if (appinstance.getExcute() == false)
			return; 
		
		System.out.println (" 사면 이벤트 가져오기 시작");	
		boolean bEvent = false;
		try { 
			fecTotlInsr.getSqlMapClient().startTransaction();
			fecTotlInsr.getSqlMapClient().startBatch(); 
			
			//=========사면 이벤트 =============
			// 사면 이벤트 max seq 가져오기(관제DB)
			
		    String max_Slpseq = "0";
		    try {
		    	max_Slpseq = fecTotlInsr.fecGetEventSlpMaxSeq();
		    	if (max_Slpseq == null)
		    		max_Slpseq = "1";
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println ("사면 이벤트 max seq 가져오기 실패");
			}
		    
		   // 사면 이벤트 데이터 가져오기(통합 DB)
		    List<fecSlpVO> fecSlpVOList = null;
		    try {
		    	fecSlpVOList = fecTotlInsrTot.fecGetEventSlp(max_Slpseq);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println ("사면 이벤트 데이터 가져오기 실패");
			}	  
		    
		   // 사면 이벤트 데이터 추가(관제 DB)
	 	    try { 
	 	    	fecTotlInsr.fecInsertEventSlpList(fecSlpVOList);
	 		} catch (Exception e) {
	 			// TODO Auto-generated catch block
	 			e.printStackTrace();
	 			System.out.println ("사면 이벤트 데이터 추가 실패");
	 		} 	
	 	    
	 	   if (fecSlpVOList.size() > 0)
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
			System.out.println ("사면 이벤트 발생");
			AppSendToUxp appSendToUxp =  new AppSendToUxp();
			appSendToUxp.SendDatatoUXP("EventSlope");	
		}
	}
}