package egovframework.application;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import egovframework.com.sdtic.fecrs.service.impl.fecTotlInsrDAO;

@Component
public class FecDeleteDataScheduler{
	
	@Autowired
	private fecTotlInsrDAO fecTotlInsr;
	
	@SuppressWarnings("deprecation")
	public void Execute() {		
//		backgroundInstanceClass appinstance = (backgroundInstanceClass)backgroundInstanceClass.getInstance();
//		if (appinstance.getExcute() == false)
//			return; 
		
//		appinstance.setExcute(false);
		System.out.println ("한달전 데이터 삭제");
		
		int nDate = 31;//31일전 데이터 삭제
		int nSeq = 8640;//5분에 한번식 증가 하는 seq 한달에 8640 생성
		
		
		try { 
			fecTotlInsr.getSqlMapClient().startTransaction();
			fecTotlInsr.getSqlMapClient().startBatch(); 
			
			// 터널 이벤트 테이블 데이터 삭제(관제DB)
		    try {
				fecTotlInsr.fecDeleteTunnelEventData(nDate);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				
			}
		    
		    // 전기 이벤트 테이블 데이터 삭제(관제DB)
		    try {
				fecTotlInsr.fecDeleteElrmEventData(nDate);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				
			}
		    
		    // 사면 이벤트 테이블 데이터 삭제(관제DB)
		    try {
				fecTotlInsr.fecDeleteSlpEventData(nDate);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				
			}
		    
		    // 오수 이벤트 테이블 데이터 삭제(관제DB)
		    try {
				fecTotlInsr.fecDeleteSvarEventData(nDate);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				
			}
		    
		    // 터널 장애 테이블 데이터 삭제(관제DB)
		    try {
				fecTotlInsr.fecDeleteTunnelTroblData(nSeq);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				
			}	
		    
		    // 전기(영업소/터널)  장애 테이블 데이터 삭제(관제DB)
		    try {
				fecTotlInsr.fecDeleteElrmTroblData(nSeq);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				
			}
		    
		    // 전기(가로등/조명탑) 장애 테이블 데이터 삭제(관제DB)
		    try {
				fecTotlInsr.fecDeleteDstbxTroblData(nSeq);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				
			}
		    
		    // 사면 장애 테이블 데이터 삭제(관제DB)
		    try {
				fecTotlInsr.fecDeleteSlpTroblData(nSeq);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				
			}
		    
		    // 오수 장애 테이블 데이터 삭제(관제DB)
		    try {
				fecTotlInsr.fecDeleteSvarTroblData(nSeq);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				
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
//			appinstance.setExcute(true);
		}
		
//		appinstance.setExcute(true);
	    
	}
}