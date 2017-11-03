package egovframework.com.sdtic.fecrs.service;

/**
 * @Class Name : FecMainMapVO.java
 * @Description : FecMainMapVO Class
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
public class FecMainMapVO {
	
    private static final long serialVersionUID = 1L;
    
    private String deptCode; /** 부서코드 */
    private String deptNm; /** 부서명 */  
    private String fcltyCode; /** 시설종류코드 */  
    private String fcltyName; /** 시설종류명 */  
    private String trobl; /** 장애여부*/
    private String lon; /** 위치*/
    private String lat; /** 위치*/   
    private String facCode; /** 고유 시설 코드*/ 
    
    private String slopeSensorId; /** 센서ID*/ 
    private String slopeSensorSlant;/** 센서기울기*/ 
    private String slopeSensorImpact;/** 센서 충격량*/ 
    private String slopeSensorSlantThrhld;/** 기울기 임계치*/ 
    private String slopeSensorImpactThrhld;/** 충격량 임계치*/ 
    
    private String brineId; /** 염수ID*/ 
    private String brineSprayy;/** 염수분사 장애 */ 
    private String brineTank;/** 염수조 장애 */
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
	public String getFcltyCode() {
		return fcltyCode;
	}
	public void setFcltyCode(String fcltyCode) {
		this.fcltyCode = fcltyCode;
	}
	public String getFcltyName() {
		return fcltyName;
	}
	public void setFcltyName(String fcltyName) {
		this.fcltyName = fcltyName;
	}
	public String getTrobl() {
		return trobl;
	}
	public void setTrobl(String trobl) {
		this.trobl = trobl;
	}
	public String getLon() {
		return lon;
	}
	public void setLon(String lon) {
		this.lon = lon;
	}
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public String getFacCode() {
		return facCode;
	}
	public void setFacCode(String facCode) {
		this.facCode = facCode;
	}
	public String getSlopeSensorId() {
		return slopeSensorId;
	}
	public void setSlopeSensorId(String slopeSensorId) {
		this.slopeSensorId = slopeSensorId;
	}
	public String getSlopeSensorSlant() {
		return slopeSensorSlant;
	}
	public void setSlopeSensorSlant(String slopeSensorSlant) {
		this.slopeSensorSlant = slopeSensorSlant;
	}
	public String getSlopeSensorImpact() {
		return slopeSensorImpact;
	}
	public void setSlopeSensorImpact(String slopeSensorImpact) {
		this.slopeSensorImpact = slopeSensorImpact;
	}
	public String getSlopeSensorSlantThrhld() {
		return slopeSensorSlantThrhld;
	}
	public void setSlopeSensorSlantThrhld(String slopeSensorSlantThrhld) {
		this.slopeSensorSlantThrhld = slopeSensorSlantThrhld;
	}
	public String getSlopeSensorImpactThrhld() {
		return slopeSensorImpactThrhld;
	}
	public void setSlopeSensorImpactThrhld(String slopeSensorImpactThrhld) {
		this.slopeSensorImpactThrhld = slopeSensorImpactThrhld;
	}
	public String getBrineId() {
		return brineId;
	}
	public void setBrineId(String brineId) {
		this.brineId = brineId;
	}
	public String getBrineSprayy() {
		return brineSprayy;
	}
	public void setBrineSprayy(String brineSprayy) {
		this.brineSprayy = brineSprayy;
	}
	public String getBrineTank() {
		return brineTank;
	}
	public void setBrineTank(String brineTank) {
		this.brineTank = brineTank;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}   
}
