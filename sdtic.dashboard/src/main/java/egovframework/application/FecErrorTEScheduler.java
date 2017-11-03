package egovframework.application;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import egovframework.com.sdtic.fecrs.service.fecElrmVO;
import egovframework.com.sdtic.fecrs.service.fecTunnelVO;
import egovframework.com.sdtic.fecrs.service.impl.fecTotlInsrDAO;
import egovframework.com.sdtic.fecrs.service.impl.fecTotlInsrFcltDAO;

@Component
public class FecErrorTEScheduler {
	
	@Autowired
	private fecTotlInsrDAO fecTotlInsr;
	@Autowired
	private fecTotlInsrFcltDAO fecTotlInsrFclt;
	
	@SuppressWarnings("deprecation")
	public void Execute() {
		backgroundInstanceClass appinstance = (backgroundInstanceClass)backgroundInstanceClass.getInstance();
		if (appinstance.getExcute() == false)
			return; 
		
		System.out.println ("장애 가져오기 시작");
				
		try { 
			
			int sqlInsertSuccess = 0;
			int sqlUpdateSuccess = 0;
			
			//=================================장애==========================================
		    // 터널 장애 max seq 가져오기(관제DB)
		    String max_Tunnelseq = "0";
		    try {
		    	max_Tunnelseq = fecTotlInsr.fecGetTroblTunnelMaxSeq();
		    	if (max_Tunnelseq == null)
		    		max_Tunnelseq = "1";
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println ("터널 max seq 가져오기 실패");
			}
		    
		   // 터널 장애 데이터 가져오기(시설물DB)
		    List<fecTunnelVO> fecTunnelVOList = null;
		    try {
		    	fecTunnelVOList = fecTotlInsrFclt.fecGetTroblTunnel();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println ("터널 장애 데이터 가져오기 실패");
			}	
	 	   
	 	// 전기(터널/영업소) 장애 max seq 가져오기(관제DB)
		    String max_Elrmseq = "0";
		    try {
		    	max_Elrmseq = fecTotlInsr.fecGetTroblElrmMaxSeq();
		    	if (max_Elrmseq == null)
		    		max_Elrmseq = "1";
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println ("전기(터널/영업소) max seq 가져오기 실패");
			}
		    
		   // 전기(터널/영업소) 장애 데이터 가져오기(시설물DB)
		    List<fecElrmVO> fecElrmVOList = null;
		    try {
		    	fecElrmVOList = fecTotlInsrFclt.fecGetTroblElrm();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println ("전기(터널/영업소) 장애 데이터 가져오기 실패");
			}
		    
	 	   
	 	   // 전기(가로등/조명탑) 장애 max seq 가져오기(관제DB)
		    String max_Dstbxseq = "0";
		    try {
		    	max_Dstbxseq = fecTotlInsr.fecGetTroblDstbxMaxSeq();
		    	if (max_Dstbxseq == null)
		    		max_Dstbxseq = "1";
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println ("전기(가로등/조명탑) 장애 max seq 가져오기 실패");
				return;
			}
		    
		   // 전기(가로등/조명탑) 장애 데이터 가져오기(시설물DB)
		    List<fecElrmVO> fecElrmVOList2 = null;
		    try {
		    	fecElrmVOList2 = fecTotlInsrFclt.fecGetTroblDstbx();	    	
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println ("전기(가로등/조명탑) 장애 데이터 가져오기 실패");
			}
		    
		    
		    
		    fecTotlInsr.getSqlMapClient().startTransaction();
			fecTotlInsr.getSqlMapClient().startBatch(); 
			
			
		    // 터널 장애 데이터 추가(관제 DB)
	 	    try { 
	 	    	fecTotlInsr.fecInsertTroblTunnelList(fecTunnelVOList, max_Tunnelseq);
	 		} catch (Exception e) {
	 			// TODO Auto-generated catch block
	 			e.printStackTrace();
	 			System.out.println ("터널 장애 데이터 추가 실패");
	 		} 	 
	 	    
		    
		   // 전기(터널/영업소) 장애 데이터 추가(관제 DB)
	 	    try { 	    	
	 	    	sqlInsertSuccess = fecTotlInsr.fecInsertTroblElrmList(fecElrmVOList, max_Elrmseq);
	 		} catch (Exception e) {
	 			// TODO Auto-generated catch block
	 			e.printStackTrace();
	 			System.out.println ("전기(터널/영업소) 장애 데이터 추가 실패");
	 		} 	
		    
		   // 전기(가로등/조명탑) 장애 데이터 추가(관제 DB)
	 	    try {
	 	    	sqlInsertSuccess = fecTotlInsr.fecInsertTroblDstbxList(fecElrmVOList2, max_Dstbxseq);
	 		} catch (Exception e) {
	 			// TODO Auto-generated catch block
	 			e.printStackTrace();
	 			System.out.println ("전기(가로등/조명탑) 장애 데이터 추가 실패");
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