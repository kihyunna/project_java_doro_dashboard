package egovframework.com.sdtic.bucrs.service;

/**
 * @Class Name : bucMainVO.java
 * @Description : bucMainVO Class
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
public class bucMainVO {

    private static final long serialVersionUID = 1L;

    /** 노선 정보 */
    private String routeid;
    private String routename;
    private String routetype;
    private String routeseq;


    /** 코드그룹 아이디 */
    private String code_grp_id;

    /** 코드 아이디 */
    private String code_id;

    /** 코드명 */
    private String code_name;

    /** 등록일자 */
    private String regist_date;

    /** 등록자아이디 */
    private String regist_id;

    /** 수정일자 */
    private String updt_date;

    /** 수정자아이디 */
    private String updt_id;

    /** 사용여부 */
    private String use_yn;
    
    /**메인관제 사용자접속현황**/
    private String hgrn_systm_cd;
    private String cnt;
    
    /**메인관제 대외연계 **/
    private String biz_nm;
    private String trst_ty;
    private String trst_stat_r;
    private String trst_stat_c;
    private String trst_stat_e;
    
    /**메인관제 본부별 전력량 추이**/
    private String intg_dptcd;
    private String intg_dptnm;
    private String sept_month;
    private String sept_year;
    private String used_amount;
    private String used_cost;
    
    /**건설사업단공정율**/
    private String biz_loct_count;
    private String biz_mgmt_nm;
    private Float whol_plan_rate;
    private Float whol_efcn_rate;
    private Float whol_ctrs_prcrt;
    
    
    public Float getWhol_plan_rate() {
		return whol_plan_rate;
	}

	public void setWhol_plan_rate(Float whol_plan_rate) {
		this.whol_plan_rate = whol_plan_rate;
	}

	public Float getWhol_efcn_rate() {
		return whol_efcn_rate;
	}

	public void setWhol_efcn_rate(Float whol_efcn_rate) {
		this.whol_efcn_rate = whol_efcn_rate;
	}

	public Float getWhol_ctrs_prcrt() {
		return whol_ctrs_prcrt;
	}

	public void setWhol_ctrs_prcrt(Float whol_ctrs_prcrt) {
		this.whol_ctrs_prcrt = whol_ctrs_prcrt;
	}

	public String getBiz_loct_count() {
		return biz_loct_count;
	}

	public void setBiz_loct_count(String biz_loct_count) {
		this.biz_loct_count = biz_loct_count;
	}

	public String getBiz_mgmt_nm() {
		return biz_mgmt_nm;
	}

	public void setBiz_mgmt_nm(String biz_mgmt_nm) {
		this.biz_mgmt_nm = biz_mgmt_nm;
	}

	public String getIntg_dptcd() {
		return intg_dptcd;
	}

	public void setIntg_dptcd(String intg_dptcd) {
		this.intg_dptcd = intg_dptcd;
	}

	public String getIntg_dptnm() {
		return intg_dptnm;
	}

	public void setIntg_dptnm(String intg_dptnm) {
		this.intg_dptnm = intg_dptnm;
	}

	public String getSept_month() {
		return sept_month;
	}

	public void setSept_month(String sept_month) {
		this.sept_month = sept_month;
	}

	public String getSept_year() {
		return sept_year;
	}

	public void setSept_year(String sept_year) {
		this.sept_year = sept_year;
	}

	public String getUsed_amount() {
		return used_amount;
	}

	public void setUsed_amount(String used_amount) {
		this.used_amount = used_amount;
	}

	public String getUsed_cost() {
		return used_cost;
	}

	public void setUsed_cost(String used_cost) {
		this.used_cost = used_cost;
	}

	public String getBiz_nm() {
		return biz_nm;
	}

	public void setBiz_nm(String biz_nm) {
		this.biz_nm = biz_nm;
	}

	public String getTrst_ty() {
		return trst_ty;
	}

	public void setTrst_ty(String trst_ty) {
		this.trst_ty = trst_ty;
	}

	public String getTrst_stat_r() {
		return trst_stat_r;
	}

	public void setTrst_stat_r(String trst_stat_r) {
		this.trst_stat_r = trst_stat_r;
	}

	public String getTrst_stat_c() {
		return trst_stat_c;
	}

	public void setTrst_stat_c(String trst_stat_c) {
		this.trst_stat_c = trst_stat_c;
	}

	public String getTrst_stat_e() {
		return trst_stat_e;
	}

	public void setTrst_stat_e(String trst_stat_e) {
		this.trst_stat_e = trst_stat_e;
	}
	public String getHgrn_systm_cd() {
		return hgrn_systm_cd;
	}

	public void setHgrn_systm_cd(String hgrn_systm_cd) {
		this.hgrn_systm_cd = hgrn_systm_cd;
	}

	public String getCnt() {
		return cnt;
	}

	public void setCnt(String cnt) {
		this.cnt = cnt;
	}

	public String getRouteid() {
        return routeid;
    }

    public void setRouteid(String routeid) {
        this.routeid = routeid;
    }

    public String getRoutename() {
        return routename;
    }

    public void setRoutename(String routename) {
        this.routename = routename;
    }

    public String getRoutetype() {
        return routetype;
    }

    public void setRoutetype(String routetype) {
        this.routetype = routetype;
    }

    public String getRouteseq() {
        return routeseq;
    }

    public void setRouteseq(String routeseq) {
        this.routeseq = routeseq;
    }

    public String getCode_grp_id() {
        return code_grp_id;
    }

    public void setCode_grp_id(String code_grp_id) {
        this.code_grp_id = code_grp_id;
    }

    public String getCode_id() {
        return code_id;
    }

    public void setCode_id(String code_id) {
        this.code_id = code_id;
    }

    public String getCode_name() {
        return code_name;
    }

    public void setCode_name(String code_name) {
        this.code_name = code_name;
    }

    public String getRegist_date() {
        return regist_date;
    }

    public void setRegist_date(String regist_date) {
        this.regist_date = regist_date;
    }

    public String getRegist_id() {
        return regist_id;
    }

    public void setRegist_id(String regist_id) {
        this.regist_id = regist_id;
    }

    public String getUpdt_date() {
        return updt_date;
    }

    public void setUpdt_date(String updt_date) {
        this.updt_date = updt_date;
    }

    public String getUpdt_id() {
        return updt_id;
    }

    public void setUpdt_id(String updt_id) {
        this.updt_id = updt_id;
    }

    public String getUse_yn() {
        return use_yn;
    }

    public void setUse_yn(String use_yn) {
        this.use_yn = use_yn;
    }

    public static long getSerialversionuid() {
        return serialVersionUID;
    }



}
