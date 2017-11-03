package egovframework.com.sdtic.ifcrs.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.sdtic.ifcrs.service.IfcRlayVO;
import egovframework.com.sdtic.ifcrs.service.IfcSptService;
import egovframework.com.sdtic.ifcrs.service.IfcSptVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * @Class Name :  IfcSptServiceImpl.java
 * @Description : IfcSptServiceImpl Class
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

@Service("ifcSptService")
public class IfcSptServiceImpl extends EgovAbstractServiceImpl implements IfcSptService {

    // TODO ibatis 사용
    @Resource(name="ifcSptDAO")
    private IfcSptDAO ifcSptDAO;

    // 인프라 현장 서버
    @Override
    public List<IfcSptVO> ifcSptServerAjax(IfcSptVO ifcSptVO) throws Exception {
        return ifcSptDAO.ifcSptServerAjax(ifcSptVO);
    }
    
    // 현장중계기
    @Override
    public List<IfcSptVO> mainSptRelayAjax(IfcSptVO ifcSptVO) throws Exception {
        return ifcSptDAO.mainSptRelayAjax(ifcSptVO);
    }

}