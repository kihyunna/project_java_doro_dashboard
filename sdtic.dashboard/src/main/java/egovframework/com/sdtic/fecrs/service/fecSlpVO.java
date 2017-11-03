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
public class fecSlpVO {

    private static final long serialVersionUID = 1L;

    //사면 계측기 감지기
    
    //공통
    public String msis_gtwy_id;    
    public String msis_snsr_id;
    public String use_yn;
    public String fsttm_rgst_dttm;
    public String lsttm_altr_dttm;
    
    
    //총기기
    public String fclts_intg_id;
    public String hdqr_cd;
    public String hdqr_nm;
    public String mtnof_cd;
    public String mtnof_nm;
    public String pbus_route_cd;
    public String use_rotnm;
    public String regin_nm;
    public String pbus_stpnt_dstnc;
    public String drve_drnm;
    public String pbus_drve_drct_cd;
    public String ggtm_xcord;
    public String ggtm_ycord;
    
    // 장애
    public String snsr_seq;
    public String trobl_type;
    private String insert_time;//입력시간

    //이벤트
    public String msis_idx_seq;
    public String msis_ntfc_kind_cd;
    
	public String getMsis_gtwy_id() {
		return msis_gtwy_id;
	}
	public void setMsis_gtwy_id(String msis_gtwy_id) {
		this.msis_gtwy_id = msis_gtwy_id;
	}
	public String getMsis_snsr_id() {
		return msis_snsr_id;
	}
	public void setMsis_snsr_id(String msis_snsr_id) {
		this.msis_snsr_id = msis_snsr_id;
	}
	public String getUse_yn() {
		return use_yn;
	}
	public void setUse_yn(String use_yn) {
		this.use_yn = use_yn;
	}
	public String getFsttm_rgst_dttm() {
		return fsttm_rgst_dttm;
	}
	public void setFsttm_rgst_dttm(String fsttm_rgst_dttm) {
		this.fsttm_rgst_dttm = fsttm_rgst_dttm;
	}
	public String getLsttm_altr_dttm() {
		return lsttm_altr_dttm;
	}
	public void setLsttm_altr_dttm(String lsttm_altr_dttm) {
		this.lsttm_altr_dttm = lsttm_altr_dttm;
	}
	public String getFclts_intg_id() {
		return fclts_intg_id;
	}
	public void setFclts_intg_id(String fclts_intg_id) {
		this.fclts_intg_id = fclts_intg_id;
	}
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
	public String getPbus_route_cd() {
		return pbus_route_cd;
	}
	public void setPbus_route_cd(String pbus_route_cd) {
		this.pbus_route_cd = pbus_route_cd;
	}
	public String getUse_rotnm() {
		return use_rotnm;
	}
	public void setUse_rotnm(String use_rotnm) {
		this.use_rotnm = use_rotnm;
	}
	public String getRegin_nm() {
		return regin_nm;
	}
	public void setRegin_nm(String regin_nm) {
		this.regin_nm = regin_nm;
	}
	public String getPbus_stpnt_dstnc() {
		return pbus_stpnt_dstnc;
	}
	public void setPbus_stpnt_dstnc(String pbus_stpnt_dstnc) {
		this.pbus_stpnt_dstnc = pbus_stpnt_dstnc;
	}
	public String getDrve_drnm() {
		return drve_drnm;
	}
	public void setDrve_drnm(String drve_drnm) {
		this.drve_drnm = drve_drnm;
	}
	public String getPbus_drve_drct_cd() {
		return pbus_drve_drct_cd;
	}
	public void setPbus_drve_drct_cd(String pbus_drve_drct_cd) {
		this.pbus_drve_drct_cd = pbus_drve_drct_cd;
	}
	public String getGgtm_xcord() {
		return ggtm_xcord;
	}
	public void setGgtm_xcord(String ggtm_xcord) {
		this.ggtm_xcord = ggtm_xcord;
	}
	public String getGgtm_ycord() {
		return ggtm_ycord;
	}
	public void setGgtm_ycord(String ggtm_ycord) {
		this.ggtm_ycord = ggtm_ycord;
	}
	public String getSnsr_seq() {
		return snsr_seq;
	}
	public void setSnsr_seq(String snsr_seq) {
		this.snsr_seq = snsr_seq;
	}
	public String getTrobl_type() {
		return trobl_type;
	}
	public void setTrobl_type(String trobl_type) {
		this.trobl_type = trobl_type;
	}
	public String getMsis_idx_seq() {
		return msis_idx_seq;
	}
	public void setMsis_idx_seq(String msis_idx_seq) {
		this.msis_idx_seq = msis_idx_seq;
	}
	public String getMsis_ntfc_kind_cd() {
		return msis_ntfc_kind_cd;
	}
	public void setMsis_ntfc_kind_cd(String msis_ntfc_kind_cd) {
		this.msis_ntfc_kind_cd = msis_ntfc_kind_cd;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getInsert_time() {
		return insert_time;
	}
	public void setInsert_time(String insert_time) {
		this.insert_time = insert_time;
	}            
}
