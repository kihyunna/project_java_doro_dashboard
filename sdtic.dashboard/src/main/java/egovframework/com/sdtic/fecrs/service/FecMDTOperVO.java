package egovframework.com.sdtic.fecrs.service;

/**
 * @Class Name : FecSearchVO.java
 * @Description : FecSearchVO Class
 * @Modification Information
 * @
 * @ 수정일        수정자                        수정내용
 * @ -----------   ---------   -------------------------------
 * @ 2017.07.18    nkh                         최초생성
 *
 * @author itforward
 * @since 2017. 07.18
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */
public class FecMDTOperVO {
	
    private static final long serialVersionUID = 1L;
    
    private String deptCode; /** 부서코드 */
    private String deptNm; /** 부서명 */    
    private String nrmltToday; /** 당일 95% 이상 수신율 차량 대수*/
    private String warnToday;  /** 당일 85% ~ 94% 수신율 차량 대수*/
    private String troblToday; /** 당일 85% 이하 수신율 차량 대수*/
    private String nrmltBfrt; /** 전일 95% 이상 수신율 차량 대수*/
    private String warnBfrt;  /** 전일 85% ~ 94% 수신율 차량 대수*/
    private String troblBfrt; /** 전일 85% 이하 수신율 차량 대수*/
    private String mdtId;     /** 차량 ID*/
    private String mdtOpert; /** 차량 작업*/
    private String mdtLastLc; /** 최종위치*/
    private String recptnRatio; /** 수신율*/
    private String mtnof_nm;/**지사명*/
    private String rgst_seq;/**차량번호*/
    private String insr_modl_nm;/**차량모델명*/
    private String xcord; /** 위치*/
    private String ycord; /** 위치*/    
    private String hdqr_nm; /** 본부명*/
    private String hdqr_xcord; /** 본부위치*/
    private String hdqr_ycord; /** 본부위치*/
    
	public String getDeptCode() {
		return deptCode;
	}
	public void setDeptCode(String deptCode) {
		this.deptCode = deptCode;
	}
	public String getDeptNm() {
		return deptNm;
	}
	public void setDeptNm(String deptNm) {
		this.deptNm = deptNm;
	}
	public String getNrmltToday() {
		return nrmltToday;
	}
	public void setNrmltToday(String nrmltToday) {
		this.nrmltToday = nrmltToday;
	}
	public String getWarnToday() {
		return warnToday;
	}
	public void setWarnToday(String warnToday) {
		this.warnToday = warnToday;
	}
	public String getTroblToday() {
		return troblToday;
	}
	public void setTroblToday(String troblToday) {
		this.troblToday = troblToday;
	}
	public String getNrmltBfrt() {
		return nrmltBfrt;
	}
	public void setNrmltBfrt(String nrmltBfrt) {
		this.nrmltBfrt = nrmltBfrt;
	}
	public String getWarnBfrt() {
		return warnBfrt;
	}
	public void setWarnBfrt(String warnBfrt) {
		this.warnBfrt = warnBfrt;
	}
	public String getTroblBfrt() {
		return troblBfrt;
	}
	public void setTroblBfrt(String troblBfrt) {
		this.troblBfrt = troblBfrt;
	}
	public String getMdtId() {
		return mdtId;
	}
	public void setMdtId(String mdtId) {
		this.mdtId = mdtId;
	}
	public String getMdtOpert() {
		return mdtOpert;
	}
	public void setMdtOpert(String mdtOpert) {
		this.mdtOpert = mdtOpert;
	}
	public String getMdtLastLc() {
		return mdtLastLc;
	}
	public void setMdtLastLc(String mdtLastLc) {
		this.mdtLastLc = mdtLastLc;
	}
	public String getRecptnRatio() {
		return recptnRatio;
	}
	public void setRecptnRatio(String recptnRatio) {
		this.recptnRatio = recptnRatio;
	}
	public String getMtnof_nm() {
		return mtnof_nm;
	}
	public void setMtnof_nm(String mtnof_nm) {
		this.mtnof_nm = mtnof_nm;
	}
	public String getRgst_seq() {
		return rgst_seq;
	}
	public void setRgst_seq(String rgst_seq) {
		this.rgst_seq = rgst_seq;
	}
	public String getInsr_modl_nm() {
		return insr_modl_nm;
	}
	public void setInsr_modl_nm(String insr_modl_nm) {
		this.insr_modl_nm = insr_modl_nm;
	}
	public String getXcord() {
		return xcord;
	}
	public void setXcord(String xcord) {
		this.xcord = xcord;
	}
	public String getYcord() {
		return ycord;
	}
	public void setYcord(String ycord) {
		this.ycord = ycord;
	}
	public String getHdqr_nm() {
		return hdqr_nm;
	}
	public void setHdqr_nm(String hdqr_nm) {
		this.hdqr_nm = hdqr_nm;
	}
	public String getHdqr_xcord() {
		return hdqr_xcord;
	}
	public void setHdqr_xcord(String hdqr_xcord) {
		this.hdqr_xcord = hdqr_xcord;
	}
	public String getHdqr_ycord() {
		return hdqr_ycord;
	}
	public void setHdqr_ycord(String hdqr_ycord) {
		this.hdqr_ycord = hdqr_ycord;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
    	  
}
