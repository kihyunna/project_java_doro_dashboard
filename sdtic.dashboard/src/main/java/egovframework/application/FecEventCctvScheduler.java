package egovframework.application;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import egovframework.com.sdtic.fecrs.RTSP.RTSPcctvCheck;
import egovframework.com.sdtic.fecrs.service.fecCctvVO;
import egovframework.com.sdtic.fecrs.service.impl.fecTotlInsrDAO;
import egovframework.com.sdtic.fecrs.service.impl.fecTotlInsrTotDAO;

@Component
public class FecEventCctvScheduler {
	
	@Autowired
	private fecTotlInsrDAO fecTotlInsr;
	@Autowired
	private fecTotlInsrTotDAO fecTotlInsrTot;
		
	@SuppressWarnings("deprecation")
	public void Execute() {
		System.out.println (" 수도권본부 CCTV 이벤트 가져오기 시작");	
		
		boolean bEvent = false;
		try { 
			
			
			//=========CCTV 이벤트 =============
			// CCTV 테이블 조회(통합DB)
			
			List<fecCctvVO> list = null;
		    try {
		    	list = fecTotlInsrTot.checkCCTV("N01795");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println ("수도권본부 CCTV 테이블 조회 실패");
			}
		    
		   // CCTV 체크
		    try{
				String searchTableSQL = "";
				int errCnt = 0;
				
				for(int i = 0;i < list.size();i++){
					if (errCnt > 60)
						break;
					fecCctvVO Vo = list.get(i);
					
					String spin_intg_id = Vo.getSpin_intg_id();	
					String cctvUrl = "";//취득할 cctv url 초기화					

					//CCTV 체크
					RTSPcctvCheck cctvUrlChk = new RTSPcctvCheck(true); //CCTV체크 자바 -> true:실서버, false:테스트				
					String cctvIp = "10.108.88.84"; //현재 운영 중인 ip
					cctvUrlChk.setUser("hima");
					cctvUrlChk.setCameraId(spin_intg_id);
					cctvUrlChk.setRequestId("D1");
					cctvUrlChk.setResolution(" ");

					if ( cctvUrlChk.start() == 0) {
						String ccc = cctvUrlChk.getServiceUrl();
						System.out.println( "ccc = " + ccc );
						cctvUrl = replaceStr (ccc, cctvIp);
						System.out.println( "Change ServiceUrl <<<> :  " + cctvUrl );
						System.out.println( "ServiceUrl  :  " + cctvUrlChk.getServiceUrl() );
						System.out.println( "cctvUrl  :  " + cctvUrl );
					}
					else {
						System.out.println( "Error Msg  :  " + cctvUrlChk.getServiceUrl() );
						errCnt++;
					}
					
					System.out.println( "CCTV Count  :  " + cctvUrlChk.getServiceUrl() );
					
					Vo.setCctvurl(cctvUrl);
					list.add(i, Vo);
					
				}
			}
			catch(Exception e){  
				e.printStackTrace();
			}
			finally{    

			} 
		    
		    fecTotlInsr.getSqlMapClient().startTransaction();
			fecTotlInsr.getSqlMapClient().startBatch(); 
		    
			// CCTV 이벤트 데이터 삭제(관제 DB)
	 	    try { 
	 	    	fecTotlInsr.fecDeleteCctv("");
	 		} catch (Exception e) {
	 			// TODO Auto-generated catch block
	 			e.printStackTrace();
	 			System.out.println ("수도권본부 CCTV 이벤트 데이터 삭제 실패");
	 		}
		    
		    // CCTV 이벤트 데이터 추가(관제 DB)
	 	    try { 
	 	    	fecTotlInsr.fecInsertEventCctvList(list);
	 		} catch (Exception e) {
	 			// TODO Auto-generated catch block
	 			e.printStackTrace();
	 			System.out.println ("수도권본부 CCTV 이벤트 데이터 추가 실패");
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
			return;
		} finally{
			
		}
		
//		if (bEvent){
//			System.out.println ("수도권본부 CCTV 이벤트 발생");
//			AppSendToUxp appSendToUxp =  new AppSendToUxp();
//			appSendToUxp.SendDatatoUXP("EventCctv");	
//		}
	}
	
	public String replaceStr(String ori, String chg) {   
		String s2 = "";
		s2 = ori.replace("10.108.88.84", chg);
		return	s2;

	}
}