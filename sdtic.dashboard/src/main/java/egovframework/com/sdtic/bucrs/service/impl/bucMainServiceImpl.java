package egovframework.com.sdtic.bucrs.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.com.sdtic.bucrs.service.BucCmmnVO;
import egovframework.com.sdtic.bucrs.service.bucMainService;
import egovframework.com.sdtic.bucrs.service.bucMainVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * @Class Name : bucMainServiceImpl.java
 * @Description : bucMainServiceImpl Class
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
@Service("bucMainService")
public class bucMainServiceImpl extends EgovAbstractServiceImpl implements bucMainService {
    // TODO ibatis 사용
    @Resource(name="bucMainDAO")
    private bucMainDAO bucMainDAO;
    
    @Resource(name="bucFercilityDAO")
    private BucFercilityDAO bucFercilityDAO;
        
    // 공통코드 리스트 조회
    @Override
    public List<bucMainVO> bucMainCodeListAjax(bucMainVO bucMainVO) throws Exception {
        return bucMainDAO.bucMainCodeListAjax(bucMainVO);
    }
    
    // 비즈니스 메인 도로정보시스템 활용메뉴 Top5 DB연동 화면
    @Override
    public List<BucCmmnVO> bucMainTopmenudbAjax(BucCmmnVO bucCmmnVO) throws Exception {
        return bucMainDAO.bucMainTopmenudbAjax(bucCmmnVO);
    }
    
    // 메인관제 비즈니스 사용자접속현황 화면
    @Override
    public List<bucMainVO> bucMainConectCstsAjax(bucMainVO bucMainVO) throws Exception {
        return bucMainDAO.bucMainConectCstsAjax(bucMainVO); 
    }
    //메인관제 건설사업단 공정율 db 화면
	@Override
	public List<bucMainVO> bucMainBnstyFairRtdbAjax(bucMainVO bucMainVO) throws Exception {
		// TODO Auto-generated method stub
		return bucMainDAO.bucMainBnstyFairRtdbAjax(bucMainVO);
	}
	 // 메인관제 비즈니스 대외연계 화면
    @Override
    public List<bucMainVO> bucMainExtrnlCntcdbAjax(bucMainVO bucMainVO) throws Exception {
        return bucMainDAO.bucMainExtrnlCntcdbAjax(bucMainVO); 
    }
    // 메인관제 비즈니스 사용자접속현황 화면
    @Override
    public List<bucMainVO> bucMainConectCstsdbAjax(bucMainVO bucMainVO) throws Exception {
        return bucMainDAO.bucMainConectCstsdbAjax(bucMainVO); 
    }
    // 메인관제 비즈니스 본부별 전력량 추이 화면
    @Override
    public List<bucMainVO> bucMainElctyUsedbAjax(bucMainVO bucMainVO) throws Exception {
        return bucFercilityDAO.bucMainElctyUsedbAjax(bucMainVO); 
    }
}
