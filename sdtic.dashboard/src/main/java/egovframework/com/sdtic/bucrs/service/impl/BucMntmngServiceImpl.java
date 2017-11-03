package egovframework.com.sdtic.bucrs.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.sdtic.bucrs.service.BucMntmngService;
import egovframework.com.sdtic.bucrs.service.BucMntmngVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * @Class Name :  BucMntmngServiceImpl.java
 * @Description : BucMntmngServiceImpl Class
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

@Service("bucMntmngService")
public class BucMntmngServiceImpl extends EgovAbstractServiceImpl implements BucMntmngService {

    // TODO ibatis 사용
    @Resource(name="bucMntmngDAO")
    private BucMntmngDAO bucMntmngDAO;

    // 비즈니스 유지관리 누적접속자 화면
    @Override
    public List<BucMntmngVO> bucMntmngAccmltConectrAjax(BucMntmngVO bucMntmngVO) throws Exception {
        return bucMntmngDAO.bucMntmngAccmltConectrAjax(bucMntmngVO);
    }
    
    // 비즈니스 유지관리 시설물 가동률 누적접속자 화면
    @Override
    public List<BucMntmngVO> bucMntmngRtAjax(BucMntmngVO bucMntmngVO) throws Exception {
        return bucMntmngDAO.bucMntmngRtAjax(bucMntmngVO);
    }
    
    // 비즈니스 유지관리 차량관제현황 화면
    @Override
    public List<BucMntmngVO> bucMntmngVehicleCtldbAjax(BucMntmngVO bucMntmngVO) throws Exception {
        return bucMntmngDAO.bucMntmngVehicleCtldbAjax(bucMntmngVO);
    }
    // 비즈니스 유지관리 현황 화면
    @Override
    public List<BucMntmngVO> bucMntmngAjax(BucMntmngVO bucMntmngVO) throws Exception {
        return bucMntmngDAO.bucMntmngAjax(bucMntmngVO);
    }
    
    // 비즈니스 유지관리 주단위 현황 화면
    @Override
    public List<BucMntmngVO> bucMntmngWeekAjax(BucMntmngVO bucMntmngVO) throws Exception {
        return bucMntmngDAO.bucMntmngWeekAjax(bucMntmngVO);
    }
    
    // 비즈니스 유지관리 일단위 현황 화면
    @Override
    public List<BucMntmngVO> bucMntmngDayAjax(BucMntmngVO bucMntmngVO) throws Exception {
        return bucMntmngDAO.bucMntmngDayAjax(bucMntmngVO);
    }
    
    // 비즈니스 유지관리 시설물수리완료율 점검완료율 화면
    @Override
    public List<BucMntmngVO> bucMntmngProfitToPlanAjax(BucMntmngVO bucMntmngVO) throws Exception {
        return bucMntmngDAO.bucMntmngProfitToPlanAjax(bucMntmngVO);
    }
    
    // 비즈니스 유지관리 시설물수리완료율 본부최대갯수 화면
    @Override
    public List<BucMntmngVO> bucMntmngProfitToPlanMaxAjax(BucMntmngVO bucMntmngVO) throws Exception {
        return bucMntmngDAO.bucMntmngProfitToPlanMaxAjax(bucMntmngVO);
    }
    
    // 비즈니스 유지관리 누적접속자 db연동 화면
    @Override
    public List<BucMntmngVO> bucMntmngAccmltConectrdbAjax(BucMntmngVO bucMntmngVO) throws Exception {
        return bucMntmngDAO.bucMntmngAccmltConectrdbAjax(bucMntmngVO);
    }
    
    // 비즈니스 유지관리 시설물가동률 db연동 화면
    @Override
    public List<BucMntmngVO> bucMntmngRtdbAjax(BucMntmngVO bucMntmngVO) throws Exception {
        return bucMntmngDAO.bucMntmngRtdbAjax(bucMntmngVO);
    }
    
    // 비즈니스 유지관리 유지관리 전일대비 db연동 화면
    @Override
    public List<BucMntmngVO> bucMntmngdaydbAjax(BucMntmngVO bucMntmngVO) throws Exception {
        return bucMntmngDAO.bucMntmngdaydbAjax(bucMntmngVO);
    }
    
    // 비즈니스 유지관리 점검계획대비 점검완료율 db연동 화면(본부)
    @Override
    public List<BucMntmngVO> bucMntmngProfitToPlanbonbuAjax(BucMntmngVO bucMntmngVO) throws Exception {
        return bucMntmngDAO.bucMntmngProfitToPlanbonbuAjax(bucMntmngVO);
    }
    // 비즈니스 유지관리 차량관제현황 DB연동 화면
    @Override
    public List<BucMntmngVO> bucMntmngMdtRundbAjax(BucMntmngVO bucMntmngVO) throws Exception {
        return bucMntmngDAO.bucMntmngMdtRundbAjax(bucMntmngVO);
    }
    
    
}
