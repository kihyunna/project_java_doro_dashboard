package egovframework.com.sdtic.main.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.sdtic.main.service.MainCmmnService;
import egovframework.com.sdtic.main.service.MainCmmnVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * @Class Name :  MainCmmnServiceImpl.java
 * @Description : MainCmmnServiceImpl Class
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

@Service("mainCmmnService")
public class MainCmmnServiceImpl extends EgovAbstractServiceImpl implements MainCmmnService {

    // TODO ibatis 사용
    @Resource(name="mainCmmnDAO")
    private MainCmmnDAO mainCmmnDAO;

    // MYSQL SMS 서비스 DB 접속
    @Resource(name="mainCmmnMysqlDAO")
    private MainCmmnMysqlDAO mainCmmnMysqlDAO;

    @Override
    public void insertMainCmmnSms(MainCmmnVO mainCmmnVO) throws Exception {
    // 통합 관제 DB서버 SMS 전송 AJAX
        mainCmmnDAO.insertMainCmmnSms(mainCmmnVO);

    //  MYSQL SMS 서버 SMS 전송 AJAX
        mainCmmnMysqlDAO.insertMainCmmnMysqlSms(mainCmmnVO);
    }
    // 보고서 목록
    @Override
    public List<MainCmmnVO> mainCmmnReportList(MainCmmnVO MainCmmnVO) throws Exception {
        return mainCmmnDAO.mainCmmnReportList(MainCmmnVO);
    }

    // 보고서 상세보기
    @Override
    public MainCmmnVO mainCmmnReportDetail(   MainCmmnVO mainCmmnVO) throws Exception {
        return mainCmmnDAO.mainCmmnReportDetail(mainCmmnVO);
    }

    // // 보고서 입력
    @Override
    public void mainCmmnReportInst(MainCmmnVO mainCmmnVO) throws Exception {
        mainCmmnDAO.mainCmmnReportInst(mainCmmnVO);
    }

    // 보고서 수정
    @Override
    public void mainCmmnReportUpdt(MainCmmnVO mainCmmnVO) throws Exception {
        mainCmmnDAO.mainCmmnReportUpdt(mainCmmnVO);
    }

    // 보고서 삭제
    @Override
    public void mainCmmnReportDel(MainCmmnVO mainCmmnVO) throws Exception {
        mainCmmnDAO.mainCmmnReportDel(mainCmmnVO);
    }

    // SMS 사용자 목록
    @Override
    public List<MainCmmnVO> mainCmmnSmsUserViewAjax(MainCmmnVO mainCmmnVO) throws Exception {
        return mainCmmnDAO.mainCmmnSmsUserViewAjax(mainCmmnVO);
    }
    // SMS 사용자 추가
    @Override
    public void insertMainCmmnSmsUserAjax(MainCmmnVO mainCmmnVO) throws Exception {
        mainCmmnDAO.insertMainCmmnSmsUserAjax(mainCmmnVO);
    }
    // SMS 사용자 수정
    @Override
    public void updateMainCmmnSmsUserAjax(MainCmmnVO mainCmmnVO) throws Exception {
        mainCmmnDAO.updateMainCmmnSmsUserAjax(mainCmmnVO);
    }
    
    
    // SMS 사용자 삭제
    @Override
    public void deleteMainCmmnSmsUserAjax(MainCmmnVO mainCmmnVO) throws Exception {
        mainCmmnDAO.deleteMainCmmnSmsUserAjax(mainCmmnVO);
    }
    // SMS 사용자 상세(삭제)보기
    @Override
    public MainCmmnVO mainCmmnSmsUserDelDetail(   MainCmmnVO mainCmmnVO) throws Exception {
        return mainCmmnDAO.mainCmmnSmsUserDelDetail(mainCmmnVO);
    }

    // 장애등급주기 목록
    @Override
    public List<MainCmmnVO> mainCmmnCycleManageAjax(MainCmmnVO mainCmmnVO) throws Exception {
        return mainCmmnDAO.mainCmmnCycleManageAjax(mainCmmnVO);
    }
    // 장애등급주기 수정
    @Override
    public void updateMainCmmnCycleManageAjax(MainCmmnVO mainCmmnVO) throws Exception {
        mainCmmnDAO.updateMainCmmnCycleManageAjax(mainCmmnVO);
    }
    // 장애등급주기 상세보기
    @Override
    public MainCmmnVO mainCmmnCycleManageDetail(   MainCmmnVO mainCmmnVO) throws Exception {
        return mainCmmnDAO.mainCmmnCycleManageDetail(mainCmmnVO);
    }
    
    // 장애이력목록
    @Override
    public List<MainCmmnVO> mainCmmnTroblHistList(MainCmmnVO MainCmmnVO) throws Exception {
        return mainCmmnDAO.mainCmmnTroblHistList(MainCmmnVO);
    }
    // 장애상세이력목록
    @Override
    public List<MainCmmnVO> mainCmmnTroblDetailHistList(MainCmmnVO MainCmmnVO) throws Exception {
        return mainCmmnDAO.mainCmmnTroblDetailHistList(MainCmmnVO);
    }
}
