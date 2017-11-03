package egovframework.com.sdtic.ifcrs.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovTofacComAbstractDAO;
import egovframework.com.sdtic.ifcrs.service.IfcTofacVO;

 /**
 * @Class Name :  ifcTofacDAO.java
 * @Description : ifcTofacDAO Class
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
@Repository("ifcTofacDAO")
public class IfcTofacDAO extends EgovTofacComAbstractDAO {

    //인프라 외부연계
    @SuppressWarnings("unchecked")
    public List<IfcTofacVO> ifcMainExtrlcntcTofacAjax(IfcTofacVO ifcTofacVO) throws Exception {
        return (List<IfcTofacVO>) list("ifcTofacDAO.ifcMainExtrlcntcTofacAjax" , ifcTofacVO);
    }
    
    //컨테이너 에러 로그 수집
    @SuppressWarnings("unchecked")
    public List<IfcTofacVO> ifcConErrLogColctAjax(IfcTofacVO ifcTofacVO) throws Exception {
    	System.out.println("ifcConErrLogColctAjax");
        return (List<IfcTofacVO>) list("ifcTofacDAO.ifcConErrLogColctAjax" , ifcTofacVO);
    }
}


