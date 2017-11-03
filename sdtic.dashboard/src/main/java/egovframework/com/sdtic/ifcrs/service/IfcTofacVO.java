package egovframework.com.sdtic.ifcrs.service;

/**
 * @Class Name :  ifcMainVo.java
 * @Description : ifcMainVo Class
 * @Modification Information
 * @
 * @ 수정일          수정자                       수정내용
 * @ -----------   ---------   -------------------------------
 * @ 2017. 06. 01    jkheo                       최초생성
 *
 * @author
 * @since
 * @version 1.0
 * @see
 *
 */
@SuppressWarnings("serial")
public class IfcTofacVO extends IfcDefaultSearchVO {

	private String cmmn_cd;
	private String cmmn_cd_nm;
	private String inqy_tord;
	private String cre_dttm;
	private String trst_stat_cnt;
	private String is_error;
	
	private String con;
	private String hostname;
	private String err_log_cnt;
	private String inst_date;
	private String cre_date;
	
	public String getCmmn_cd() {
		return cmmn_cd;
	}
	public void setCmmn_cd(String cmmn_cd) {
		this.cmmn_cd = cmmn_cd;
	}
	public String getCmmn_cd_nm() {
		return cmmn_cd_nm;
	}
	public void setCmmn_cd_nm(String cmmn_cd_nm) {
		this.cmmn_cd_nm = cmmn_cd_nm;
	}
	public String getInqy_tord() {
		return inqy_tord;
	}
	public void setInqy_tord(String inqy_tord) {
		this.inqy_tord = inqy_tord;
	}
	public String getCre_dttm() {
		return cre_dttm;
	}
	public void setCre_dttm(String cre_dttm) {
		this.cre_dttm = cre_dttm;
	}
	public String getTrst_stat_cnt() {
		return trst_stat_cnt;
	}
	public void setTrst_stat_cnt(String trst_stat_cnt) {
		this.trst_stat_cnt = trst_stat_cnt;
	}
	public String getIs_error() {
		return is_error;
	}
	public void setIs_error(String is_error) {
		this.is_error = is_error;
	}
	public String getCon() {
		return con;
	}
	public void setCon(String con) {
		this.con = con;
	}
	public String getHostname() {
		return hostname;
	}
	public void setHostname(String hostname) {
		this.hostname = hostname;
	}
	public String getErr_log_cnt() {
		return err_log_cnt;
	}
	public void setErr_log_cnt(String err_log_cnt) {
		this.err_log_cnt = err_log_cnt;
	}
	public String getInst_date() {
		return inst_date;
	}
	public void setInst_date(String inst_date) {
		this.inst_date = inst_date;
	}
	public String getCre_date() {
		return cre_date;
	}
	public void setCre_date(String cre_date) {
		this.cre_date = cre_date;
	}
}