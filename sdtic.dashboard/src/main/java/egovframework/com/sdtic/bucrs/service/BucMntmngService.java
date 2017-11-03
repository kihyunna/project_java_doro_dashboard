package egovframework.com.sdtic.bucrs.service;

import java.util.List;

/**
 * @Class Name :  BucMntmngService.java
 * @Description : BucMntmngService Class
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
public interface BucMntmngService {

    // 비즈니스 유지관리 누적접속자 화면
    public List<BucMntmngVO> bucMntmngAccmltConectrAjax(BucMntmngVO bucMntmngVO) throws Exception;
    
    // 비즈니스 유지관리 누적접속자 화면
    public List<BucMntmngVO> bucMntmngRtAjax(BucMntmngVO bucMntmngVO) throws Exception;
    
    // 비즈니스 유지관리 MDT운행 화면
    public List<BucMntmngVO> bucMntmngVehicleCtldbAjax(BucMntmngVO bucMntmngVO) throws Exception;
    
    // 비즈니스 유지관리 현황 화면
    public List<BucMntmngVO> bucMntmngAjax(BucMntmngVO bucMntmngVO) throws Exception;
    
    // 비즈니스 유지관리 주간현황 화면
    public List<BucMntmngVO> bucMntmngWeekAjax(BucMntmngVO bucMntmngVO) throws Exception;
    
    // 비즈니스 유지관리 일단위현황 화면
    public List<BucMntmngVO> bucMntmngDayAjax(BucMntmngVO bucMntmngVO) throws Exception;
    
    // 비즈니스 유지관리 점검계획대비 점검완료율 화면
    public List<BucMntmngVO> bucMntmngProfitToPlanAjax(BucMntmngVO bucMntmngVO) throws Exception;
    
    // 비즈니스 유지관리 점검계획대비 본부최대갯수 화면
    public List<BucMntmngVO> bucMntmngProfitToPlanMaxAjax(BucMntmngVO bucMntmngVO) throws Exception;
    
    // 비즈니스 유지관리 누적접속자 db 화면
    public List<BucMntmngVO> bucMntmngAccmltConectrdbAjax(BucMntmngVO bucMntmngVO) throws Exception;
    
    // 비즈니스 유지관리 누적접속자 db 화면
    public List<BucMntmngVO> bucMntmngRtdbAjax(BucMntmngVO bucMntmngVO) throws Exception;
    
    // 비즈니스 유지관리 전일대비현황 db연동 화면
    public List<BucMntmngVO> bucMntmngdaydbAjax(BucMntmngVO bucMntmngVO) throws Exception;
    
    // 비즈니스 유지관리 고장수리 완료율 db연동 화면(본부)
    public List<BucMntmngVO> bucMntmngProfitToPlanbonbuAjax(BucMntmngVO bucMntmngVO) throws Exception;
    
    // 비즈니스 유지관리 MDT운행 화면
    public List<BucMntmngVO> bucMntmngMdtRundbAjax(BucMntmngVO bucMntmngVO) throws Exception;
    
    


}
