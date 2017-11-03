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
public class mainSptIOTVO {
	
    private static final long serialVersionUID = 1L;
    
    private String deptCode; /** 부서코드 */
    private String deptNm; /** 부서명 */    
    private String jisaNm; /** 지사명*/
    private String jisaCode; /** 지사코드*/
    private String jobDttm; /** 날짜*/
    private String tm; /** 시간*/
    private String rnum; /** 순서*/
    private String tTrAmnt; /** 금일*/
    private String yTrAmnt; /** 전일*/

    
	
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


	public String getJobDttm() {
		return jobDttm;
	}


	public void setJobDttm(String jobDttm) {
		this.jobDttm = jobDttm;
	}


	public String getTm() {
		return tm;
	}


	public void setTm(String tm) {
		this.tm = tm;
	}


	public String getRnum() {
		return rnum;
	}


	public void setRnum(String rnum) {
		this.rnum = rnum;
	}


	public String gettTrAmnt() {
		return tTrAmnt;
	}


	public void settTrAmnt(String tTrAmnt) {
		this.tTrAmnt = tTrAmnt;
	}


	public String getyTrAmnt() {
		return yTrAmnt;
	}


	public void setyTrAmnt(String yTrAmnt) {
		this.yTrAmnt = yTrAmnt;
	}


	
}
