package egovframework.com.sdtic.fecrs.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.sdtic.fecrs.service.fecCctvVO;
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
@Repository("fecTotlInsrDAO")
public class fecTotlInsrDAO extends EgovComAbstractDAO {

//    // MDT 운행현황 금일전일 비교
//    @SuppressWarnings("deprecation")
//	public FecMDTOperVO fecMdtoperLv1Ajax(FecSearchVO fecSearchVO) throws Exception{
//    	return (FecMDTOperVO) selectByPk("FecMdtoperDAO.fecMdtoperLv1Ajax", fecSearchVO);
//    }
//    
    // 본부코드 테이블 삭제(관제DB)
    public int fecDeleteDept() throws Exception{
    	fecDeptVO fecDept = new fecDeptVO();
    	return update("fecTotlInsrDAO.fecDeleteDept", null);
    }
        
    // 본부코드 데이터 추가(관제 DB)
    public int fecInsertDept(List<fecDeptVO> param) throws Exception{
    	return update("fecTotlInsrDAO.fecInsertDept", param);
    }
    
    // 터널 총기기 테이블 삭제(관제DB)
    public int fecDeleteTunnel() throws Exception{
    	return update("fecTotlInsrDAO.fecDeleteTunnel", null);
    }
        
    // 터널 총기기 데이터 추가(관제 DB)
    @SuppressWarnings("deprecation")
	public int fecInsertTunnelList(List<fecTunnelVO> param) throws Exception{
		try { 
			for ( int i =0;i<param.size();i++){
	    		fecTunnelVO vo = param.get(i);
	    		this.getSqlMapClient().insert("fecTotlInsrDAO.fecInsertTunnel", vo);
	    	}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println ("터널 총기기 데이터 추가 실패");
			return 0;
		} 
    	
    	return 1;
    }
    
   // 터널 데이터 추가(관제 DB)
    public int fecInsertTunnel(fecTunnelVO param) throws Exception{
    	return update("fecTotlInsrDAO.fecInsertTunnel", param);
    }
    
   // 터널 장애 테이블 max 순번(관제DB)
    @SuppressWarnings("deprecation")
	public String fecGetTroblTunnelMaxSeq() throws Exception{
    	return (String)selectByPk("fecTotlInsrDAO.fecGetTroblTunnelMaxSeq", null);
    }
    
    // 터널 장애 테이블 추가(관제DB)
    @SuppressWarnings("deprecation")
	public int fecInsertTroblTunnelList(List<fecTunnelVO> param, String seq) throws Exception{
    	try { 			
			for ( int i =0;i<param.size();i++){
	    		fecTunnelVO vo = param.get(i);
	    		vo.setTunnel_seq(seq);
	    		this.getSqlMapClient().insert("fecTotlInsrDAO.fecInsertTroblTunnel", vo);
	    	}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println ("터널 장애 데이터 추가 실패");
			return 0;
		} 
    	return 1;
    }
    
    // 터널 장애 테이블 추가(관제DB)
    public int fecInsertTroblTunnel(fecTunnelVO param) throws Exception{
    	return update("fecTotlInsrDAO.fecInsertTroblTunnel", param);
    }
    
 // 터널 장애 테이블 max 순번(관제DB)
    @SuppressWarnings("deprecation")
	public String fecGetEventTunnelMaxSeq() throws Exception{
    	return (String)selectByPk("fecTotlInsrDAO.fecGetEventTunnelMaxSeq", null);
    }
    
    // 터널 이벤트 테이블 추가(관제DB)
    @SuppressWarnings("deprecation")
	public int fecInsertEventTunnelList(List<fecTunnelVO> param) throws Exception{
    	try { 
			for ( int i =0;i<param.size();i++){
	    		fecTunnelVO vo = param.get(i);
	    		this.getSqlMapClient().insert("fecTotlInsrDAO.fecInsertEventTunnel", vo);
	    	}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println ("터널 이벤트 데이터 추가 실패");
			return 0;
		}     	
    	return 1;
    }
    
    // 전기(터널/영업소) 테이블 삭제(관제DB)
    public int fecDeleteElrm() throws Exception{
    	return update("fecTotlInsrDAO.fecDeleteElrm", null);
    }
       
    // 전기(터널/영업소) 데이터 추가(관제 DB)
    @SuppressWarnings("deprecation")
	public int fecInsertElrmList(List<fecElrmVO> param) throws Exception{
    	try { 
			for ( int i =0;i<param.size();i++){
				fecElrmVO vo = param.get(i);
	    		this.getSqlMapClient().insert("fecTotlInsrDAO.fecInsertElrm", vo);
	    	}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println ("전기(터널/영업소) 데이터 추가 실패");
			return 0;
		} 
    	return 1;
    }
    
