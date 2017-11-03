package egovframework.com.sdtic.ifcrs.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.sdtic.ifcrs.service.IfcColctVO;
import egovframework.com.sdtic.ifcrs.service.IfcSptVO;

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
@Repository("ifcSptDAO")
public class IfcSptDAO extends EgovComAbstractDAO {
	
    // 전기 현장서버 가져오기
    @SuppressWarnings("unchecked")
    public List<IfcSptVO> ifcSptElcServerAjax(IfcSptVO ifcSptVO) throws Exception {
        return (List<IfcSptVO>) list("ifcSptDAO.ifcSptElcServerAjax" , ifcSptVO);
    }
    
    // 현장서버 수집 insert
    public void ifcAddSptColctAjax(IfcSptVO ifcSptVO) throws Exception {
    	insert("ifcSptDAO.ifcAddSptColctAjax", ifcSptVO); 
    }

    // 인프라 현장 서버
    @SuppressWarnings("unchecked")
    public List<IfcSptVO> ifcSptServerAjax(IfcSptVO ifcSptVO) throws Exception {
        return (List<IfcSptVO>) list("ifcSptDAO.ifcSptServerAjax" , ifcSptVO);
    }
    
    // 현장중계기
    @SuppressWarnings("unchecked")
    public List<IfcSptVO> mainSptRelayAjax(IfcSptVO ifcSptVO) throws Exception {
        return (List<IfcSptVO>) list("ifcSptDAO.mainSptRelayAjax" , ifcSptVO);
    }
}
