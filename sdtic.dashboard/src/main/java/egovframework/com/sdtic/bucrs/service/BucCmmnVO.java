package egovframework.com.sdtic.bucrs.service;

/**
 * @Class Name :  BucCmmnVo.java
 * @Description : BucCmmnVo Class
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
public class BucCmmnVO {

    private static final long serialVersionUID = 1L;

    private String temp1;
    private String temp2;
    private String temp3;
    private String temp4;

    //SMS 발송현황
    private String sms_business_code;
    private String sms_business_code_name;
    private String sms_business_code_cnt;

    //HELP DESK 현황
    private String success_cnt;
    private String fail_cnt;
    private String wait_cnt;
    private String helpdesk_code;
    private String helpdesk_code_name;

    //간이결재 처리현황
    private String simplctysanctn_code;
    private String simplctysanctn_code_name;
    
    //대외연계 송수신현황
    private String extrnlcntc1l;
    private String extrnlcntc2l;
    private String extrnlcntc3l;
    private String extrnlcntc4l;
    private String extrnlcntc1r;
    private String extrnlcntc2r;
    private String extrnlcntc3r;
    private String extrnlcntc4r;
    
    //활용메뉴 top5(파이차트 DB)
    private String hgrn_systm_cd;
    private String systm_nm;
    private String cnt;
    																														
    //활용메뉴 top5(그리드 DB)

    private String up_systm_nm;
    private String menu_nm;
    private String y_rank;
    private String rank;
    
    //HELP DESK 현황 DB
    private String fir_category_id;
    private String fir_category_nm;
    private String total;
    private String request;
    private String un_processing;
    private String completion;  
    
    //사용자 top10 그리드
    private String dptcd;
    private String rtur_nm;  
    private String rtur_id;
	
    //사용자 top10 파이차트
    private String use_systm_nm;
    private String user_id;
    private String use_system;
    private String row_cnt;
    
    private String biz_loct_seq;
    private String biz_mgmt_nm;
    private String blng_dptcd;
    private String whol_plan_rate;
    private String whol_efcn_rate;
    private String whol_ctrs_prcrt;
    private String step_clss_cd;
    private String standart_date;
    
    //대외연계송수신
    private String biz_nm;
    private String trst_ty;
    private String trst_stat_r;
    private String trst_stat_c;
    private String trst_stat_e;
    

    //유지관리 주간 인력,거리,장비 위젯
    private String plan_km;
    private String daly_job_dates;
    private String c_km;
    private String complete_p;
    private String bonbu_cd;
    private String plan_worker_cnt;
    private String plan_eqp_cnt;
    private String worker_cnt;
    private String eqp_cnt;
    private String gubun_date;
    
    //SMS발송현황
    private String systm_cd;
    private String success;
    private String failure;
    
    //예약업무
    private String sms;
    private String email;
    private String msgr;
    private String popp;
    private String sndr_dptcd;
    private String hgrn_dptcd;
    private String hgrn_dptnm;
    private String sndr_dptnm;
    private String recvr_dptcd;
    private String recvr_dptnm;
    
    //시스템 만족도
    private String very_good;
    private String good;
    private String soso;
    private String bad;
    private String very_bad;
    
    //이벤트
    private String bonbu_nm;
    private String kor_dptnm;
    private String prvu_end_dates;
    private String prvu_objtv_ctnt; 
    private String rlat_bass_ctnt;
    private String use_end;
    private String mm;
    
    
    public String getUse_end() {
		return use_end;
	}
	public void setUse_end(String use_end) {
		this.use_end = use_end;
	}
	public String getMm() {
		return mm;
	}
	public void setMm(String mm) {
		this.mm = mm;
	}
	private String aprvl_nm;
    private String completed;
    private String rejected;
    private String timed;
    
    //기술자문 처리실적
    private String cnsut_realm_nm;
    private String realm_01_cnt;
    private String realm_01_cnt1;
    private String realm_01_cnt2;
    private String realm_01_cnt3;
    
    //데이터 이관율
    private String dsngtrnsfer;
    private String bnstytrnsfer;
    private String dsngapproval;
    private String bnstyapproval;
    private String dsnginputavg;
    private String bnstyinputavg;
    
    //선택지사 상위코드 가져오기
    private String bonbu_dptcd;
    private String jasa_dptcd;
    

	public String getBonbu_dptcd() {
		return bonbu_dptcd;
	}
	public void setBonbu_dptcd(String bonbu_dptcd) {
		this.bonbu_dptcd = bonbu_dptcd;
	}
	public String getJasa_dptcd() {
		return jasa_dptcd;
	}
	public void setJasa_dptcd(String jasa_dptcd) {
		this.jasa_dptcd = jasa_dptcd;
	}
	
	
	public String getDsngtrnsfer() {
		return dsngtrnsfer;
	}
	public void setDsngtrnsfer(String dsngtrnsfer) {
		this.dsngtrnsfer = dsngtrnsfer;
	}
	public String getBnstytrnsfer() {
		return bnstytrnsfer;
	}
	public void setBnstytrnsfer(String bnstytrnsfer) {
		this.bnstytrnsfer = bnstytrnsfer;
	}
	public String getDsngapproval() {
		return dsngapproval;
	}
	public void setDsngapproval(String dsngapproval) {
		this.dsngapproval = dsngapproval;
	}
	public String getBnstyapproval() {
		return bnstyapproval;
	}
	public void setBnstyapproval(String bnstyapproval) {
		this.bnstyapproval = bnstyapproval;
	}
	public String getDsnginputavg() {
		return dsnginputavg;
	}
	public void setDsnginputavg(String dsnginputavg) {
		this.dsnginputavg = dsnginputavg;
	}
	public String getBnstyinputavg() {
		return bnstyinputavg;
	}
	public void setBnstyinputavg(String bnstyinputavg) {
		this.bnstyinputavg = bnstyinputavg;
	}
	public String getCnsut_realm_nm() {
		return cnsut_realm_nm;
	}
	public void setCnsut_realm_nm(String cnsut_realm_nm) {
		this.cnsut_realm_nm = cnsut_realm_nm;
	}
	public String getRealm_01_cnt() {
		return realm_01_cnt;
	}
	public void setRealm_01_cnt(String realm_01_cnt) {
		this.realm_01_cnt = realm_01_cnt;
	}
	public String getRealm_01_cnt1() {
		return realm_01_cnt1;
	}
	public void setRealm_01_cnt1(String realm_01_cnt1) {
		this.realm_01_cnt1 = realm_01_cnt1;
	}
	public String getRealm_01_cnt2() {
		return realm_01_cnt2;
	}
	public void setRealm_01_cnt2(String realm_01_cnt2) {
		this.realm_01_cnt2 = realm_01_cnt2;
	}
	public String getRealm_01_cnt3() {
		return realm_01_cnt3;
	}
	public void setRealm_01_cnt3(String realm_01_cnt3) {
		this.realm_01_cnt3 = realm_01_cnt3;
	}
	public String getAprvl_nm() {
		return aprvl_nm;
	}
	public void setAprvl_nm(String aprvl_nm) {
		this.aprvl_nm = aprvl_nm;
	}
	public String getCompleted() {
		return completed;
	}
	public void setCompleted(String completed) {
		this.completed = completed;
	}
	public String getRejected() {
		return rejected;
	}
	public void setRejected(String rejected) {
		this.rejected = rejected;
	}
	public String getTimed() {
		return timed;
	}
	public void setTimed(String timed) {
		this.timed = timed;
	}
	public String getRlat_bass_ctnt() {
		return rlat_bass_ctnt;
	}
	public void setRlat_bass_ctnt(String rlat_bass_ctnt) {
		this.rlat_bass_ctnt = rlat_bass_ctnt;
	}
	public String getBonbu_nm() {
		return bonbu_nm;
	}
	public void setBonbu_nm(String bonbu_nm) {
		this.bonbu_nm = bonbu_nm;
	}
	public String getKor_dptnm() {
		return kor_dptnm;
	}
	public void setKor_dptnm(String kor_dptnm) {
		this.kor_dptnm = kor_dptnm;
	}
	public String getPrvu_end_dates() {
		return prvu_end_dates;
	}
	public void setPrvu_end_dates(String prvu_end_dates) {
		this.prvu_end_dates = prvu_end_dates;
	}
	public String getPrvu_objtv_ctnt() {
		return prvu_objtv_ctnt;
	}
	public void setPrvu_objtv_ctnt(String prvu_objtv_ctnt) {
		this.prvu_objtv_ctnt = prvu_objtv_ctnt;
	}
	public String getVery_good() {
		return very_good;
	}
	public void setVery_good(String very_good) {
		this.very_good = very_good;
	}
	public String getGood() {
		return good;
	}
	public void setGood(String good) {
		this.good = good;
	}
	public String getSoso() {
		return soso;
	}
	public void setSoso(String soso) {
		this.soso = soso;
	}
	public String getBad() {
		return bad;
	}
	public void setBad(String bad) {
		this.bad = bad;
	}
	public String getVery_bad() {
		return very_bad;
	}
	public void setVery_bad(String very_bad) {
		this.very_bad = very_bad;
	}
	public String getRecvr_dptcd() {
		return recvr_dptcd;
	}
	public void setRecvr_dptcd(String recvr_dptcd) {
		this.recvr_dptcd = recvr_dptcd;
	}
	public String getRecvr_dptnm() {
		return recvr_dptnm;
	}
	public void setRecvr_dptnm(String recvr_dptnm) {
		this.recvr_dptnm = recvr_dptnm;
	}
	public String getSms() {
		return sms;
	}
	public void setSms(String sms) {
		this.sms = sms;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMsgr() {
		return msgr;
	}
	public void setMsgr(String msgr) {
		this.msgr = msgr;
	}
	public String getPopp() {
		return popp;
	}
	public void setPopp(String popp) {
		this.popp = popp;
	}
	public String getSndr_dptcd() {
		return sndr_dptcd;
	}
	public void setSndr_dptcd(String sndr_dptcd) {
		this.sndr_dptcd = sndr_dptcd;
	}
	public String getHgrn_dptcd() {
		return hgrn_dptcd;
	}
	public void setHgrn_dptcd(String hgrn_dptcd) {
		this.hgrn_dptcd = hgrn_dptcd;
	}
	public String getHgrn_dptnm() {
		return hgrn_dptnm;
	}
	public void setHgrn_dptnm(String hgrn_dptnm) {
		this.hgrn_dptnm = hgrn_dptnm;
	}
	public String getSndr_dptnm() {
		return sndr_dptnm;
	}
	public void setSndr_dptnm(String sndr_dptnm) {
		this.sndr_dptnm = sndr_dptnm;
	}
	public String getSystm_cd() {
		return systm_cd;
	}
	public void setSystm_cd(String systm_cd) {
		this.systm_cd = systm_cd;
	}
	public String getSuccess() {
		return success;
	}
	public void setSuccess(String success) {
		this.success = success;
	}
	public String getFailure() {
		return failure;
	}
	public void setFailure(String failure) {
		this.failure = failure;
	}
	public String getPlan_km() {
		return plan_km;
	}
	public void setPlan_km(String plan_km) {
		this.plan_km = plan_km;
	}
	public String getDaly_job_dates() {
		return daly_job_dates;
	}
	public void setDaly_job_dates(String daly_job_dates) {
		this.daly_job_dates = daly_job_dates;
	}
	public String getC_km() {
		return c_km;
	}
	public void setC_km(String c_km) {
		this.c_km = c_km;
	}
	public String getComplete_p() {
		return complete_p;
	}
	public void setComplete_p(String complete_p) {
		this.complete_p = complete_p;
	}
	public String getBonbu_cd() {
		return bonbu_cd;
	}
	public void setBonbu_cd(String bonbu_cd) {
		this.bonbu_cd = bonbu_cd;
	}
	public String getPlan_worker_cnt() {
		return plan_worker_cnt;
	}
	public void setPlan_worker_cnt(String plan_worker_cnt) {
		this.plan_worker_cnt = plan_worker_cnt;
	}
	public String getPlan_eqp_cnt() {
		return plan_eqp_cnt;
	}
	public void setPlan_eqp_cnt(String plan_eqp_cnt) {
		this.plan_eqp_cnt = plan_eqp_cnt;
	}
	public String getWorker_cnt() {
		return worker_cnt;
	}
	public void setWorker_cnt(String worker_cnt) {
		this.worker_cnt = worker_cnt;
	}
	public String getEqp_cnt() {
		return eqp_cnt;
	}
	public void setEqp_cnt(String eqp_cnt) {
		this.eqp_cnt = eqp_cnt;
	}
	public String getGubun_date() {
		return gubun_date;
	}
	public void setGubun_date(String gubun_date) {
		this.gubun_date = gubun_date;
	}
	//비즈니스 메인차트 설계도서 반입반출
    private String dsgng_book_clsfc_nm;    
    
	
	public String getDsgng_book_clsfc_nm() {
		return dsgng_book_clsfc_nm;
	}
	public void setDsgng_book_clsfc_nm(String dsgng_book_clsfc_nm) {
		this.dsgng_book_clsfc_nm = dsgng_book_clsfc_nm;
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

	public String getStep_clss_cd() {
		return step_clss_cd;
	}

	public void setStep_clss_cd(String step_clss_cd) {
		this.step_clss_cd = step_clss_cd;
	}

	public String getStandart_date() {
		return standart_date;
	}

	public void setStandart_date(String standart_date) {
		this.standart_date = standart_date;
	}

	public String getBiz_loct_seq() {
		return biz_loct_seq;
	}

	public void setBiz_loct_seq(String biz_loct_seq) {
		this.biz_loct_seq = biz_loct_seq;
	}

	public String getBiz_mgmt_nm() {
		return biz_mgmt_nm;
	}

	public void setBiz_mgmt_nm(String biz_mgmt_nm) {
		this.biz_mgmt_nm = biz_mgmt_nm;
	}

	public String getBlng_dptcd() {
		return blng_dptcd;
	}

	public void setBlng_dptcd(String blng_dptcd) {
		this.blng_dptcd = blng_dptcd;
	}

	public String getWhol_plan_rate() {
		return whol_plan_rate;
	}

	public void setWhol_plan_rate(String whol_plan_rate) {
		this.whol_plan_rate = whol_plan_rate;
	}

	public String getWhol_efcn_rate() {
		return whol_efcn_rate;
	}

	public void setWhol_efcn_rate(String whol_efcn_rate) {
		this.whol_efcn_rate = whol_efcn_rate;
	}

	public String getWhol_ctrs_prcrt() {
		return whol_ctrs_prcrt;
	}

	public void setWhol_ctrs_prcrt(String whol_ctrs_prcrt) {
		this.whol_ctrs_prcrt = whol_ctrs_prcrt;
	}
	public String getUse_systm_nm() {
		return use_systm_nm;
	}
	public void setUse_systm_nm(String use_systm_nm) {
		this.use_systm_nm = use_systm_nm;
	}
	public String getRow_cnt() {
		return row_cnt;
	}
	public void setRow_cnt(String row_cnt) {
		this.row_cnt = row_cnt;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUse_system() {
		return use_system;
	}
	public void setUse_system(String use_system) {
		this.use_system = use_system;
	}
	public String getDptcd() {
		return dptcd;
	}
	public void setDptcd(String dptcd) {
		this.dptcd = dptcd;
	}
	public String getRtur_id() {
		return rtur_id;
	}
	public void setRtur_id(String rtur_id) {
		this.rtur_id = rtur_id;
	}
	public String getRtur_nm() {
		return rtur_nm;
	}
	public void setRtur_nm(String rtur_nm) {
		this.rtur_nm = rtur_nm;
	}
	public String getFir_category_id() {
		return fir_category_id;
	}
	public void setFir_category_id(String fir_category_id) {
		this.fir_category_id = fir_category_id;
	}
	public String getFir_category_nm() {
		return fir_category_nm;
	}
	public void setFir_category_nm(String fir_category_nm) {
		this.fir_category_nm = fir_category_nm;
	}
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
	public String getRequest() {
		return request;
	}
	public void setRequest(String request) {
		this.request = request;
	}
	public String getUn_processing() {
		return un_processing;
	}
	public void setUn_processing(String un_processing) {
		this.un_processing = un_processing;
	}
	public String getCompletion() {
		return completion;
	}
	public void setCompletion(String completion) {
		this.completion = completion;
	}
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	public String getUp_systm_nm() {
		return up_systm_nm;
	}
	public void setUp_systm_nm(String up_systm_nm) {
		this.up_systm_nm = up_systm_nm;
	}
	public String getMenu_nm() {
		return menu_nm;
	}
	public void setMenu_nm(String menu_nm) {
		this.menu_nm = menu_nm;
	}
	public String getY_rank() {
		return y_rank;
	}
	public void setY_rank(String y_rank) {
		this.y_rank = y_rank;
	}
	public String getHgrn_systm_cd() {
		return hgrn_systm_cd;
	}
	public void setHgrn_systm_cd(String hgrn_systm_cd) {
		this.hgrn_systm_cd = hgrn_systm_cd;
	}
	public String getSystm_nm() {
		return systm_nm;
	}
	public void setSystm_nm(String systm_nm) {
		this.systm_nm = systm_nm;
	}
	public String getCnt() {
		return cnt;
	}
	public void setCnt(String cnt) {
		this.cnt = cnt;
	}
	public String getExtrnlcntc1l() {
		return extrnlcntc1l;
	}
	public void setExtrnlcntc1l(String extrnlcntc1l) {
		this.extrnlcntc1l = extrnlcntc1l;
	}
	public String getExtrnlcntc2l() {
		return extrnlcntc2l;
	}
	public void setExtrnlcntc2l(String extrnlcntc2l) {
		this.extrnlcntc2l = extrnlcntc2l;
	}
	public String getExtrnlcntc3l() {
		return extrnlcntc3l;
	}
	public void setExtrnlcntc3l(String extrnlcntc3l) {
		this.extrnlcntc3l = extrnlcntc3l;
	}
	public String getExtrnlcntc4l() {
		return extrnlcntc4l;
	}
	public void setExtrnlcntc4l(String extrnlcntc4l) {
		this.extrnlcntc4l = extrnlcntc4l;
	}
	public String getExtrnlcntc1r() {
		return extrnlcntc1r;
	}
	public void setExtrnlcntc1r(String extrnlcntc1r) {
		this.extrnlcntc1r = extrnlcntc1r;
	}
	public String getExtrnlcntc2r() {
		return extrnlcntc2r;
	}
	public void setExtrnlcntc2r(String extrnlcntc2r) {
		this.extrnlcntc2r = extrnlcntc2r;
	}
	public String getExtrnlcntc3r() {
		return extrnlcntc3r;
	}
	public void setExtrnlcntc3r(String extrnlcntc3r) {
		this.extrnlcntc3r = extrnlcntc3r;
	}
	public String getExtrnlcntc4r() {
		return extrnlcntc4r;
	}
	public void setExtrnlcntc4r(String extrnlcntc4r) {
		this.extrnlcntc4r = extrnlcntc4r;
	}
	
	public String getSimplctysanctn_code() {
        return simplctysanctn_code;
    }
    public void setSimplctysanctn_code(String simplctysanctn_code) {
        this.simplctysanctn_code = simplctysanctn_code;
    }
    public String getSimplctysanctn_code_name() {
        return simplctysanctn_code_name;
    }
    public void setSimplctysanctn_code_name(String simplctysanctn_code_name) {
        this.simplctysanctn_code_name = simplctysanctn_code_name;
    }
    public String getHelpdesk_code_name() {
        return helpdesk_code_name;
    }
    public void setHelpdesk_code_name(String helpdesk_code_name) {
        this.helpdesk_code_name = helpdesk_code_name;
    }
    public String getHelpdesk_code() {
        return helpdesk_code;
    }
    public void setHelpdesk_code(String helpdesk_code) {
        this.helpdesk_code = helpdesk_code;
    }
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
    public String getSuccess_cnt() {
        return success_cnt;
    }
    public void setSuccess_cnt(String success_cnt) {
        this.success_cnt = success_cnt;
    }
    public String getFail_cnt() {
        return fail_cnt;
    }
    public void setFail_cnt(String fail_cnt) {
        this.fail_cnt = fail_cnt;
    }
    public String getWait_cnt() {
        return wait_cnt;
    }
    public void setWait_cnt(String wait_cnt) {
        this.wait_cnt = wait_cnt;
    }
    public String getTemp1() {
        return temp1;
    }
    public void setTemp1(String temp1) {
        this.temp1 = temp1;
    }
    public String getTemp2() {
        return temp2;
    }
    public void setTemp2(String temp2) {
        this.temp2 = temp2;
    }
    public String getTemp3() {
        return temp3;
    }
    public void setTemp3(String temp3) {
        this.temp3 = temp3;
    }
    public String getTemp4() {
        return temp4;
    }
    public void setTemp4(String temp4) {
        this.temp4 = temp4;
    }
    public String getSms_business_code() {
        return sms_business_code;
    }
    public void setSms_business_code(String sms_business_code) {
        this.sms_business_code = sms_business_code;
    }
    public String getSms_business_code_name() {
        return sms_business_code_name;
    }
    public void setSms_business_code_name(String sms_business_code_name) {
        this.sms_business_code_name = sms_business_code_name;
    }
    public String getSms_business_code_cnt() {
        return sms_business_code_cnt;
    }
    public void setSms_business_code_cnt(String sms_business_code_cnt) {
        this.sms_business_code_cnt = sms_business_code_cnt;
    }
    
    

}