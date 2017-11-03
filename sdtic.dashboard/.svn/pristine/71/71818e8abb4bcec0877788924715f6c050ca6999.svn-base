package egovframework.com.sdtic.ifcrs.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.sdtic.ifcrs.service.IfcColctVO;
import egovframework.com.sdtic.ifcrs.service.IfcUnitVO;

 /**
 * @Class Name :  ifcMainDAO.java
 * @Description : ifcMainDAO Class
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
@Repository("ifcColctDAO")
public class IfcColctDAO extends EgovComAbstractDAO {

    //실호스트명 조회
    @SuppressWarnings("unchecked")
    public List<IfcColctVO> ifcRealHostnameAjax(IfcColctVO ifcColctVO) throws Exception {
        return (List<IfcColctVO>) list("ifcColctDAO.ifcRealHostnameAjax" , ifcColctVO);
    }
    
    //수집 insert
    public void ifcAddColctAjax(IfcColctVO ifcColctVO) throws Exception {
    	if(ifcColctVO.getCpu().length() > 3){
    		ifcColctVO.setCpu("");
    	}
    	if(ifcColctVO.getMem().length() > 3){
    		ifcColctVO.setMem("");
    	}
    	if(ifcColctVO.getDisk().length() > 3){
    		ifcColctVO.setDisk("");
    	}
    	insert("ifcColctDAO.ifcAddColctAjax", ifcColctVO); 
    }
    
    //수집 insert
    public void ifcAddConColctAjax(IfcColctVO ifcColctVO) throws Exception {
    	insert("ifcColctDAO.ifcAddConColctAjax", ifcColctVO); 
    }
}


