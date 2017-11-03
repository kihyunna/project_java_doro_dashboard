package egovframework.com.sdtic.bucrs.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.TransactionException;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmm.service.impl.EgovTofacComAbstractDAO;
import egovframework.com.sdtic.bucrs.service.BucDsgnVO;

 /**
 * @Class Name :  BucDsgnDAO.java
 * @Description : BucDsgnDAO Class
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
@Repository("bucDsgnDAO")
public class BucDsgnDAO extends EgovTofacComAbstractDAO {

    // 비즈니스 설계상단 누적접속자 화면
    @SuppressWarnings("unchecked")
    public List<BucDsgnVO> bucDsgnAccmltConectrAjax(BucDsgnVO bucDsgnVO) throws Exception {
        return (List<BucDsgnVO>) list("bucDsgnDAO.bucDsgnAccmltConectrAjax" , bucDsgnVO);
    }
    
    // 비즈니스 설계상단 설계도서 납품률  화면
    @SuppressWarnings("unchecked")
    public List<BucDsgnVO> bucDsgnRtAjax(BucDsgnVO bucDsgnVO) throws Exception {
        return (List<BucDsgnVO>) list("bucDsgnDAO.bucDsgnRtAjax" , bucDsgnVO);
    }
    
    // 비즈니스 설계 설계도서 반입반출 화면
    @SuppressWarnings("unchecked")
    public List<BucDsgnVO> bucDsgnDrawingInOutRateAjax(BucDsgnVO bucDsgnVO) throws Exception {
        return (List<BucDsgnVO>) list("bucDsgnDAO.bucDsgnDrawingInOutRateAjax" , bucDsgnVO);
    }
    
    // 비즈니스 설계 설계도서 납품현황 db연동 화면
    @SuppressWarnings("unchecked")
    public List<BucDsgnVO> bucDsgnBookdeliverdbAjax(BucDsgnVO bucDsgnVO) throws Exception {
        return (List<BucDsgnVO>) list("bucDsgnDAO.bucDsgnBookdeliverdbAjax" , bucDsgnVO);
    }
}


