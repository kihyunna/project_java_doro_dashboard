package egovframework.com.sdtic.bucrs.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import egovframework.com.sdtic.bucrs.service.BucBnstyService;
import egovframework.com.sdtic.bucrs.service.BucBnstyVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * @Class Name :  BucBnstyServiceImpl.java
 * @Description : BucBnstyServiceImpl Class
 * @Modification Information
 * @
 * @ 수정일          수정자                       수정내용
 * @ -----------   ---------   -------------------------------
 * @ 2017. 06. 01    jkheo                       최초생성
 *
 * @author
 * @since
 * @version 1.0
 * @see
 *
 */

@Service("bucBnstyService")
public class BucBnstyServiceImpl extends EgovAbstractServiceImpl implements BucBnstyService {

    // TODO ibatis 사용
    @Resource(name="bucBnstyDAO")
    private BucBnstyDAO bucBnstyDAO;
    
    // 비즈니스 건설상단 계획대비공정율 화면
    @Override
    public List<BucBnstyVO> bucBnstyRtAjax(BucBnstyVO bucBnstyVO) throws Exception {
        return bucBnstyDAO.bucBnstyRtAjax(bucBnstyVO);
    }

    // 비즈니스 건설상단 누적접속자 화면
    @Override
    public List<BucBnstyVO> bucBnstyAccmltConectrAjax(BucBnstyVO bucBnstyVO) throws Exception {
        return bucBnstyDAO.bucBnstyAccmltConectrAjax(bucBnstyVO);
    }
  
    
    // 비즈니스 건설현장 현황 
    @Override
    public List<BucBnstyVO> bucBnstyPlaceAjax(BucBnstyVO bucBnstyVO) throws Exception {
        return bucBnstyDAO.bucBnstyPlaceAjax(bucBnstyVO);
    }
    
    // 비즈니스 건설상단 계획대비공정율 db연동 화면
    @Override
    public List<BucBnstyVO> bucBnstyRtdbAjax(BucBnstyVO bucBnstyVO) throws Exception {
        return bucBnstyDAO.bucBnstyRtdbAjax(bucBnstyVO);
    }
    
    // 비즈니스 건설 누적접속자 dbd연동화면
    @Override
    public List<BucBnstyVO> bucBnstyAccmltConectrdbAjax(BucBnstyVO bucBnstyVO) throws Exception {
        return bucBnstyDAO.bucBnstyAccmltConectrdbAjax(bucBnstyVO);
    }
    
    // 비즈니스 건설현장 현황 db연동 화면
    @Override
    public List<BucBnstyVO> bucBnstyPlacedbAjax(BucBnstyVO bucBnstyVO) throws Exception {
        return bucBnstyDAO.bucBnstyPlacedbAjax(bucBnstyVO);
    }
    
    
}
