package egovframework.com.sdtic.bucrs.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovResearchinfoComAbstractDAO;
import egovframework.com.sdtic.bucrs.service.BucCmmnVO;

 /**
 * @Class Name :  BucCmmnDAO.java
 * @Description : BucCmmnDAO Class
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
@Repository("bucResearchinfoDAO")
public class BucResearchinfoDAO extends EgovResearchinfoComAbstractDAO {
    // 비즈니스 공통 기술자문 처리실적 DB연동 화면
    @SuppressWarnings("unchecked")
    public List<BucCmmnVO> bucCmmnTechAdvPrcssdbAjax(BucCmmnVO bucCmmnVO) throws Exception {
        return (List<BucCmmnVO>) list("bucResearchinfoDAO.bucCmmnTechAdvPrcssdbAjax" , bucCmmnVO);
    }
}
