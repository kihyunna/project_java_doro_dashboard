package egovframework.com.sdtic.ifcrs.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.sdtic.ifcrs.service.IfcMainService;
import egovframework.com.sdtic.ifcrs.service.IfcMainVO;
import egovframework.com.sdtic.ifcrs.service.IfcTofacVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * @Class Name :  ifcMainServiceImpl.java
 * @Description : ifcMainServiceImpl Class
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

@Service("ifcMainService")
public class IfcMainServiceImpl extends EgovAbstractServiceImpl implements IfcMainService {

    // TODO ibatis 사용
    @Resource(name="ifcMainDAO")
    private IfcMainDAO ifcMainDAO;
    
    @Resource(name="ifcTofacDAO")
    private IfcTofacDAO ifcTofacDAO;

    //인프라 매인 서버
    @Override
    public List<IfcMainVO> ifcMainServerAjax(IfcMainVO ifcMainVO) throws Exception {
        return ifcMainDAO.ifcMainServerAjax(ifcMainVO);
    }

    //인프라 외부연계
    @Override
    public List<IfcTofacVO> ifcMainExtrlcntcTofacAjax(IfcTofacVO ifcTofacVO) throws Exception {
        return ifcTofacDAO.ifcMainExtrlcntcTofacAjax(ifcTofacVO);
    }
    
    //인프라 외부연계
    @Override
    public List<IfcMainVO> ifcMainExtrlcntcAjax(IfcMainVO ifcMainVO) throws Exception {
        return ifcMainDAO.ifcMainExtrlcntcAjax(ifcMainVO);
    }
    
    //이벤트 리스트
    @Override
    public List<IfcMainVO> ifcMainEventListAjax(IfcMainVO ifcMainVO) throws Exception {
        return ifcMainDAO.ifcMainEventListAjax(ifcMainVO);
    }
    
    //인프라 매인 DB
    @Override
    public List<IfcMainVO> ifcMainDbDpmAjax(IfcMainVO ifcMainVO) throws Exception {
        return ifcMainDAO.ifcMainDbDpmAjax(ifcMainVO);
    }
    
    //임계치 조회
    @Override
    public List<IfcMainVO> ifcMainLimitAjax(IfcMainVO ifcMainVO) throws Exception {
        return ifcMainDAO.ifcMainLimitAjax(ifcMainVO);
    }
    
    //이벤트 발생
    @Override
    public List<IfcMainVO> ifcMainEventLineAjax(IfcMainVO ifcMainVO) throws Exception {
        return ifcMainDAO.ifcMainEventLineAjax(ifcMainVO);
    }
    
    //이벤트 팝업(기본)
    @Override
    public List<IfcMainVO> ifcMainEventAjax(IfcMainVO ifcMainVO) throws Exception {
        return ifcMainDAO.ifcMainEventAjax(ifcMainVO);
    }
    
    //이벤트 팝업(현장)
    @Override
    public List<IfcMainVO> ifcMainEventSptAjax(IfcMainVO ifcMainVO) throws Exception {
        return ifcMainDAO.ifcMainEventSptAjax(ifcMainVO);
    }
    
    //이벤트 팝업(WEB)
    @Override
    public List<IfcMainVO> ifcMainEventWebAjax(IfcMainVO ifcMainVO) throws Exception {
        return ifcMainDAO.ifcMainEventWebAjax(ifcMainVO);
    }
    
    //이벤트 팝업(DB)
    @Override
    public List<IfcMainVO> ifcMainEventDbAjax(IfcMainVO ifcMainVO) throws Exception {
        return ifcMainDAO.ifcMainEventDbAjax(ifcMainVO);
    }
    
    //이벤트 상황
    @Override
    public List<IfcMainVO> ifcMainEventLogListAjax(IfcMainVO ifcMainVO) throws Exception {
        return ifcMainDAO.ifcMainEventLogListAjax(ifcMainVO);
    }
    
    //인프라 장애보고서1
    @Override
    public List<IfcMainVO> ifcMainEventReport1Ajax(IfcMainVO ifcMainVO) throws Exception {
        return ifcMainDAO.ifcMainEventReport1Ajax(ifcMainVO);
    }
    
    //인프라 장애보고서2
    @Override
    public List<IfcMainVO> ifcMainEventReport2Ajax(IfcMainVO ifcMainVO) throws Exception {
        return ifcMainDAO.ifcMainEventReport2Ajax(ifcMainVO);
    }
}
