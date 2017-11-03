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
public class FecBrineVO {
	
    private static final long serialVersionUID = 1L;
    
    private String deptCode; /** 부서코드 */
    private String deptNm; /** 부서명 */    
    private String jisaNm; /** 지사명*/
    private String jisaCode; /** 지사코드*/
    private String routeCd; /** 노선코드*/
    private String loctId; /** 위치*/
    private String jetShhmm; /** 분사시작*/
    private String jetEhhmm; /** 분사종료*/
    private String jetHhmm; /** 분사시간*/

    
	
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


	public String getRouteCd() {
		return routeCd;
	}


	public void setRouteCd(String routeCd) {
		this.routeCd = routeCd;
	}


	public String getLoctId() {
		return loctId;
	}


	public void setLoctId(String loctId) {
		this.loctId = loctId;
	}


	public String getJetShhmm() {
		return jetShhmm;
	}


	public void setJetShhmm(String jetShhmm) {
		this.jetShhmm = jetShhmm;
	}


	public String getJetEhhmm() {
		return jetEhhmm;
	}


	public void setJetEhhmm(String jetEhhmm) {
		this.jetEhhmm = jetEhhmm;
	}


	public String getJetHhmm() {
		return jetHhmm;
	}


	public void setJetHhmm(String jetHhmm) {
		this.jetHhmm = jetHhmm;
	}

	
}
