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
public class FecSlopeVO {
	
    private static final long serialVersionUID = 1L;
    
    private String deptCode; /** 부서코드 */
    private String deptNm; /** 부서명 */    
    private String jisaNm; /** 지사명*/
    private String jisaCode; /** 지사코드*/
    private String dstnc; /** 이정*/
    private String useRotnm; /** 사용노선명*/
    private String drveDrnm; /** 주행방향명*/
    private String troblType; /** 장애구분*/
    private String batteryTrobl; /** 배터리장애*/
    private String impactTrobl; /** 충격장애*/

    
	
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


	public String getUseRotnm() {
		return useRotnm;
	}


	public void setUseRotnm(String useRotnm) {
		this.useRotnm = useRotnm;
	}


	public String getDrveDrnm() {
		return drveDrnm;
	}


	public void setDrveDrnm(String drveDrnm) {
		this.drveDrnm = drveDrnm;
	}


	public String getTroblType() {
		return troblType;
	}


	public void setTroblType(String troblType) {
		this.troblType = troblType;
	}


	public String getBatteryTrobl() {
		return batteryTrobl;
	}


	public void setBatteryTrobl(String batteryTrobl) {
		this.batteryTrobl = batteryTrobl;
	}


	public String getImpactTrobl() {
		return impactTrobl;
	}


	public void setImpactTrobl(String impactTrobl) {
		this.impactTrobl = impactTrobl;
	}


	
}
