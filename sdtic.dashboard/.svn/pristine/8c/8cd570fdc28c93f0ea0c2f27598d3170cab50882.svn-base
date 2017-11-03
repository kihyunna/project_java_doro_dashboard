package egovframework.com.sdtic.ifcrs.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import egovframework.com.sdtic.ifcrs.service.IfcWebService;
import egovframework.com.sdtic.ifcrs.service.IfcWebVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * @Class Name :  IfcWebServiceImpl.java
 * @Description : IfcWebServiceImpl Class
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

@Service("ifcWebService")
public class IfcWebServiceImpl extends EgovAbstractServiceImpl implements IfcWebService {

    // TODO ibatis 사용
    @Resource(name="ifcWebDAO")
    private IfcWebDAO ifcWebDAO;

    // 인프라 WEB/WAS 서버
    @Override
    public List<IfcWebVO> ifcWebServerAjax(IfcWebVO ifcWebVO) throws Exception {
        return ifcWebDAO.ifcWebServerAjax(ifcWebVO);
    }

    // 인프라 WEB/WAS 성능
    @Override
    public List<IfcWebVO> ifcWebPrfomncAjax(IfcWebVO ifcWebVO) throws Exception {
        return ifcWebDAO.ifcWebPrfomncAjax(ifcWebVO);
    }
    
    // 클라우드(WEB/WAS)
    @Override
    public List<IfcWebVO> mainCloudWebWasAjax(IfcWebVO ifcWebVO) throws Exception {
        return ifcWebDAO.mainCloudWebWasAjax(ifcWebVO);
    }
}
