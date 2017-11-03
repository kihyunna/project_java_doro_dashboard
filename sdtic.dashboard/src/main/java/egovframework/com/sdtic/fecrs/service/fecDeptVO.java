package egovframework.com.sdtic.fecrs.service;

/**
 * @Class Name : fecMainVO.java
 * @Description : fecMainVO Class
 * @Modification Information
 * @
 * @ 수정일        수정자                        수정내용
 * @ -----------   ---------   -------------------------------
 * @ 2017.06.01    jkheo                         최초생성
 *
 * @author itforward
 * @since 2017. 06.01
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */
public class fecDeptVO {

    private static final long serialVersionUID = 1L;

    /** 노선 정보 */
    private String hdqr_cd; //본부코드
    private String hdqr_nm; //본부명
    private String mtnof_cd; //지사코드
    private String mtnof_nm; //지사명
	public String getHdqr_cd() {
		return hdqr_cd;
	}
	public void setHdqr_cd(String hdqr_cd) {
		this.hdqr_cd = hdqr_cd;
	}
	public String getHdqr_nm() {
		return hdqr_nm;
	}
	public void setHdqr_nm(String hdqr_nm) {
		this.hdqr_nm = hdqr_nm;
	}
	public String getMtnof_cd() {
		return mtnof_cd;
	}
	public void setMtnof_cd(String mtnof_cd) {
		this.mtnof_cd = mtnof_cd;
	}
	public String getMtnof_nm() {
		return mtnof_nm;
	}
	public void setMtnof_nm(String mtnof_nm) {
		this.mtnof_nm = mtnof_nm;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

    
}
