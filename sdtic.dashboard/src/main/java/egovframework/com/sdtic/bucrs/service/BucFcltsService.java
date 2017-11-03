package egovframework.com.sdtic.bucrs.service;

import java.util.List;

/**
 * @Class Name :  BucFcltsService.java
 * @Description : BucFcltsService Class
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
public interface BucFcltsService {

    // 비즈니스 시설물 누적접속자 화면
    public List<BucFcltsVO> bucFcltsAccmltConectrAjax(BucFcltsVO bucFcltsVO) throws Exception;
    
    // 비즈니스 시설물 누적접속자 화면
    public List<BucFcltsVO> bucFcltsRtAjax(BucFcltsVO bucFcltsVO) throws Exception;
    
    // 비즈니스 시설물 34종 데이터 입력률 화면
    public List<BucFcltsVO> bucFcltsInputRateAjax(BucFcltsVO bucFcltsVO) throws Exception;
    
    // 비즈니스 시설물 34종 데이터 입력률 화면(히트맵)
    public List<BucFcltsVO> BucFcltsDataTransferAjax(BucFcltsVO bucFcltsVO) throws Exception;
        
	// 비즈니스 시설물 고장평균처리일 위젯 db연동(본부)
    public List<BucFcltsVO> bucFcltsBrokenproavgdaybonbuAjax(BucFcltsVO bucFcltsVO) throws Exception;
    
    // 비즈니스 시설물 고장평균처리일 위젯 db연동(지사)
    public List<BucFcltsVO> bucFcltsBrokenproavgdayjisaAjax(BucFcltsVO bucFcltsVO) throws Exception;
    
    // 비즈니스 시설물 고장 top20 화면
    public List<BucFcltsVO> bucFcltsBrokenfercilitytop(BucFcltsVO bucFcltsVO) throws Exception;
    
    // 비즈니스 시설물 고장평균처리일 화면
    public List<BucFcltsVO> bucFcltsBrokenproavgday(BucFcltsVO bucFcltsVO) throws Exception;
    
    // 비즈니스 시설물 고장 top20 db연동 화면
    public List<BucFcltsVO> bucFcltsBrokenfercilitytopdbAjax(BucFcltsVO bucFcltsVO) throws Exception;
    
    // 비즈니스 시설물 34종 데이터 입력률 db연동 화면
    public List<BucFcltsVO> bucFcltsDataTransferdbAjax(BucFcltsVO bucFcltsVO) throws Exception;
    
    // 비즈니스 시설물 34종 입력율 db연동 화면
    public List<BucFcltsVO> bucFclts34EscalationRatedbAjax(BucFcltsVO bucFcltsVo) throws Exception;
    
    // 비즈니스 시설물 오수 db연동 화면
    public List<BucFcltsVO> bucFcltsPollutedWaterdbAjax(BucFcltsVO bucFcltsVo) throws Exception;
}
