package egovframework.com.sdtic.bucrs.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovMysqlSmsAbstractDAO;
import egovframework.com.sdtic.bucrs.service.BucCmmnVO;

 /**
 * @Class Name :  BucSmsDAO.java
 * @Description : BucSmsDAO Class
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
@Repository("bucSmsDAO")
public class BucSmsDAO extends EgovMysqlSmsAbstractDAO {

	// 비즈니스 공통 SMS 발송현황 화면
    @SuppressWarnings("unchecked")
    public List<BucCmmnVO> bucCmmnSmssndngdbAjax(BucCmmnVO bucCmmnVO) throws Exception {
        return (List<BucCmmnVO>) list("bucSmsDAO.bucCmmnSmssndngdbAjax" , bucCmmnVO);
    }
    
    
}


