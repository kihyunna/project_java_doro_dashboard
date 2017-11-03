package egovframework.com.sdtic.bucrs.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovTofacComAbstractDAO;
import egovframework.com.sdtic.bucrs.service.BucCmmnVO;
import egovframework.com.sdtic.bucrs.service.bucMainVO;

/**
 * @Class Name : bucMainDAO.java
 * @Description : bucMainDAO Class
 * @Modification Information
 * @
 * @ 수정일         수정자                        수정내용
 * @ -----------   ---------   -------------------------------
 * @ 2017. 06.01    jkeho                        최초생성
 *
 * @author itforward
 * @since 2017. 06.01
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */
@Repository("bucMainDAO")
public class bucMainDAO extends EgovTofacComAbstractDAO {

    // 공통코드 리스트 조회
    @SuppressWarnings("unchecked")
    public List<bucMainVO> bucMainCodeListAjax(bucMainVO bucMainVO) throws Exception {
        return (List<bucMainVO>) list("bucMainDAO.bucMainCodeListAjax" , bucMainVO);
    }
    
    // 비즈니스 메인 도로정보시스템 활용메뉴 Top5 DB연동 화면
    @SuppressWarnings("unchecked")
    public List<BucCmmnVO> bucMainTopmenudbAjax(BucCmmnVO bucCmmnVO) throws Exception {
        return (List<BucCmmnVO>) list("bucMainDAO.bucMainTopmenudbAjax" , bucCmmnVO);
    }
    
    // 메인관제 사용자접속현황 화면
    @SuppressWarnings("unchecked")
    public List<bucMainVO> bucMainConectCstsAjax(bucMainVO bucMainVO) throws Exception {
        return (List<bucMainVO>) list("bucMainDAO.bucMainConectCstsAjax" , bucMainVO);
    }
    
    // 메인관제  건설사업단 공정율 화면
    @SuppressWarnings("unchecked")
    public List<bucMainVO> bucMainBnstyFairRtdbAjax(bucMainVO bucMainVO) throws Exception {
        return (List<bucMainVO>) list("bucMainDAO.bucMainBnstyFairRtdbAjax" , bucMainVO);
    }
    
    // 메인관제 대외연계 화면
    @SuppressWarnings("unchecked")
    public List<bucMainVO> bucMainExtrnlCntcdbAjax(bucMainVO bucMainVO) throws Exception {
        return (List<bucMainVO>) list("bucMainDAO.bucMainExtrnlCntcdbAjax" , bucMainVO);
    }
    
    // 메인관제 사용자접속현황 화면
    @SuppressWarnings("unchecked")
    public List<bucMainVO> bucMainConectCstsdbAjax(bucMainVO bucMainVO) throws Exception {
        return (List<bucMainVO>) list("bucMainDAO.bucMainConectCstsdbAjax" , bucMainVO);
    }

}