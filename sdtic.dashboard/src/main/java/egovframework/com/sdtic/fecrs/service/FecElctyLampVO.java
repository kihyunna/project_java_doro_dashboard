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
public class FecElctyLampVO {
	
    private static final long serialVersionUID = 1L;
    
    private String deptCode; /** 부서코드 */
    private String deptNm; /** 부서명 */    
    private String jisaNm; /** 지사명*/
    private String jisaCode; /** 지사코드*/
    private String dstncNm; /** 위치명칭*/
    private String dstnc; /** 이정*/
    private String gubun; /** 구분*/
    private String blackOut; /** 정전*/
    private String shortCircuit; /** 누전*/
    private String openDoor; /** 문열림*/
    
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}


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


	public String getJisaNm() {
		return jisaNm;
	}


	public void setJisaNm(String jisaNm) {
		this.jisaNm = jisaNm;
	}


	public String getJisaCode() {
		return jisaCode;
	}


	public void setJisaCode(String jisaCode) {
		this.jisaCode = jisaCode;
	}


	public String getDstnc() {
		return dstnc;
	}


	public void setDstnc(String dstnc) {
		this.dstnc = dstnc;
	}
	
	

	public String getDstncNm() {
		return dstncNm;
	}


	public void setDstncNm(String dstncNm) {
		this.dstncNm = dstncNm;
	}


	public String getGubun() {
		return gubun;
	}


	public void setGubun(String gubun) {
		this.gubun = gubun;
	}


	public String getBlackOut() {
		return blackOut;
	}


	public void setBlackOut(String blackOut) {
		this.blackOut = blackOut;
	}


	public String getShortCircuit() {
		return shortCircuit;
	}


	public void setShortCircuit(String shortCircuit) {
		this.shortCircuit = shortCircuit;
	}


	public String getOpenDoor() {
		return openDoor;
	}


	public void setOpenDoor(String openDoor) {
		this.openDoor = openDoor;
	}
	
	

}
