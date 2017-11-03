package egovframework.com.sdtic.main.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.sdtic.main.service.MainFecService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * @Class Name :  MainFecServiceImpl.java
 * @Description : MainFecServiceImpl Class
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

@Service("MainFecService")
public class MainFecServiceImpl extends EgovAbstractServiceImpl implements MainFecService {

    // TODO ibatis 사용
    @Resource(name="MainFecDAO")
    private MainFecDAO mainFecDAO;

    @Override
    public List<HashMap<String, String>> getHdqrTextWithHdqrCd(String Param) throws Exception{
    	return mainFecDAO.getHdqrTextWithHdqrCd(Param);
    }
	
    @Override
	public List<HashMap<String, String>> getMtnofTextWithHdqrCd(String Param) throws Exception{
    	return mainFecDAO.getMtnofTextWithHdqrCd(Param);
    }
	
    @Override
	public List<HashMap<String, String>> getHdqrTextWithMtnofCd(String Param) throws Exception{
    	return mainFecDAO.getHdqrTextWithMtnofCd(Param);
    }
	
    @Override
	public List<HashMap<String, String>> getMtnofTextWithMtnofCd(String Param) throws Exception{
    	return mainFecDAO.getMtnofTextWithMtnofCd(Param);
    }
    
	// 본부별 리포트 출력
    @Override
	public ArrayList<HashMap<String,String>> MainFecEventReportHdqr() throws Exception{
    	return mainFecDAO.MainFecEventReportHdqr();
    }
	// 지사별 리포트 출력
    @Override
	public ArrayList<HashMap<String,String>> MainFecEventReportMtnof(String param) throws Exception{
    	return mainFecDAO.MainFecEventReportMtnof(param);
    }
	// 지사별 상세 리포트 출력
    @Override
	public ArrayList<HashMap<String,String>> MainFecEventReportMtnofDetail(String param) throws Exception{
    	return mainFecDAO.MainFecEventReportMtnofDetail(param);
    }
	// CCTV 리포트 출력
    @Override
	public ArrayList<HashMap<String,String>> MainFecEventReportCctv() throws Exception{
    	return mainFecDAO.MainFecEventReportCctv();
    }
}
