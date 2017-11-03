package egovframework.com.sdtic.ifcrs.service;

import java.util.List;

/**
 * @Class Name :  IfcSptService.java
 * @Description : IfcSptService Class
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
public interface IfcSptService {

    // 인프라 현장 서버
    public List<IfcSptVO> ifcSptServerAjax(IfcSptVO ifcSptVO) throws Exception;
    
    // 현장중계기
    public List<IfcSptVO> mainSptRelayAjax(IfcSptVO ifcSptVO) throws Exception;

}
