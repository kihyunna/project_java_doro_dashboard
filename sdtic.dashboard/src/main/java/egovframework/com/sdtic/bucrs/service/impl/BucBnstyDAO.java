package egovframework.com.sdtic.bucrs.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovTofacComAbstractDAO;
import egovframework.com.sdtic.bucrs.service.BucBnstyVO;

 /**
 * @Class Name :  BucBnstyDAO.java
 * @Description : BucBnstyDAO Class
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
@Repository("bucBnstyDAO")
public class BucBnstyDAO extends EgovTofacComAbstractDAO {

    
    // 비즈니스 건설상단 계획대비공정율 화면
    @SuppressWarnings("unchecked")
    public List<BucBnstyVO> bucBnstyRtAjax(BucBnstyVO bucBnstyVO) throws Exception {
        return (List<BucBnstyVO>) list("bucBnstyDAO.bucBnstyRtAjax" , bucBnstyVO);
    }
    
    // 비즈니스 건설상단 누적접속자 화면
    @SuppressWarnings("unchecked")
    public List<BucBnstyVO> bucBnstyAccmltConectrAjax(BucBnstyVO bucBnstyVO) throws Exception {
        return (List<BucBnstyVO>) list("bucBnstyDAO.bucBnstyAccmltConectrAjax" , bucBnstyVO);
    }
    
    //비즈니스 건설 건설현황 화면
    public List<BucBnstyVO> bucBnstyPlaceAjax(BucBnstyVO bucBnstyVO) throws Exception {
        return (List<BucBnstyVO>) list("bucBnstyDAO.bucBnstyPlaceAjax" , bucBnstyVO);
    }
    
    // 비즈니스 건설상단 계획대비공정율 db연동 화면
    @SuppressWarnings("unchecked")
    public List<BucBnstyVO> bucBnstyRtdbAjax(BucBnstyVO bucBnstyVO) throws Exception {
        return (List<BucBnstyVO>) list("bucBnstyDAO.bucBnstyRtdbAjax" , bucBnstyVO);
    }
    
    // 비즈니스 건설상단 누적접속자 db연동 화면
    @SuppressWarnings("unchecked")
    public List<BucBnstyVO> bucBnstyAccmltConectrdbAjax(BucBnstyVO bucBnstyVO) throws Exception {
        return (List<BucBnstyVO>) list("bucBnstyDAO.bucBnstyAccmltConectrdbAjax" , bucBnstyVO);
    }
    
    //비즈니스 건설현장 현황 db연동 화면
    public List<BucBnstyVO> bucBnstyPlacedbAjax(BucBnstyVO bucBnstyVO) throws Exception {
        return (List<BucBnstyVO>) list("bucBnstyDAO.bucBnstyPlacedbAjax" , bucBnstyVO);
    }
    
    
    
}


