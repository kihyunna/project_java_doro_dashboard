package egovframework.com.sdtic.main.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.TransactionException;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.sdtic.main.service.MainCmmnVO;

 /**
 * @Class Name :  MainCmmnDAO.java
 * @Description : MainCmmnDAO Class
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
@Repository("mainCmmnDAO")
public class MainCmmnDAO extends EgovComAbstractDAO {

    // SMS 전송 AJAX
    @SuppressWarnings("unchecked")
    public void insertMainCmmnSms(MainCmmnVO mainCmmnVO) {
        insert("mainCmmnDAO.insertMainCmmnSms" , mainCmmnVO);
    }



    // 보고서 목록
    @SuppressWarnings("unchecked")
    public List<MainCmmnVO> mainCmmnReportList(MainCmmnVO mainCmmnVO) throws Exception {
        return (List<MainCmmnVO>) list("mainCmmnDAO.mainCmmnReportList" , mainCmmnVO);
    }

    // 보고서 상세보기
    @SuppressWarnings("unchecked")
    public MainCmmnVO mainCmmnReportDetail(   MainCmmnVO mainCmmnVO) throws Exception {
        return (MainCmmnVO)selectByPk("mainCmmnDAO.mainCmmnReportDetail"   ,mainCmmnVO);
    }

    // 보고서 입력
    public void mainCmmnReportInst(     MainCmmnVO mainCmmnVO) throws Exception { insert( "mainCmmnDAO.mainCmmnReportInst"     , mainCmmnVO); }
    // 보고서 수정
    public void mainCmmnReportUpdt(     MainCmmnVO mainCmmnVO) throws Exception { update( "mainCmmnDAO.mainCmmnReportUpdt"     , mainCmmnVO); }
    // 보고서 삭제
    public void mainCmmnReportDel (     MainCmmnVO mainCmmnVO) throws Exception { update( "mainCmmnDAO.mainCmmnReportDel"      , mainCmmnVO); }

    // SMS 사용자 목록
    public List<MainCmmnVO> mainCmmnSmsUserViewAjax(MainCmmnVO mainCmmnVO) throws Exception {
        return (List<MainCmmnVO>) list("mainCmmnDAO.mainCmmnSmsUserViewAjax" , mainCmmnVO);
    }
    //SMS 사용자 추가
    public void insertMainCmmnSmsUserAjax(MainCmmnVO mainCmmnVO) {
        insert("mainCmmnDAO.insertMainCmmnSmsUserAjax" , mainCmmnVO);
    }
    //SMS 사용자 수정
    public void updateMainCmmnSmsUserAjax(MainCmmnVO mainCmmnVO) {
        update("mainCmmnDAO.updateMainCmmnSmsUserAjax" , mainCmmnVO);
    }   

    //SMS 사용자 삭제
    public void deleteMainCmmnSmsUserAjax(MainCmmnVO mainCmmnVO) {
        delete("mainCmmnDAO.deleteMainCmmnSmsUserAjax" , mainCmmnVO);
    }
    // SMS 사용자 상세(삭제)보기
    @SuppressWarnings("unchecked")
    public MainCmmnVO mainCmmnSmsUserDelDetail(   MainCmmnVO mainCmmnVO) throws Exception {
        return (MainCmmnVO)selectByPk("mainCmmnDAO.mainCmmnSmsUserDelDetail"   ,mainCmmnVO);
    }


    // 장애등급주기 목록
    public List<MainCmmnVO> mainCmmnCycleManageAjax(MainCmmnVO mainCmmnVO) throws Exception {
        return (List<MainCmmnVO>) list("mainCmmnDAO.mainCmmnCycleManageAjax" , mainCmmnVO);
    }
    // 장애등급주기 수정
    public void updateMainCmmnCycleManageAjax(MainCmmnVO mainCmmnVO) {
        insert("mainCmmnDAO.updateMainCmmnCycleManageAjax" , mainCmmnVO);
    }
    // 장애등급주기 상세보기
    @SuppressWarnings("unchecked")
    public MainCmmnVO mainCmmnCycleManageDetail(   MainCmmnVO mainCmmnVO) throws Exception {
        return (MainCmmnVO)selectByPk("mainCmmnDAO.mainCmmnCycleManageDetail"   ,mainCmmnVO);
    }
    
    // 활성화된 장애등급주기 가져오기
    public List<MainCmmnVO> mainCmmnUseCycleManageAjax(MainCmmnVO mainCmmnVO) throws Exception {
        return (List<MainCmmnVO>) list("mainCmmnDAO.mainCmmnUseCycleManageAjax" , mainCmmnVO);
    }
    // SMS 발송 리스트 가져오기
    public List<MainCmmnVO> mainCmmnSmsUserAjax(MainCmmnVO mainCmmnVO) throws Exception {
        return (List<MainCmmnVO>) list("mainCmmnDAO.mainCmmnSmsUserAjax" , mainCmmnVO);
    }
    
    // 장애이력목록
    @SuppressWarnings("unchecked")
    public List<MainCmmnVO> mainCmmnTroblHistList(MainCmmnVO mainCmmnVO) throws Exception {
        return (List<MainCmmnVO>) list("mainCmmnDAO.mainCmmnTroblHistList" , mainCmmnVO);
    }
    // 장애상세이력목록
    @SuppressWarnings("unchecked")
    public List<MainCmmnVO> mainCmmnTroblDetailHistList(MainCmmnVO mainCmmnVO) throws Exception {
        return (List<MainCmmnVO>) list("mainCmmnDAO.mainCmmnTroblDetailHistList" , mainCmmnVO);
    }
}


