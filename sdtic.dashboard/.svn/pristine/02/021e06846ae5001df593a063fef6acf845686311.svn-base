package egovframework.com.sdtic.ifcrs.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovInfraEsm241AbstractDAO;
import egovframework.com.sdtic.ifcrs.service.IfcEsmVO;

 /**
 * @Class Name :  ifcEsmDAO.java
 * @Description : ifcEsmDAO Class
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
@Repository("ifcEsm241DAO")
public class IfcEsm241DAO extends EgovInfraEsm241AbstractDAO {

    //SMS 수집
    @SuppressWarnings("unchecked")
    public List<IfcEsmVO> ifcEsm241ColctAjax(IfcEsmVO ifcEsmVO) throws Exception {
    	System.out.println("ifcEsm241ColctAjax");
        return (List<IfcEsmVO>) list("ifcEsm241DAO.ifcEsm241ColctAjax" , ifcEsmVO);
    }
}


