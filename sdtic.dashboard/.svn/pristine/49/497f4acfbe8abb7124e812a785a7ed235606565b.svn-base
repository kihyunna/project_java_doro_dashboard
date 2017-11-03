package egovframework.com.sdtic.ifcrs.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovMysqlInfraSmsAbstractDAO;
import egovframework.com.sdtic.ifcrs.service.IfcSmsVO;

 /**
 * @Class Name :  ifcSmsDAO.java
 * @Description : ifcSmsDAO Class
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
@Repository("ifcSmsDAO")
public class IfcSmsDAO extends EgovMysqlInfraSmsAbstractDAO {

    //SMS 수집
    @SuppressWarnings("unchecked")
    public List<IfcSmsVO> ifcSmsColctAjax(IfcSmsVO ifcSmsVO) throws Exception {
    	System.out.println("ifcSmsColctAjax");
        return (List<IfcSmsVO>) list("ifcSmsDAO.ifcSmsColctAjax" , ifcSmsVO);
    }
}


