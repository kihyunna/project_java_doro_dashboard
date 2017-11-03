package egovframework.com.sdtic.main.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.TransactionException;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.sdtic.main.service.MainCmmnVO;

 /**
 * @Class Name :  MainFecDAO.java
 * @Description : MainFecDAO Class
 * @Modification Information
 * @
 * @ 수정일          수정자                       수정내용
 * @ -----------   ---------   -------------------------------
 * @ 2017. 06. 01    jkheo                        최초생성
 *
 * @author
 * @since
 * @version 1.0
 * @see
 *
 */
@Repository("MainFecDAO")
public class MainFecDAO extends EgovComAbstractDAO {
	
    @SuppressWarnings("unchecked")
	public List<HashMap<String, String>> getHdqrTextWithHdqrCd(String Param) throws Exception {
        return (List<HashMap<String, String>>) list("MainFecDAO.getHdqrTextWithHdqrCd" , Param);
    }
    
    @SuppressWarnings("unchecked")
    public List<HashMap<String, String>> getMtnofTextWithHdqrCd(String Param) throws Exception {
        return (List<HashMap<String, String>>) list("MainFecDAO.getMtnofTextWithHdqrCd" , Param);
    }
    
    @SuppressWarnings("unchecked")
	public List<HashMap<String, String>> getHdqrTextWithMtnofCd(String Param) throws Exception {
        return (List<HashMap<String, String>>) list("MainFecDAO.getHdqrTextWithMtnofCd" , Param);
    }
    
    @SuppressWarnings("unchecked")
    public List<HashMap<String, String>> getMtnofTextWithMtnofCd(String Param) throws Exception {
        return (List<HashMap<String, String>>) list("MainFecDAO.getMtnofTextWithMtnofCd" , Param);
    }
    
    // 본부별 리포트 출력
    @SuppressWarnings("unchecked")
	public ArrayList<HashMap<String,String>> MainFecEventReportHdqr() throws Exception{
        return (ArrayList<HashMap<String, String>>) list("MainFecDAO.MainFecEventReportHdqr" , null);
    }
	// 지사별 리포트 출력
    @SuppressWarnings("unchecked")
	public ArrayList<HashMap<String,String>> MainFecEventReportMtnof(String param) throws Exception{
        return (ArrayList<HashMap<String, String>>) list("MainFecDAO.MainFecEventReportMtnof" , param);
    }
	// 지사별 상세 리포트 출력
    @SuppressWarnings("unchecked")
	public ArrayList<HashMap<String,String>> MainFecEventReportMtnofDetail(String param) throws Exception{
        return (ArrayList<HashMap<String, String>>) list("MainFecDAO.MainFecEventReportMtnofDetail" , param);
    }
	// CCTV 리포트 출력
    @SuppressWarnings("unchecked")
	public ArrayList<HashMap<String,String>> MainFecEventReportCctv() throws Exception{
        return (ArrayList<HashMap<String, String>>) list("MainFecDAO.MainFecEventReportCctv" , null);
    }
    
}


