package egovframework.com.sdtic.ifcrs.service;

import java.util.List;

/**
 * @Class Name :  IfcRlayService.java
 * @Description : IfcRlayService Class
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
public interface IfcRlayService {

    // 인프라 수집/중계 서버
    public List<IfcRlayVO> ifcRlayServerAjax(IfcRlayVO ifcRlayVO) throws Exception;
}
