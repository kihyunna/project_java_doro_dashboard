package egovframework.application;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import egovframework.com.sdtic.fecrs.service.fecSlpVO;
import egovframework.com.sdtic.fecrs.service.fecSvarVO;
import egovframework.com.sdtic.fecrs.service.impl.fecTotlInsrDAO;
import egovframework.com.sdtic.fecrs.service.impl.fecTotlInsrFcltDAO;
import egovframework.com.sdtic.fecrs.service.impl.fecTotlInsrTotDAO;

@Component
public class FecErrorSSScheduler{
	@Autowired
	private fecTotlInsrDAO fecTotlInsr;
	@Autowired
	private fecTotlInsrFcltDAO fecTotlInsrFclt;
	@Autowired
	private fecTotlInsrTotDAO fecTotlInsrTot;
	
 
	@SuppressWarnings("deprecation")
	public void Execute()  {
		backgroundInstanceClass appinstance = (backgroundInstanceClass)backgroundInstanceClass.getInstance();
		if (appinstance.getExcute() == false)
			return; 
		
		System.out.println ("장애 가져오기 시작");		
		
		try { 
			
			int sqlInsertSuccess = 0;
			int sqlUpdateSuccess = 0;
			
			//=================================장애==========================================
		    

		    // 오수 장애 max seq 가져오기(관제DB)
		    String max_seq = "0";
		    try {
		    	max_seq = fecTotlInsr.fecGetTroblMaxSeq();
		    	if (max_seq == null)
		    		max_seq = "1";
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println ("오수 장애 max seq 가져오기 실패");
			}
		    
		   // 오수 장애 데이터 가져오기(시설물DB)
		    List<fecSvarVO> fecSvarVOList = null;
		    try {
		    	fecSvarVOList = fecTotlInsrFclt.fecGetTroblSvar();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println ("오수 장애 데이터 가져오기 실패");
			}	 
	 	   
	 	   
	 	  // 사면 장애 max seq 가져오기(관제DB)	 	   
		    String max_slope_seq = "0";
		    try {
		    	max_slope_seq = fecTotlInsr.fecGetTroblSlpMaxSeq();
		    	if (max_slope_seq == null)
		    		max_slope_seq = "1";
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println ("사면 장애 max seq 가져오기 실패");
			}
		    
		   // 사면 장애 데이터 가져오기(통합DB)
		    List<fecSlpVO> fecSlpVOList = null;
		    try {
		    	fecSlpVOList = fecTotlInsrTot.fecGetTroblSlp();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println ("사면 장애 데이터 가져오기 실패");
			}
		  
		    
		    fecTotlInsr.getSqlMapClient().startTransaction();
			fecTotlInsr.getSqlMapClient().startBatch(); 
		    
		    // 오수 장애 데이터 추가(관제 DB)
	 	    try {
	 	    	sqlInsertSuccess = fecTotlInsr.fecInsertTroblSvarList(fecSvarVOList, max_seq);
	 		} catch (Exception e) {
	 			// TODO Auto-generated catch block
	 			e.printStackTrace();
	 			System.out.println ("오수 장애 데이터 추가 실패");
	 		}
	 	   
		    
		   // 사면 장애 데이터 추가(관제 DB)
	 	    try {
	 	    	sqlInsertSuccess = fecTotlInsr.fecInsertTroblSlpList(fecSlpVOList, max_slope_seq);
	 		} catch (Exception e) {
	 			// TODO Auto-generated catch block
	 			e.printStackTrace();
	 			System.out.println ("사면 장애 데이터 추가 실패");
	 		}
 	   
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
	}
}