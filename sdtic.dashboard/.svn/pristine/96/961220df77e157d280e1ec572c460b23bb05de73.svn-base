package egovframework.application;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import egovframework.com.sdtic.fecrs.service.fecSvarVO;
import egovframework.com.sdtic.fecrs.service.impl.fecTotlInsrDAO;
import egovframework.com.sdtic.fecrs.service.impl.fecTotlInsrFcltDAO;

@Component
public class FecEventSvarScheduler {	
	
	@Autowired
	private fecTotlInsrDAO fecTotlInsr;
	@Autowired
	private fecTotlInsrFcltDAO fecTotlInsrFclt;
		
	@SuppressWarnings("deprecation")
	public void Execute() {
		backgroundInstanceClass appinstance = (backgroundInstanceClass)backgroundInstanceClass.getInstance();
		if (appinstance.getExcute() == false)
			return; 
		
		System.out.println ("오수 이벤트 가져오기 시작");	
		boolean bEvent = false;
		try { 
			fecTotlInsr.getSqlMapClient().startTransaction();
			fecTotlInsr.getSqlMapClient().startBatch(); 
				
	 	    
			//=========오수 이벤트 =============
			
			// 오수 이벤트 Max seq 가져오기
			String max_seq = "0";
		    try {
		    	max_seq = fecTotlInsr.fecGetEventMaxSeq();
		    	if (max_seq == null)
		    		max_seq = "1";
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println ("오수 이벤트 max seq 가져오기 실패");
			}
			// 오수 이벤트 정보 가져오기
		    List<fecSvarVO> fecSvarVOList = null;
		    try {
		    	fecSvarVOList = fecTotlInsrFclt.fecGetEventSvar(max_seq);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println ("오수 이벤트 데이터 가져오기 실패");
			}
			// 오수 이벤트 정보 넣기
		    try {
	 	    	fecTotlInsr.fecInsertEventSvarList(fecSvarVOList);
	 		} catch (Exception e) {
	 			// TODO Auto-generated catch block
	 			e.printStackTrace();
	 			System.out.println ("오수 이벤트 데이터 추가 실패");
	 		}
		    
		    if (fecSvarVOList.size() > 0)
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
			System.out.println ("오수 이벤트 발생");
			AppSendToUxp appSendToUxp =  new AppSendToUxp();
			appSendToUxp.SendDatatoUXP("EventSvar");	
		}
	}
}