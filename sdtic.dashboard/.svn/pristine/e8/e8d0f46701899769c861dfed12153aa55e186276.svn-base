package egovframework.com.sdtic.fecrs.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.com.sdtic.fecrs.service.fecDeptVO;
import egovframework.com.sdtic.fecrs.service.fecElrmVO;
import egovframework.com.sdtic.fecrs.service.fecSlpVO;
import egovframework.com.sdtic.fecrs.service.fecSlwtVO;
import egovframework.com.sdtic.fecrs.service.fecSvarVO;
import egovframework.com.sdtic.fecrs.service.fecTotlInsrService;
import egovframework.com.sdtic.fecrs.service.fecTunnelVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * @Class Name : fecMainServiceImpl.java
 * @Description : fecMainServiceImpl Class
 * @Modification Information
 * @
 * @ 수정일         수정자                        수정내용
 * @ -----------   ---------   -------------------------------
 * @ 2017. 07.18    nkh                        최초생성
 *
 * @author itforward
 * @since 2017. 07.18 
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */                                                   
@Service("fecTotlInsrService")
public class fecTotlInsrServiceImpl extends EgovAbstractServiceImpl implements fecTotlInsrService {

    private static final Logger LOGGER = LoggerFactory.getLogger(fecMainFacDBServiceImpl.class);

    /** CommonDAO */
    // TODO ibatis 사용
    @Resource(name="fecTotlInsrDAO") private fecTotlInsrDAO fecTotlInsrDAO;
    @Resource(name="fecTotlInsrFcltDAO") private fecTotlInsrFcltDAO fecTotlInsrFcltDAO;
 
    // 본부코드 테이블 삭제(관제DB)
    @Override
    public int fecDeleteDept() throws Exception{
        return fecTotlInsrDAO.fecDeleteDept();
    }
    
    // 본부코드 데이터 가져오기 (시설물 DB)
    @Override
    public List<fecDeptVO> fecGetDept() throws Exception{
        return fecTotlInsrFcltDAO.fecGetDept();
    }
    
    // 본부코드 데이터 추가(관제 DB)
    @Override
    public int fecInsertDept(List<fecDeptVO> param) throws Exception{
        return fecTotlInsrDAO.fecInsertDept(param);
    }
    
    // 터널 테이블 삭제(관제DB)
    @Override
    public int fecDeleteTunnel() throws Exception{
        return fecTotlInsrDAO.fecDeleteTunnel();
    }
    
    // 터널 데이터 가져오기 (시설물 DB)
    @Override
    public List<fecTunnelVO> fecGetTunnel() throws Exception{
        return fecTotlInsrFcltDAO.fecGetTunnel();
    }
    
    // 터널 데이터 추가(관제 DB)
    @Override
    public int fecInsertTunnel(List<fecTunnelVO> param) throws Exception{
        return fecTotlInsrDAO.fecInsertTunnelList(param);
    }
    
    // 전기(터널/영업소) 테이블 삭제(관제DB)
    @Override
    public int fecDeleteElrm() throws Exception{
        return fecTotlInsrDAO.fecDeleteElrm();
    }
    
    // 전기(터널/영업소) 데이터 가져오기 (시설물 DB)
    @Override
    public List<fecElrmVO> fecGetElrm() throws Exception{
        return fecTotlInsrFcltDAO.fecGetElrm();
    }
    
    // 전기(터널/영업소) 데이터 추가(관제 DB)
    @Override
    public int fecInsertElrm(List<fecElrmVO> param) throws Exception{
        return fecTotlInsrDAO.fecInsertElrmList(param);
    }
    
    // 전기(가로등/조명탑) 테이블 삭제(관제DB)
    @Override
    public int fecDeleteDstbx() throws Exception{
        return fecTotlInsrDAO.fecDeleteDstbx();
    }
    
    // 전기(가로등/조명탑) 데이터 가져오기 (시설물 DB)
    @Override
    public List<fecElrmVO> fecGetDstbx() throws Exception{
        return fecTotlInsrFcltDAO.fecGetDstbx();
    }
    
    // 전기(가로등/조명탑) 데이터 추가(관제 DB)
    @Override
    public int fecInsertDstbx(List<fecElrmVO> param) throws Exception{
        return fecTotlInsrDAO.fecInsertDstbxList(param);
    }
    
    // 사면 테이블 삭제(관제DB)
    @Override
    public int fecDeleteSlp() throws Exception{
        return fecTotlInsrDAO.fecDeleteSlp();
    }
    
    // 사면 데이터 가져오기 (시설물 DB)
    @Override
    public List<fecSlpVO> fecGetSlp() throws Exception{
//        return fecTotlInsrFcltDAO.fecGetSlp();
    	 List<fecSlpVO> list = null;
    	 
    	 return list;
    }
    
    // 사면 데이터 추가(관제 DB)
    @Override
    public int fecInsertSlp(List<fecSlpVO> param) throws Exception{
//        return fecTotlInsrDAO.fecInsertSlp(param);
    	return 0;
    }
    
    // 오수 테이블 삭제(관제DB)
    @Override
    public int fecDeleteSvar() throws Exception{
        return fecTotlInsrDAO.fecDeleteSvar();
    }
    
    // 오수 데이터 가져오기 (시설물 DB)
    @Override
    public List<fecSvarVO> fecGetSvar() throws Exception{
        return fecTotlInsrFcltDAO.fecGetSvar();
    }
    
    // 오수 데이터 추가(관제 DB)
    @Override
    public int fecInsertSvar(List<fecSvarVO> param) throws Exception{
        return fecTotlInsrDAO.fecInsertSvarList(param);
    }
    
    // 염수 테이블 삭제(관제DB)
    @Override
    public int fecDeleteSlwt() throws Exception{
        return fecTotlInsrDAO.fecDeleteSlwt();
    }
    
    // 염수 데이터 가져오기 (시설물 DB)
    @Override
    public List<fecSlwtVO> fecGetSlwt() throws Exception{
        return fecTotlInsrFcltDAO.fecGetSlwt();
    }
    
    // 염수 데이터 추가(관제 DB)
    @Override
    public int fecInsertSlwt(List<fecSlwtVO> param) throws Exception{
        return fecTotlInsrDAO.fecInsertSlwt(param);
    }
    
}