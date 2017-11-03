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
public class FecElctyFcltsVO {
	
    private static final long serialVersionUID = 1L;
    
    private String deptCode; /** 부서코드 */
    private String deptNm; /** 부서명 */    
    private String jisaNm; /** 지사명*/
    private String jisaCode; /** 지사코드*/
    private String elctyFcltyCode; /** 전기시설코드*/
    private String elctyFcltyNm; /** 전기시설명*/
    private String troblCn; /** 장애내용*/
    private String occrrncTime; /** 발생시간*/
    
    
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


	public String getElctyFcltyCode() {
		return elctyFcltyCode;
	}


	public void setElctyFcltyCode(String elctyFcltyCode) {
		this.elctyFcltyCode = elctyFcltyCode;
	}


	public String getElctyFcltyNm() {
		return elctyFcltyNm;
	}


	public void setElctyFcltyNm(String elctyFcltyNm) {
		this.elctyFcltyNm = elctyFcltyNm;
	}


	public String getTroblCn() {
		return troblCn;
	}


	public void setTroblCn(String troblCn) {
		this.troblCn = troblCn;
	}


	public String getOccrrncTime() {
		return occrrncTime;
	}


	public void setOccrrncTime(String occrrncTime) {
		this.occrrncTime = occrrncTime;
	}


	
	  
}