    // 전기(터널/영업소) 데이터 추가(관제 DB)
    public int fecInsertElrm(fecElrmVO param) throws Exception{
    	return update("fecTotlInsrDAO.fecInsertElrm", param);
    }
    
    // 전기(터널/영업소) 장애 테이블 max 순번(관제DB)
    @SuppressWarnings("deprecation")
	public String fecGetTroblElrmMaxSeq() throws Exception{
    	return (String)selectByPk("fecTotlInsrDAO.fecGetTroblElrmMaxSeq", null);
    }
    
    // 전기(터널/영업소) 장애 테이블 추가(관제DB)
    @SuppressWarnings("deprecation")
	public int fecInsertTroblElrmList(List<fecElrmVO> param, String seq) throws Exception{
    	try { 
			for ( int i =0;i<param.size();i++){
				fecElrmVO vo = param.get(i);
				vo.setElcty_fclts_seq(seq);
	    		this.getSqlMapClient().insert("fecTotlInsrDAO.fecInsertTroblElrm", vo);
	    	}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println ("전기(터널/영업소) 장애 데이터 추가 실패");
			return 0;
		} 
    	return 1;
    }
    
    // 전기(터널/영업소) 장애 테이블 추가(관제DB)
    public int fecInsertTroblElrm(fecElrmVO param) throws Exception{
    	return update("fecTotlInsrDAO.fecInsertTroblElrm", param);
    }
    
    // 전기(가로등/조명탑) 테이블 삭제(관제DB)
    public int fecDeleteDstbx() throws Exception{
    	return update("fecTotlInsrDAO.fecDeleteDstbx", null);
    }
        
    // 전기(가로등/조명탑) 데이터 추가(관제 DB)
    @SuppressWarnings("deprecation")
	public int fecInsertDstbxList(List<fecElrmVO> param) throws Exception{
    	try { 
			for ( int i =0;i<param.size();i++){
				fecElrmVO vo = param.get(i);
	    		this.getSqlMapClient().insert("fecTotlInsrDAO.fecInsertDstbx", vo);
	    	}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println ("전기(가로등/조명탑) 데이터 추가 실패");
			return 0;
		}
    	return 1;
    }
    
    // 전기(가로등/조명탑) 데이터 추가(관제 DB)
    public int fecInsertDstbx(fecElrmVO param) throws Exception{
    	return update("fecTotlInsrDAO.fecInsertDstbx", param);
    }
    
   // 전기(가로등/조명탑) 장애 테이블 max 순번(관제DB)
    @SuppressWarnings("deprecation")
	public String fecGetTroblDstbxMaxSeq() throws Exception{
    	return (String)selectByPk("fecTotlInsrDAO.fecGetTroblDstbxMaxSeq", null);
    }
    
    // 전기(가로등/조명탑) 장애 테이블 추가(관제DB)
    @SuppressWarnings("deprecation")
	public int fecInsertTroblDstbxList(List<fecElrmVO> param, String seq) throws Exception{
    	try { 
			for ( int i =0;i<param.size();i++){
				fecElrmVO vo = param.get(i);
				vo.setLght_fclts_seq(seq);
	    		this.getSqlMapClient().insert("fecTotlInsrDAO.fecInsertTroblDstbx", vo);
	    	}			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println ("전기(가로등/조명탑) 장애 데이터 추가 실패");
			return 0;
		}
    	return 1;
    }
    
    // 전기(가로등/조명탑) 장애 테이블 추가(관제DB)
    public int fecInsertTroblDstbx(fecElrmVO param) throws Exception{
    	return update("fecTotlInsrDAO.fecInsertTroblDstbx", param);
    }
    
    // 전기 이벤트 테이블 max 순번(관제DB)
    @SuppressWarnings("deprecation")
	public String fecGetEventElctyMaxSeq() throws Exception{
    	return (String)selectByPk("fecTotlInsrDAO.fecGetEventElctyMaxSeq", null);
    }
    
    // 전기 이벤트 테이블 추가(관제DB)
    @SuppressWarnings("deprecation")
	public int fecInsertEventElctyList(List<fecElrmVO> param) throws Exception{
    	try { 
			for ( int i =0;i<param.size();i++){
				fecElrmVO vo = param.get(i);
	    		this.getSqlMapClient().insert("fecTotlInsrDAO.fecInsertEventElcty", vo);
	    	}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println ("전기(가로등/조명탑) 장애 데이터 추가 실패");
			return 0;
		}
    	return 1;
    }
    
