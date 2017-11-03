package egovframework.com.sdtic.bucrs.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovInfraEsm241AbstractDAO;
import egovframework.com.sdtic.bucrs.service.BucCollectEsmVO;
import egovframework.com.sdtic.bucrs.service.BucParamEsmVO;

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
@Repository("bucEsm241NasUseDiskDAO")
public class BucEsm241NasUseDiskDAO extends EgovInfraEsm241AbstractDAO {

    //Esm NAS 용량 수집
    @SuppressWarnings("unchecked")
    public List<BucCollectEsmVO> bucCollectEsm241NasUseDiskAjax(BucParamEsmVO bucParamEsmVO) throws Exception {
    	
        return (List<BucCollectEsmVO>) list("bucEsm241NasUseDiskDAO.bucCollectEsm241NasUseDiskAjax" , bucParamEsmVO);
    }
   
}


