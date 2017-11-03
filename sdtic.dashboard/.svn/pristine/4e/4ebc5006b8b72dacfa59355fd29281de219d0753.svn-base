package egovframework.com.sdtic.ifcrs.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovInfraEsm246AbstractDAO;
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
@Repository("ifcEsm246DAO")
public class IfcEsm246DAO extends EgovInfraEsm246AbstractDAO {

    //SMS 수집
    @SuppressWarnings("unchecked")
    public List<IfcEsmVO> ifcEsm246ColctAjax(IfcEsmVO ifcEsmVO) throws Exception {
    	System.out.println("ifcEsm246ColctAjax");
        return (List<IfcEsmVO>) list("ifcEsm246DAO.ifcEsm246ColctAjax" , ifcEsmVO);
    }
}


