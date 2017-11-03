package egovframework.com.sdtic.fecrs.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.sdtic.fecrs.service.fecDeptVO;
import egovframework.com.sdtic.fecrs.service.fecElrmVO;
import egovframework.com.sdtic.fecrs.service.fecSlpVO;
import egovframework.com.sdtic.fecrs.service.fecSlwtVO;
import egovframework.com.sdtic.fecrs.service.fecSvarVO;
import egovframework.com.sdtic.fecrs.service.fecTunnelVO;



/**
 * @Class Name : fecMainDAO.java
 * @Description : fecMainDAO DAO Class
 * @Modification Information
 * @
 * @ 수정일         수정자                        수정내용
 * @ -----------   ---------   -------------------------------
 * @ 2017. 07.18    jkeho                        최초생성
 *
 * @author itforward
 * @since 2017. 07.18
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */
@Repository("fecTotlInsrFcltDAO")
public class fecTotlInsrFcltDAO extends FacDBAbstractDAO {
   
    // 본부코드 데이터 가져오기 (시설물 DB)
    @SuppressWarnings("unchecked")
    public List<fecDeptVO> fecGetDept() throws Exception{
    	return (List<fecDeptVO>) list("fecTotlInsrFcltDAO.fecGetDept" , null);
    }
       
    // 터널 데이터 가져오기 (시설물 DB)
    @SuppressWarnings("unchecked")
    public List<fecTunnelVO> fecGetTunnel() throws Exception{
    	return (List<fecTunnelVO>) list("fecTotlInsrFcltDAO.fecGetTunnel" , null);
    }
    
   // 터널 장애 데이터 가져오기 (시설물 DB)
    @SuppressWarnings("unchecked")
    public List<fecTunnelVO> fecGetTroblTunnel() throws Exception{
    	return (List<fecTunnelVO>) list("fecTotlInsrFcltDAO.fecGetTroblTunnel" , null);
    }
    
   // 터널 이벤트 데이터 가져오기 (시설물 DB)
    @SuppressWarnings("unchecked")
    public List<fecTunnelVO> fecGetEventTunnel(String param) throws Exception{
    	return (List<fecTunnelVO>) list("fecTotlInsrFcltDAO.fecGetEventTunnel" , param);
    }
           
    // 전기(터널/영업소) 데이터 가져오기 (시설물 DB)
    @SuppressWarnings("unchecked")
    public List<fecElrmVO> fecGetElrm() throws Exception{
    	return (List<fecElrmVO>) list("fecTotlInsrFcltDAO.fecGetElrm" , null);
    }
    
    // 전기(터널/영업소) 장애 데이터 가져오기 (시설물 DB)
    @SuppressWarnings("unchecked")
    public List<fecElrmVO> fecGetTroblElrm() throws Exception{
    	return (List<fecElrmVO>) list("fecTotlInsrFcltDAO.fecGetTroblElrm" , null);
    }
        
    // 전기(가로등/조명탑) 데이터 가져오기 (시설물 DB)
    @SuppressWarnings("unchecked")
    public List<fecElrmVO> fecGetDstbx() throws Exception{
    	return (List<fecElrmVO>) list("fecTotlInsrFcltDAO.fecGetDstbx" , null);
    }
    
    // 전기(가로등/조명탑) 장애 데이터 가져오기 (시설물 DB)
    @SuppressWarnings("unchecked")
    public List<fecElrmVO> fecGetTroblDstbx() throws Exception{
    	return (List<fecElrmVO>) list("fecTotlInsrFcltDAO.fecGetTroblDstbx" , null);
    }
    
    // 전기 이벤트 데이터 가져오기 (시설물 DB)
    @SuppressWarnings("unchecked")
    public List<fecElrmVO> fecGetEventElcty(String param) throws Exception{
    	return (List<fecElrmVO>) list("fecTotlInsrFcltDAO.fecGetEventElcty" , param);
    }    
    
    // 오수 데이터 가져오기 (시설물 DB)
    @SuppressWarnings("unchecked")
    public List<fecSvarVO> fecGetSvar() throws Exception{
    	return (List<fecSvarVO>) list("fecTotlInsrFcltDAO.fecGetSvar" , null);
    }
    
    // 오수 장애 데이터 가져오기 (시설물 DB)
    @SuppressWarnings("unchecked")
    public List<fecSvarVO> fecGetTroblSvar() throws Exception{
    	return (List<fecSvarVO>) list("fecTotlInsrFcltDAO.fecGetTroblSvar" , null);
    }
    
    // 오수 이벤트 데이터 가져오기 (시설물 DB)
    @SuppressWarnings("unchecked")
    public List<fecSvarVO> fecGetEventSvar(String param) throws Exception{
    	return (List<fecSvarVO>) list("fecTotlInsrFcltDAO.fecGetEventSvar" , param);
    }
    
    
    // 염수 데이터 가져오기 (시설물 DB)
    @SuppressWarnings("unchecked")
    public List<fecSlwtVO> fecGetSlwt() throws Exception{
    	return (List<fecSlwtVO>) list("fecTotlInsrFcltDAO.fecGetSlwt" , null);
    }
    
    

}
