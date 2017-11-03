package egovframework.com.sdtic.bucrs.service;

import java.util.List;

/**
 * @Class Name :  BucDsgnService.java
 * @Description : BucDsgnService Class
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
public interface BucDsgnService {

    // 비즈니스 설계 누적접속자 화면
    public List<BucDsgnVO> bucDsgnAccmltConectrAjax(BucDsgnVO bucDsgnVO) throws Exception;
     
    
    // 비즈니스 설계 누적접속자 화면
    public List<BucDsgnVO> bucDsgnRtAjax(BucDsgnVO bucDsgnVO) throws Exception;
    
	// 비즈니스 설계 설계도서 반입반출율 화면
    public List<BucDsgnVO> bucDsgnDrawingInOutRateAjax(BucDsgnVO bucDsgnVO) throws Exception;
    
    // 비즈니스 설계 설계도서 납품현황 db 화면
    public List<BucDsgnVO> bucDsgnBookdeliverdbAjax(BucDsgnVO bucDsgnVO) throws Exception;
}
