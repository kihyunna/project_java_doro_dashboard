package egovframework.com.sdtic.bucrs.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.TransactionException;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.sdtic.bucrs.service.BucCmmnVO;
import egovframework.com.sdtic.bucrs.service.BucFcltsVO;

 /**
 * @Class Name :  BucFcltsDAO.java
 * @Description : BucFcltsDAO Class
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
@Repository("bucFcltsCtlDAO")
public class BucFcltsCtlDAO extends EgovComAbstractDAO {

	// 비즈니스 시설물 누적접속자 화면(db연동)
    @SuppressWarnings("unchecked")
    public List<BucFcltsVO> bucFcltsRtAjax(BucFcltsVO bucFcltsVO) throws Exception {
        return (List<BucFcltsVO>) list("bucFcltsCtlDAO.bucFcltsRtAjax" , bucFcltsVO);
    }
    
    // 비즈니스 공통 데이터 증가율 DB연동 화면
    @SuppressWarnings("unchecked")
    public List<BucFcltsVO> bucCmmnDataicrrtdbAjax(BucFcltsVO bucFcltsVO) throws Exception {
        return (List<BucFcltsVO>) list("bucFcltsCtlDAO.bucCmmnDataicrrtdbAjax" , bucFcltsVO);
    }
}


