package egovframework.com.sdtic.main.service;

import java.util.List;

/**
 * @Class Name :  ifcMainService.java
 * @Description : ifcMainService Class
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
public interface MainCmmnService {

    // SMS 전송 AJAX
    public void insertMainCmmnSms( MainCmmnVO mainCmmnVO) throws Exception;



    // 보고서 목록
    public List<MainCmmnVO> mainCmmnReportList(MainCmmnVO mainCmmnVO) throws Exception;
    // 보고서 상세보기
    public MainCmmnVO mainCmmnReportDetail(MainCmmnVO mainCmmnVO) throws Exception;
    // 보고서 입력
    public void mainCmmnReportInst(MainCmmnVO mainCmmnVO) throws Exception;
    // 보고서 수정
    public void mainCmmnReportUpdt(MainCmmnVO mainCmmnVO) throws Exception;
    // 보고서 삭제
    public void mainCmmnReportDel(MainCmmnVO mainCmmnVO) throws Exception;


    // SMS 사용자 목록
    public List<MainCmmnVO>  mainCmmnSmsUserViewAjax(MainCmmnVO mainCmmnVO) throws Exception;
    // SMS 사용자 추가
    public void insertMainCmmnSmsUserAjax( MainCmmnVO mainCmmnVO) throws Exception;
    // SMS 사용자 수정
    public void updateMainCmmnSmsUserAjax( MainCmmnVO mainCmmnVO) throws Exception;
    // SMS 사용자 삭제
    public void deleteMainCmmnSmsUserAjax( MainCmmnVO mainCmmnVO) throws Exception;
    // SMS 사용자 상세(삭제)보기
    public MainCmmnVO mainCmmnSmsUserDelDetail(MainCmmnVO mainCmmnVO) throws Exception;

    // 장애등급주기 목록
    public List<MainCmmnVO>  mainCmmnCycleManageAjax(MainCmmnVO mainCmmnVO) throws Exception;
    // 장애등급주기 수정
    public void updateMainCmmnCycleManageAjax( MainCmmnVO mainCmmnVO) throws Exception;
    // 장애등급주기 상세보기
    public MainCmmnVO mainCmmnCycleManageDetail(MainCmmnVO mainCmmnVO) throws Exception;
    
    // 장애이력목록 조회
    public List<MainCmmnVO> mainCmmnTroblHistList(MainCmmnVO mainCmmnVO) throws Exception;
    // 장애상세이력목록 조회
    public List<MainCmmnVO> mainCmmnTroblDetailHistList(MainCmmnVO mainCmmnVO) throws Exception;

}
