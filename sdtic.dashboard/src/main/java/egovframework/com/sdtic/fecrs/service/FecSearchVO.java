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
public class FecSearchVO {

    private static final long serialVersionUID = 1L;
    
    private String deptCode; /** 부서코드 */
    private String bonbuCode;/** 본부코드 */
    private String facCode; /** 시설코드 */
    private String seqMax; /** 기기최신순서 */    
    
    private String ggtm_x; /** X좌표 */
    private String ggtm_y; /** Y좌표 */
    private String sabun; /** 사번 */
	public String getDeptCode() {
		return deptCode;
	}
	public void setDeptCode(String deptCode) {
		this.deptCode = deptCode;
	}
	public String getFacCode() {
		return facCode;
	}
	public void setFacCode(String facCode) {
		this.facCode = facCode;
	}
	public String getSeqMax() {
		return seqMax;
	}
	public void setSeqMax(String seqMax) {
		this.seqMax = seqMax;
	}
	public String getGgtm_x() {
		return ggtm_x;
	}
	public void setGgtm_x(String ggtm_x) {
		this.ggtm_x = ggtm_x;
	}
	public String getGgtm_y() {
		return ggtm_y;
	}
	public void setGgtm_y(String ggtm_y) {
		this.ggtm_y = ggtm_y;
	}
	public String getSabun() {
		return sabun;
	}
	public void setSabun(String sabun) {
		this.sabun = sabun;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getBonbuCode() {
		return bonbuCode;
	}
	public void setBonbuCode(String bonbuCode) {
		this.bonbuCode = bonbuCode;
	}
	
}