    // 사면 테이블 삭제(관제DB)
    public int fecDeleteSlp() throws Exception{
    	return update("fecTotlInsrDAO.fecDeleteSlp", null);
    }
    
    // 사면 데이터 추가(관제 DB)
    @SuppressWarnings("deprecation")
	public int fecInsertSlpList(List<fecSlpVO> param) throws Exception{
    	try { 
			for ( int i =0;i<param.size();i++){
				fecSlpVO vo = param.get(i);
	    		this.getSqlMapClient().insert("fecTotlInsrDAO.fecInsertSlp", vo);
	    	}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println ("사면 데이터 추가 실패");
			return 0;
		}
    	return 1;
    	
    }
    
    // 사면 장애 테이블 max 순번(관제DB)
    @SuppressWarnings("deprecation")
	public String fecGetTroblSlpMaxSeq() throws Exception{
    	return (String)selectByPk("fecTotlInsrDAO.fecGetTroblSlpMaxSeq", null);
    }
    
    // 사면 장애 테이블 추가(관제DB)
    @SuppressWarnings("deprecation")
	public int fecInsertTroblSlpList(List<fecSlpVO> param, String seq) throws Exception{
    	try { 
			for ( int i =0;i<param.size();i++){
				fecSlpVO vo = param.get(i);
				vo.setSnsr_seq(seq);
	    		this.getSqlMapClient().insert("fecTotlInsrDAO.fecInsertTroblSlp", vo);
	    	}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println ("오수 장애 장애 데이터 추가 실패");
			return 0;
		}
    	return 1;
    }
    
    // 사면 이벤트 테이블 max 순번(관제DB)
    @SuppressWarnings("deprecation")
	public String fecGetEventSlpMaxSeq() throws Exception{
    	return (String)selectByPk("fecTotlInsrDAO.fecGetEventSlpMaxSeq", null);
    }
    
    // 사면 이벤트 테이블 추가(관제DB)
    @SuppressWarnings("deprecation")
	public int fecInsertEventSlpList(List<fecSlpVO> param) throws Exception{
    	try { 
			for ( int i =0;i<param.size();i++){
				fecSlpVO vo = param.get(i);
	    		this.getSqlMapClient().insert("fecTotlInsrDAO.fecInsertEventSlp", vo);
	    	}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println ("오수 이벤트 데이터 추가 실패");
			return 0;
		}
    	return 1;
    }
    
    // 오수 테이블 삭제(관제DB)
    public int fecDeleteSvar() throws Exception{
    	return update("fecTotlInsrDAO.fecDeleteSvar", null);
    }
        
    // 오수 데이터 추가(관제 DB)
    @SuppressWarnings("deprecation")
	public int fecInsertSvarList(List<fecSvarVO> param) throws Exception{
    	try { 
			for ( int i =0;i<param.size();i++){
				fecSvarVO vo = param.get(i);
	    		this.getSqlMapClient().insert("fecTotlInsrDAO.fecInsertSvar", vo);
	    	}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println ("오수 데이터 추가 실패");
			return 0;
		}
    	return 1;
    }
    
    public int fecInsertSvar(fecSvarVO param) throws Exception{
    	return update("fecTotlInsrDAO.fecInsertSvar", param);
    }
    
    // 오수 장애 테이블 max 순번(관제DB)
    @SuppressWarnings("deprecation")
	public String fecGetTroblMaxSeq() throws Exception{
    	return (String)selectByPk("fecTotlInsrDAO.fecGetTroblMaxSeq", null);
    }
    
    // 오수 장애 테이블 추가(관제DB)
    @SuppressWarnings("deprecation")
	public int fecInsertTroblSvarList(List<fecSvarVO> param, String seq) throws Exception{
    	try { 
			for ( int i =0;i<param.size();i++){
				fecSvarVO vo = param.get(i);
				vo.setPltwtr_seq(seq);
	    		this.getSqlMapClient().insert("fecTotlInsrDAO.fecInsertTroblSvar", vo);
	    	}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println ("오수 장애 장애 데이터 추가 실패");
			return 0;
		}
    	return 1;
    }
    
    // 오수 장애 테이블 추가(관제DB)
    public int fecInsertTroblSvar(fecSvarVO param) throws Exception{
    	return update("fecTotlInsrDAO.fecInsertTroblSvar", param);
    }
    
