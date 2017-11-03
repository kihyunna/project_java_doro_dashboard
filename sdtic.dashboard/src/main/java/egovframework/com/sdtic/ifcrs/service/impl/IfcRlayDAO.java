package egovframework.com.sdtic.ifcrs.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.TransactionException;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.sdtic.ifcrs.service.IfcRlayVO;

 /**
 * @Class Name :  IfcRlayDAO.java
 * @Description : IfcRlayDAO Class
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
@Repository("ifcRlayDAO")
public class IfcRlayDAO extends EgovComAbstractDAO {

    // 인프라 수집/중계 서버
    @SuppressWarnings("unchecked")
    public List<IfcRlayVO> ifcRlayServerAjax(IfcRlayVO ifcRlayVO) throws Exception {
        return (List<IfcRlayVO>) list("ifcRlayDAO.ifcRlayServerAjax" , ifcRlayVO);
    }

}


