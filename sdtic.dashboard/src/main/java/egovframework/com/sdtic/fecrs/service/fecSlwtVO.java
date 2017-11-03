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
public class fecSlwtVO {

    private static final long serialVersionUID = 1L;

    //염수
    private String eqpm_seq; //장비 일련번호
    private String mtnof_cd;  //지사코드
    private String eqpm_no;//장비번호 
	public String getEqpm_seq() {
		return eqpm_seq;
	}
	public void setEqpm_seq(String eqpm_seq) {
		this.eqpm_seq = eqpm_seq;
	}
	public String getMtnof_cd() {
		return mtnof_cd;
	}
	public void setMtnof_cd(String mtnof_cd) {
		this.mtnof_cd = mtnof_cd;
	}
	public String getEqpm_no() {
		return eqpm_no;
	}
	public void setEqpm_no(String eqpm_no) {
		this.eqpm_no = eqpm_no;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
    
    
}
