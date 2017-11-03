package egovframework.application;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import egovframework.com.sdtic.fecrs.service.fecDeptVO;
import egovframework.com.sdtic.fecrs.service.fecElrmVO;
import egovframework.com.sdtic.fecrs.service.fecSlpVO;
import egovframework.com.sdtic.fecrs.service.fecSvarVO;
import egovframework.com.sdtic.fecrs.service.fecTunnelVO;
import egovframework.com.sdtic.fecrs.service.impl.fecTotlInsrDAO;
import egovframework.com.sdtic.fecrs.service.impl.fecTotlInsrFcltDAO;
import egovframework.com.sdtic.fecrs.service.impl.fecTotlInsrTotDAO;

@Component
public class FecStateScheduler{
	
	//@Resource(name = "fecTotlInsrService")      private     fecTotlInsrService          fecTotlInsrService;
	@Autowired
	private fecTotlInsrDAO fecTotlInsr;
	@Autowired
	private fecTotlInsrFcltDAO fecTotlInsrFclt;
	@Autowired
	private fecTotlInsrTotDAO fecTotlInsrTot;
	
	@SuppressWarnings("deprecation")
	public void Execute() {	
//		backgroundInstanceClass appinstance = (backgroundInstanceClass)backgroundInstanceClass.getInstance();
//		if (appinstance.getExcute() == false)
//			return; 

		System.out.println ("가져오기 시작");
		try { 
			int sqlInsertSuccess = 0;
			int sqlUpdateSuccess = 0;
			
			// 24시간에 한번씩 01시에 실행
			// 본부 지사코드 가져오기
			//-- 본부 지사코드 테이블 전체삭제
		    try {
				sqlUpdateSuccess = fecTotlInsr.fecDeleteDept();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println ("부서 데이터 삭제 실패");
			}
		    
		    
	    	// 본부 지사코드 테이블 조회
	    	List<fecDeptVO> fecDeptVOList = null;
			try {
				fecDeptVOList = fecTotlInsrFclt.fecGetDept();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println ("부서 데이터 조회 실패");
			}
	    	
	    	// 본부 지사코드 테이블에 추가
	    	try {
				sqlInsertSuccess = fecTotlInsr.fecInsertDept(fecDeptVOList);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println ("부서 데이터 추가 실패");
			}
	    	System.out.println ("본부 끝");
	    	
	    	
	    	//터널
			//--총기기수
		    
	    	 // 터널 데이터 가져오기 (시설물 DB)
		    List<fecTunnelVO> fecTunnelVOList = null;
			try {
				fecTunnelVOList = fecTotlInsrFclt.fecGetTunnel();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println ("터널 데이터 조회 실패");
			}
		    
	    	//전기
			//--총기기수
		    
		    // 전기(터널/영업소) 데이터 가져오기 (시설물 DB)
		    List<fecElrmVO> fecElrmVOList = null;
			try {
				fecElrmVOList = fecTotlInsrFclt.fecGetElrm();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println ("전기(터널/영업소) 데이터 조회 실패");
			}
			
			// 전기(가로등/조명탑) 데이터 가져오기 (시설물 DB)
			List<fecElrmVO> fecElrmVOList1 = null;
	 		try {
	 			fecElrmVOList1 = fecTotlInsrFclt.fecGetDstbx();
	 		} catch (Exception e) {
	 			// TODO Auto-generated catch block
	 			e.printStackTrace();
	 			System.out.println ("전기(가로등/조명탑) 데이터 조회 실패");
	 		}
			
	 		//오수
			//--총기기수	    
		   
	    	// 오수 데이터 가져오기 (시설물 DB)
	    	List<fecSvarVO> fecSvarVOList = null;
			try {
				fecSvarVOList = fecTotlInsrFclt.fecGetSvar();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println ("오수 데이터 조회 실패");
			}
			
			// 사면 데이터 가져오기 (통합DB)
		    List<fecSlpVO> fecfecSlpVOList = null;
			try {
				fecfecSlpVOList = fecTotlInsrTot.fecGetSlp();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println ("사면 데이터 조회 실패");
			}
			
			
			fecTotlInsr.getSqlMapClient().startTransaction();
			fecTotlInsr.getSqlMapClient().startBatch(); 
			
			// 터널 테이블 삭제(관제DB)
		    try {
				sqlUpdateSuccess = fecTotlInsr.fecDeleteTunnel();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println ("터널 데이터 삭제 실패");
			}
			
		    // 터널 데이터 추가(관제 DB)
		    try {
		    	fecTotlInsr.fecInsertTunnelList(fecTunnelVOList);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println ("터널 데이터 추가 실패");
			}
			
		    // 전기(터널/영업소) 테이블 삭제(관제DB)
		    try {
				sqlUpdateSuccess = fecTotlInsr.fecDeleteElrm();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println ("전기(터널/영업소) 데이터 삭제 실패");
			}
	    	
		    
		    // 전기(터널/영업소) 데이터 추가(관제 DB)
		    try {
		    	sqlInsertSuccess = fecTotlInsr.fecInsertElrmList(fecElrmVOList);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println ("전기(터널/영업소) 데이터 추가 실패");
			}	
		   
		    System.out.println ("전기(터널/영업소) 끝");
		    // 전기(가로등/조명탑) 테이블 삭제(관제DB)
		    try {
				sqlUpdateSuccess = fecTotlInsr.fecDeleteDstbx();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println ("전기(가로등/조명탑) 데이터 삭제 실패");
			}
		    
			// 전기(가로등/조명탑) 데이터 추가(관제 DB)
		    try { 	
		    	sqlInsertSuccess = fecTotlInsr.fecInsertDstbxList(fecElrmVOList1);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println ("전기(가로등/조명탑) 데이터 추가 실패");
			}	 
			
			// 오수 테이블 삭제(관제DB)
		    try {
				sqlUpdateSuccess = fecTotlInsr.fecDeleteSvar();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println ("오수 데이터 삭제 실패");
			}
		    
			// 오수 데이터 추가(관제 DB)
		    try {
		    	sqlInsertSuccess = fecTotlInsr.fecInsertSvarList(fecSvarVOList);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println ("오수 데이터 추가 실패");
			}	
			
		    // 사면 테이블 삭제(관제DB)
		    try {
				sqlUpdateSuccess = fecTotlInsr.fecDeleteSlp();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println ("사면 데이터 삭제 실패");
			}
			
		    // 사면 데이터 추가(관제 DB)
		    try {
		    	fecTotlInsr.fecInsertSlpList(fecfecSlpVOList);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println ("사면 데이터 추가 실패");
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