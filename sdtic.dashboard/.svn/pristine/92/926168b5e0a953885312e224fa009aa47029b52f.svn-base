package egovframework.com.sdtic.bucrs.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.TransactionException;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmm.service.impl.EgovHiportalComAbstractDAO;
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
@Repository("bucHiportalDAO")
public class BucHiportalDAO extends EgovHiportalComAbstractDAO {
    
    // 비즈니스 공통 헬프데스크 처리현황 DB연동 화면
    @SuppressWarnings("unchecked")
    public List<BucCmmnVO> bucCmmnHelpdeskdbAjax(BucCmmnVO bucCmmnVO) throws Exception {
        return (List<BucCmmnVO>) list("bucHiportalDAO.bucCmmnHelpdeskdbAjax" , bucCmmnVO);
    }
}
