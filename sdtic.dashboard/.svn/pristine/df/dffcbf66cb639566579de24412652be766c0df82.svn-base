package egovframework.com.sdtic.ifcrs.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import egovframework.com.sdtic.ifcrs.service.IfcRlayService;
import egovframework.com.sdtic.ifcrs.service.IfcRlayVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * @Class Name :  IfcRlayServiceImpl.java
 * @Description : IfcRlayServiceImpl Class
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

@Service("ifcRlayService")
public class IfcRlayServiceImpl extends EgovAbstractServiceImpl implements IfcRlayService {

    // TODO ibatis 사용
    @Resource(name="ifcRlayDAO")
    private IfcRlayDAO ifcRlayDAO;

    // 인프라 수집/중계 서버
    @Override
    public List<IfcRlayVO> ifcRlayServerAjax(IfcRlayVO ifcRlayVO) throws Exception {
        return ifcRlayDAO.ifcRlayServerAjax(ifcRlayVO);
    }
}

