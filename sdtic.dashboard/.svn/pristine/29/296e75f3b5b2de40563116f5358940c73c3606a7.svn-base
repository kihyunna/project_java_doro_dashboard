package egovframework.com.sdtic.main.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * @Class Name :  MainFecService.java
 * @Description : MainFecService Class
 * @Modification Information
 * @
 * @ 수정일          수정자                       수정내용
 * @ -----------   ---------   -------------------------------
 * @ 2017. 06. 01    jkheo                       최초생성
 *
 * @author
 * @since
 * @version 1.0
 * @see
 *
 */

public interface MainFecService {
	
	//본부코드로 본부 셀렉트 박스 	
	public List<HashMap<String, String>> getHdqrTextWithHdqrCd(String Param) throws Exception;
	//본부코드로 지사 셀렉트 박스
	public List<HashMap<String, String>> getMtnofTextWithHdqrCd(String Param) throws Exception;
	//지사코드로 본부 셀렉트 박스
	public List<HashMap<String, String>> getHdqrTextWithMtnofCd(String Param) throws Exception;
	//지사코드로 지사 셀렉트 박스
	public List<HashMap<String, String>> getMtnofTextWithMtnofCd(String Param) throws Exception;
	
	// 본부별 리포트 출력
	public ArrayList<HashMap<String,String>> MainFecEventReportHdqr() throws Exception;
	// 지사별 리포트 출력
	public ArrayList<HashMap<String,String>> MainFecEventReportMtnof(String param) throws Exception;
	// 지사별 상세 리포트 출력
	public ArrayList<HashMap<String,String>> MainFecEventReportMtnofDetail(String param) throws Exception;
	// CCTV 리포트 출력
	public ArrayList<HashMap<String,String>> MainFecEventReportCctv() throws Exception;

}
