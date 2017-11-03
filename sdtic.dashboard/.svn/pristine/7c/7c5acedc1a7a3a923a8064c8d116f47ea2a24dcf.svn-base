package egovframework.com.sdtic.ifcrs.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.sdtic.ifcrs.service.IfcUnitService;
import egovframework.com.sdtic.ifcrs.service.IfcUnitVO;
import egovframework.com.sdtic.main.service.MainCmmnVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * @Class Name :  IfcUnitServiceImpl.java
 * @Description : IfcUnitServiceImpl Class
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

@Service("ifcUnitService")
public class IfcUnitServiceImpl extends EgovAbstractServiceImpl implements IfcUnitService {

    // TODO ibatis 사용
    @Resource(name="ifcUnitDAO")
    private IfcUnitDAO ifcUnitDAO;

    // 단위업무별 IT인프라
    @Override
    public List<IfcUnitVO> ifcUnitAjax(IfcUnitVO ifcUnitVO) throws Exception {
        return ifcUnitDAO.ifcUnitAjax(ifcUnitVO);
    }
    
    // 단위업무별 IT인프라 설정 - 주제영역
    @Override
    public List<IfcUnitVO> ifcUnitGrid1Ajax(IfcUnitVO ifcUnitVO) throws Exception {
        return ifcUnitDAO.ifcUnitGrid1Ajax(ifcUnitVO);
    }
    
    // 단위업무별 IT인프라 설정 - 업무
    @Override
    public List<IfcUnitVO> ifcUnitGrid2Ajax(IfcUnitVO ifcUnitVO) throws Exception {
        return ifcUnitDAO.ifcUnitGrid2Ajax(ifcUnitVO);
    }
    
    // 단위업무별 IT인프라 설정 - 업무 입력 액션
    @Override
    public void ifcUnitAddGrid2Ajax(IfcUnitVO ifcUnitVO) throws Exception {
    	String unit = ifcUnitVO.getUnit();
    	String unit_name = ifcUnitVO.getUnit_name();
    	String unit_order = ifcUnitVO.getUnit_order();
    	String gubun = ifcUnitVO.getGubun();
    	String gubun_name = ifcUnitVO.getGubun_name();
    	String gubun_order = ifcUnitVO.getGubun_order();
    	String server_gubun = ifcUnitVO.getServer_gubun();
    	String hostname = ifcUnitVO.getHostname();
    	String dual = ifcUnitVO.getDual();
    	
    	String[] server_gubun_arr = server_gubun.split("\\|");
    	String[] hostname_arr = hostname.split("\\|");
    	String[] dual_arr = null;
    	if(!("|".equals(dual) || "".equals(dual))){
    		dual_arr = dual.split("\\|");
    	}
    	
    	IfcUnitVO ifcUnitVOTmp;

    	for(int i=0;i<server_gubun_arr.length;i++){
    		ifcUnitVOTmp = new IfcUnitVO();
    		
    		ifcUnitVOTmp.setUnit(unit);
    		ifcUnitVOTmp.setUnit_name(unit_name);
    		ifcUnitVOTmp.setUnit_order(unit_order);
    		ifcUnitVOTmp.setGubun(gubun);
    		ifcUnitVOTmp.setGubun_name(gubun_name);
    		ifcUnitVOTmp.setGubun_order(gubun_order);
    		ifcUnitVOTmp.setServer_gubun(server_gubun_arr[i]);
    		ifcUnitVOTmp.setHostname(hostname_arr[i]);
    		if(dual_arr != null){
    			ifcUnitVOTmp.setDual(dual_arr[i]);
    		}
        	
    		ifcUnitDAO.ifcUnitAddGrid3Ajax(ifcUnitVOTmp);
    	}
    }
    
    // 단위업무별 IT인프라 설정 - 업무 상세조회
    @Override
    public IfcUnitVO ifcUnitGrid2DetailAjax(IfcUnitVO ifcUnitVO) throws Exception {
    	return ifcUnitDAO.ifcUnitGrid2DetailAjax(ifcUnitVO);
    }
    
    // 단위업무별 IT인프라 설정 - 업무 수정 액션
    @Override
    public void ifcUnitModGrid2Ajax(IfcUnitVO ifcUnitVO) throws Exception {
    	ifcUnitDAO.ifcUnitModGrid2Ajax(ifcUnitVO);
    }

    // 단위업무별 IT인프라 설정 - 업무 삭제 액션
    @Override
    public void ifcUnitDelGrid2Ajax(IfcUnitVO ifcUnitVO) throws Exception {
    	ifcUnitDAO.ifcUnitDelGrid2Ajax(ifcUnitVO);
    }
    
    // 단위업무별 IT인프라 설정 - 서버
    @Override
    public List<IfcUnitVO> ifcUnitGrid3Ajax(IfcUnitVO ifcUnitVO) throws Exception {
        return ifcUnitDAO.ifcUnitGrid3Ajax(ifcUnitVO);
    }
    
    // 단위업무별 IT인프라 설정 - 서버 입력 액션
    @Override
    public void ifcUnitAddGrid3Ajax(IfcUnitVO ifcUnitVO) throws Exception {
    	ifcUnitDAO.ifcUnitAddGrid3Ajax(ifcUnitVO);
    }
    
    // 단위업무별 IT인프라 설정 - 서버 상세조회
    @Override
    public IfcUnitVO ifcUnitGrid3DetailAjax(IfcUnitVO ifcUnitVO) throws Exception {
    	return ifcUnitDAO.ifcUnitGrid3DetailAjax(ifcUnitVO);
    }
    
    // 단위업무별 IT인프라 설정 - 서버 수정 액션
    @Override
    public void ifcUnitModGrid3Ajax(IfcUnitVO ifcUnitVO) throws Exception {
    	ifcUnitDAO.ifcUnitModGrid3Ajax(ifcUnitVO);
    }

    // 단위업무별 IT인프라 설정 - 서버 삭제 액션
    @Override
    public void ifcUnitDelGrid3Ajax(IfcUnitVO ifcUnitVO) throws Exception {
    	ifcUnitDAO.ifcUnitDelGrid3Ajax(ifcUnitVO);
    }
    
    // 단위업무별 IT인프라
    @Override
    public List<IfcUnitVO> ifcUnitTroblAjax(IfcUnitVO ifcUnitVO) throws Exception {
        return ifcUnitDAO.ifcUnitTroblAjax(ifcUnitVO);
    }
}
