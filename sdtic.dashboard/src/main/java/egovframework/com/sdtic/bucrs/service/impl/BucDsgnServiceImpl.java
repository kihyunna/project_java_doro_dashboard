package egovframework.com.sdtic.bucrs.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import egovframework.com.sdtic.bucrs.service.BucDsgnService;
import egovframework.com.sdtic.bucrs.service.BucDsgnVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * @Class Name :  BucDsgnServiceImpl.java
 * @Description : BucDsgnServiceImpl Class
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

@Service("bucDsgnService")
public class BucDsgnServiceImpl extends EgovAbstractServiceImpl implements BucDsgnService {

    // TODO ibatis 사용
    @Resource(name="bucDsgnDAO")
    private BucDsgnDAO bucDsgnDAO;

    // 비즈니스 설계상단 누적접속자 화면
    @Override
    public List<BucDsgnVO> bucDsgnAccmltConectrAjax(BucDsgnVO bucDsgnVO) throws Exception {
        return bucDsgnDAO.bucDsgnAccmltConectrAjax(bucDsgnVO);
    }

    
    // 비즈니스 설계상단 설계도서 납품률 화면
    @Override
    public List<BucDsgnVO> bucDsgnRtAjax(BucDsgnVO bucDsgnVO) throws Exception {
        return bucDsgnDAO.bucDsgnRtAjax(bucDsgnVO);
    }
    
    // 비즈니스 설계 설계도서 반입반출 화면
    @Override
    public List<BucDsgnVO> bucDsgnDrawingInOutRateAjax(BucDsgnVO bucDsgnVO) throws Exception {
        return bucDsgnDAO.bucDsgnDrawingInOutRateAjax(bucDsgnVO);
    }
    
    // 비즈니스 설계 설계도서 납품현황 DB연동 화면
    @Override
    public List<BucDsgnVO> bucDsgnBookdeliverdbAjax(BucDsgnVO bucDsgnVO) throws Exception {
        return bucDsgnDAO.bucDsgnBookdeliverdbAjax(bucDsgnVO);
    }
}
