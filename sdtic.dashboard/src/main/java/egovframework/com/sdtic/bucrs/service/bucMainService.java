package egovframework.com.sdtic.bucrs.service;

import java.util.List;

/**
 * @Class Name : bucMainService.java
 * @Description : bucMainService Class
 * @Modification Information
 * @
 * @ 수정일         수정자                        수정내용
 * @ -----------   ---------   -------------------------------
 * @ 2016. 06.01    jkeho                        최초생성
 *
 * @author itforward
 * @since 2016. 06.01
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */
public interface bucMainService {

    // 공통코드 리스트 조회
    public List<bucMainVO> bucMainCodeListAjax(bucMainVO bucMainVO) throws Exception;
    
    // 비즈니스 메인 도로정보시스템 활용메뉴 Top5 DB연동 화면
    public List<BucCmmnVO> bucMainTopmenudbAjax(BucCmmnVO bucCmmnVO) throws Exception;  

    // 비즈니스 메인 건설사업단 공정율 화면
    public List<bucMainVO> bucMainBnstyFairRtdbAjax(bucMainVO bucMainVO) throws Exception;  

    // 메인관제 비즈니스 사용자접속현황 화면
    public List<bucMainVO> bucMainConectCstsAjax(bucMainVO bucMainVO) throws Exception; 

    
    // 메인관제 비즈니스 대외연계 화면
    public List<bucMainVO> bucMainExtrnlCntcdbAjax(bucMainVO bucMainVO) throws Exception; 
    
    // 메인관제 비즈니스 사용자접속현황 화면
    public List<bucMainVO> bucMainConectCstsdbAjax(bucMainVO bucMainVO) throws Exception; 
    
    // 메인관제 비즈니스 본부별 전력량 추이 화면
    public List<bucMainVO> bucMainElctyUsedbAjax(bucMainVO bucMainVO) throws Exception; 
}
