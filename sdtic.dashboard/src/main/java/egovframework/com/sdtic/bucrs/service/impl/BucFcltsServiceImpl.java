package egovframework.com.sdtic.bucrs.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import egovframework.com.sdtic.bucrs.service.BucFcltsService;
import egovframework.com.sdtic.bucrs.service.BucFcltsVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * @Class Name :  BucFcltsServiceImpl.java
 * @Description : BucFcltsServiceImpl Class
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

@Service("bucFcltsService")
public class BucFcltsServiceImpl extends EgovAbstractServiceImpl implements BucFcltsService {

    // TODO ibatis 사용
    @Resource(name="bucFcltsDAO")
    private BucFcltsDAO bucFcltsDAO;
    
    // TODO ibatis 사용
    @Resource(name="bucFcltsCtlDAO")
    private BucFcltsCtlDAO bucFcltsCtlDAO;
    
    // TODO ibatis 사용
    @Resource(name="bucFercilityDAO")
    private BucFercilityDAO bucFercilityDAO;


    // 비즈니스 시설물 누적접속자 화면
    @Override
    public List<BucFcltsVO> bucFcltsAccmltConectrAjax(BucFcltsVO bucFcltsVO) throws Exception {
        return bucFcltsDAO.bucFcltsAccmltConectrAjax(bucFcltsVO);
    }
    
    // 비즈니스 시설물 누적접속자 화면
    @Override
    public List<BucFcltsVO> bucFcltsRtAjax(BucFcltsVO bucFcltsVO) throws Exception {
        return bucFcltsCtlDAO.bucFcltsRtAjax(bucFcltsVO);
    }
    
    // 비즈니스 시설물 34종 데이터 입력률 화면
    @Override
    public List<BucFcltsVO> bucFcltsInputRateAjax(BucFcltsVO bucFcltsVO) throws Exception {
        return bucFcltsDAO.bucFcltsInputRateAjax(bucFcltsVO);
    }
    
    // 비즈니스 시설물 34종 데이터 이관율 화면(히트맵)
    @Override
    public List<BucFcltsVO> BucFcltsDataTransferAjax(BucFcltsVO bucFcltsVO) throws Exception {
        return bucFcltsDAO.BucFcltsDataTransferAjax(bucFcltsVO);
    }
    
    // 비즈니스 시설물 고장평균처리일 위젯 DB연동(본부) 화면
    @Override
    public List<BucFcltsVO> bucFcltsBrokenproavgdaybonbuAjax(BucFcltsVO bucFcltsVO) throws Exception {
        return bucFcltsDAO.BucFcltsBrokenproavgdaybonbuAjax(bucFcltsVO);
    }
    // 비즈니스 시설물 고장평균처리일 위젯 DB연동(지사) 화면
    @Override
    public List<BucFcltsVO> bucFcltsBrokenproavgdayjisaAjax(BucFcltsVO bucFcltsVO) throws Exception {
        return bucFcltsDAO.BucFcltsBrokenproavgdayjisaAjax(bucFcltsVO);
    }
    
    // 비즈니스 시설물 고장 top20 화면
    @Override
    public List<BucFcltsVO> bucFcltsBrokenfercilitytop(BucFcltsVO bucFcltsVO) throws Exception {
        return bucFcltsDAO.bucFcltsBrokenfercilitytop(bucFcltsVO);
    }
    
    // 비즈니스 시설물 고장평균처리일 화면
    @Override
    public List<BucFcltsVO> bucFcltsBrokenproavgday(BucFcltsVO bucFcltsVO) throws Exception {
        return bucFcltsDAO.bucFcltsBrokenproavgday(bucFcltsVO);
    }
    
    // 비즈니스 시설물 고장 top20 DB연동 화면
    @Override
    public List<BucFcltsVO> bucFcltsBrokenfercilitytopdbAjax(BucFcltsVO bucFcltsVO) throws Exception {
        return bucFcltsDAO.bucFcltsBrokenfercilitytopdbAjax(bucFcltsVO);
    }
    
    // 비즈니스 시설물 34종 데이터 이관율 DB연동 화면(히트맵)
    @Override
    public List<BucFcltsVO> bucFcltsDataTransferdbAjax(BucFcltsVO bucFcltsVO) throws Exception {
        return bucFcltsDAO.bucFcltsDataTransferdbAjax(bucFcltsVO);
    }
    
    // 비즈니스 시설물 34종 입력율 DB연동 화면
    public List<BucFcltsVO> bucFclts34EscalationRatedbAjax(BucFcltsVO bucFcltsVO) throws Exception {
        return bucFcltsDAO.bucFclts34EscalationRatedbAjax(bucFcltsVO);
    }
    
    // 비즈니스 시설물 오수 유입방출 DB연동화면
    public List<BucFcltsVO> bucFcltsPollutedWaterdbAjax(BucFcltsVO bucFcltsVO) throws Exception {
        return bucFercilityDAO.bucFcltsPollutedWaterdbAjax(bucFcltsVO);
    }
}
