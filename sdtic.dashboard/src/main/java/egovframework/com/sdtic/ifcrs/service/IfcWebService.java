package egovframework.com.sdtic.ifcrs.service;

import java.util.List;

/**
 * @Class Name :  IfcWebService.java
 * @Description : IfcWebService Class
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
public interface IfcWebService {

    // 인프라 WEB/WAS 서버
    public List<IfcWebVO> ifcWebServerAjax(IfcWebVO ifcWebVO) throws Exception;

    // 인프라 WEB/WAS 성능
    public List<IfcWebVO> ifcWebPrfomncAjax(IfcWebVO ifcWebVO) throws Exception;
    
    // 클라우드(WEB/WAS)
    public List<IfcWebVO> mainCloudWebWasAjax(IfcWebVO ifcWebVO) throws Exception;

}
