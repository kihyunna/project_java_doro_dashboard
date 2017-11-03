package egovframework.com.sdtic.ifcrs.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.TransactionException;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.sdtic.ifcrs.service.IfcWebVO;

 /**
 * @Class Name :  IfcWebDAO.java
 * @Description : IfcWebDAO Class
 * @Modification Information
 * @
 * @ 수정일          수정자                       수정내용
 * @ -----------   ---------   -------------------------------
 * @ 2017. 06. 01    jkheo                        최초생성
 *
 * @author
 * @since
 * @version 1.0
 * @see
 *
 */
@Repository("ifcWebDAO")
public class IfcWebDAO extends EgovComAbstractDAO {

    // 인프라 WEB/WAS 서버
    @SuppressWarnings("unchecked")
    public List<IfcWebVO> ifcWebServerAjax(IfcWebVO ifcWebVO) throws Exception {
        return (List<IfcWebVO>) list("ifcWebDAO.ifcWebServerAjax" , ifcWebVO);
    }

    // 인프라 WEB/WAS 성능
    @SuppressWarnings("unchecked")
    public List<IfcWebVO> ifcWebPrfomncAjax(IfcWebVO ifcWebVO) throws Exception {
        return (List<IfcWebVO>) list("ifcWebDAO.ifcWebPrfomncAjax" , ifcWebVO);
    }
    
    // 클라우드(WEB/WAS)
    @SuppressWarnings("unchecked")
    public List<IfcWebVO> mainCloudWebWasAjax(IfcWebVO ifcWebVO) throws Exception {
        return (List<IfcWebVO>) list("ifcWebDAO.mainCloudWebWasAjax" , ifcWebVO);
    }
}
