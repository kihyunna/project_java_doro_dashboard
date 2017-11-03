package egovframework.com.sdtic.ifcrs.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.sdtic.fecrs.service.impl.FacDBAbstractDAO;
import egovframework.com.sdtic.ifcrs.service.IfcSptColctVO;

 /**
 * @Class Name :  IfcSptDAO.java
 * @Description : IfcSptDAO Class
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
@Repository("ifcSptColctDAO")
public class IfcSptColctDAO extends FacDBAbstractDAO {
	
    // 터널 현장서버 가져오기
    @SuppressWarnings("unchecked")
    public List<IfcSptColctVO> ifcSptTnlServerAjax(IfcSptColctVO ifcSptColctVO) throws Exception {
        return (List<IfcSptColctVO>) list("IfcSptColctDAO.ifcSptTnlServerAjax" , ifcSptColctVO);
    }
}
