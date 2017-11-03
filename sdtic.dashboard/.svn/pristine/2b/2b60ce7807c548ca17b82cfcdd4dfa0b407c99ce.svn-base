package egovframework.com.sdtic.ifcrs.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import egovframework.com.sdtic.ifcrs.service.IfcDbService;
import egovframework.com.sdtic.ifcrs.service.IfcDbVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * @Class Name :  IfcDbServiceImpl.java
 * @Description : IfcDbServiceImpl Class
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

@Service("ifcDbService")
public class IfcDbServiceImpl extends EgovAbstractServiceImpl implements IfcDbService {

    // TODO ibatis 사용
    @Resource(name="ifcDbDAO")
    private IfcDbDAO ifcDbDAO;

   // 인프라 DB 통합
    @Override
    public List<IfcDbVO> ifcDbUnityAjax(IfcDbVO ifcDbVO) throws Exception {
        return ifcDbDAO.ifcDbUnityAjax(ifcDbVO);
    }

    // 인프라 DB 관제
    @Override
    public List<IfcDbVO> ifcDbCntrlAjax(IfcDbVO ifcDbVO) throws Exception {
        return ifcDbDAO.ifcDbCntrlAjax(ifcDbVO);
    }
    
    // 인프라 DB DPM1
    @Override
    public List<IfcDbVO> ifcDbDpm1Ajax(IfcDbVO ifcDbVO) throws Exception {
        return ifcDbDAO.ifcDbDpm1Ajax(ifcDbVO);
    }
    
    // 인프라 DB DPM2
    @Override
    public List<IfcDbVO> ifcDbDpm2Ajax(IfcDbVO ifcDbVO) throws Exception {
        return ifcDbDAO.ifcDbDpm2Ajax(ifcDbVO);
    }
    
    // 빅데이터분석#1
    @Override
    public List<IfcDbVO> mainBigData1Ajax(IfcDbVO ifcDbVO) throws Exception {
        return ifcDbDAO.mainBigData1Ajax(ifcDbVO);
    }
    
    // 빅데이터분석#2
    @Override
    public List<IfcDbVO> mainBigData2Ajax(IfcDbVO ifcDbVO) throws Exception {
        return ifcDbDAO.mainBigData2Ajax(ifcDbVO);
    }
    
    // 데이터베이스
    @Override
    public List<IfcDbVO> mainDatabaseAjax(IfcDbVO ifcDbVO) throws Exception {
        return ifcDbDAO.mainDatabaseAjax(ifcDbVO);
    }
}
