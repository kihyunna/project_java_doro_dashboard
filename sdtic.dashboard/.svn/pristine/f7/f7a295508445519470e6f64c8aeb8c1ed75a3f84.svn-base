package egovframework.com.sdtic.main.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.TransactionException;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmm.service.impl.EgovComSmsAbstractDAO;
import egovframework.com.sdtic.main.service.MainCmmnVO;

 /**
 * @Class Name :  MainCmmnSmsDAO.java
 * @Description : MainCmmnSmsDAO Class
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
@Repository("mainCmmnMysqlDAO")
public class MainCmmnMysqlDAO extends EgovComSmsAbstractDAO {

    // SMS 전송 AJAX
    @SuppressWarnings("unchecked")
    public void insertMainCmmnMysqlSms(MainCmmnVO mainCmmnVO) {
        insert("mainCmmnSmsDAO.insertMainCmmnMysqlSms" , mainCmmnVO);
    }

}