    // 오수 이벤트 테이블 max 순번(관제DB)
    @SuppressWarnings("deprecation")
	public String fecGetEventMaxSeq() throws Exception{
    	return (String)selectByPk("fecTotlInsrDAO.fecGetEventMaxSeq", null);
    }
    
    // 오수 이벤트 테이블 추가(관제DB)
    @SuppressWarnings("deprecation")
	public int fecInsertEventSvarList(List<fecSvarVO> param) throws Exception{
    	try { 
			for ( int i =0;i<param.size();i++){
				fecSvarVO vo = param.get(i);
	    		this.getSqlMapClient().insert("fecTotlInsrDAO.fecInsertEventSvar", vo);
	    	}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println ("오수 이벤트 데이터 추가 실패");
			return 0;
		}
    	return 1;
    }
    
    // 염수 테이블 삭제(관제DB)
    public int fecDeleteSlwt() throws Exception{
    	return update("fecTotlInsrDAO.fecDeleteSlwt", null);
    }
    
    // 염수 데이터 추가(관제 DB)
    public int fecInsertSlwt(List<fecSlwtVO> param) throws Exception{
    	return update("fecTotlInsrDAO.fecInsertSlwt", param);
    }    
    
    //CCTV 삭제(관제DB)
    public int fecDeleteCctv(String param) throws Exception{
    	return update("fecTotlInsrDAO.fecDeleteCctv", param);
    }
    
    // CCTV 이벤트 테이블 추가(관제DB)
    @SuppressWarnings("deprecation")
	public int fecInsertEventCctvList(List<fecCctvVO> param) throws Exception{
    	try { 
			for ( int i =0;i<param.size();i++){
				fecCctvVO vo = param.get(i);
	    		this.getSqlMapClient().insert("fecTotlInsrDAO.fecInsertEventCctv", vo);
	    	}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println ("CCTV 이벤트 데이터 추가 실패");
			return 0;
		}
    	return 1;
    }
    
    //스케줄러 조회(관제DB)
    @SuppressWarnings("deprecation")
    public int getSchedulerState() throws Exception{
    	return (int)selectByPk("fecTotlInsrDAO.getSchedulerState", null);
    }
    
    //스케줄러 상태 변경(관제DB)
    public int updateSchedulerState(int param) throws Exception{
    	return update("fecTotlInsrDAO.updateSchedulerState", param);
    }
    
    // 터널 이벤트 테이블 데이터 삭제(관제DB)
    public int fecDeleteTunnelEventData(int param) throws Exception{
    	return update("fecTotlInsrDAO.fecDeleteTunnelEventData", param);
    }
    
    // 전기 이벤트 테이블 데이터 삭제(관제DB)
    public int fecDeleteElrmEventData(int param) throws Exception{
    	return update("fecTotlInsrDAO.fecDeleteElrmEventData", param);
    }
    
    // 사면 이벤트 테이블 데이터 삭제(관제DB)
    public int fecDeleteSlpEventData(int param) throws Exception{
    	return update("fecTotlInsrDAO.fecDeleteSlpEventData", param);
    }
    
    // 오수 이벤트 테이블 데이터 삭제(관제DB)
    public int fecDeleteSvarEventData(int param) throws Exception{
    	return update("fecTotlInsrDAO.fecDeleteSvarEventData", param);
    }
    
    // 터널 장애 테이블 데이터 삭제(관제DB)
    public int fecDeleteTunnelTroblData(int param) throws Exception{
    	return update("fecTotlInsrDAO.fecDeleteTunnelTroblData", param);
    }
    
    // 전기(영업소/터널) 장애 테이블 데이터 삭제(관제DB)
    public int fecDeleteElrmTroblData(int param) throws Exception{
    	return update("fecTotlInsrDAO.fecDeleteElrmTroblData", param);
    }
    
    // 전기(가로등/조명탑) 장애 테이블 데이터 삭제(관제DB)
    public int fecDeleteDstbxTroblData(int param) throws Exception{
    	return update("fecTotlInsrDAO.fecDeleteDstbxTroblData", param);
    }
    
    // 사면 장애 테이블 데이터 삭제(관제DB)
    public int fecDeleteSlpTroblData(int param) throws Exception{
    	return update("fecTotlInsrDAO.fecDeleteSlpTroblData", param);
    }
    
    // 오수 장애 테이블 데이터 삭제(관제DB)
    public int fecDeleteSvarTroblData(int param) throws Exception{
    	return update("fecTotlInsrDAO.fecDeleteSvarTroblData", param);
    }
    
}
