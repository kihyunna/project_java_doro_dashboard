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
public class IfcMainVO extends IfcDefaultSearchVO {

	private String gubun;
    private String group1;
    private String group2;
    private String cre_datetime;
    private String cpu;
    private String memory;
    private String disk;
    private String state;
    private String gubun_name;
    private String group1_name;
    private String group2_name;
    private String group1_order;
    private String group2_order;
    private String host_name;
    private String state_name;
    private String message;
    private String rownum;
    private String lock_session;
    private String code_name;
    private String code_order;

    private String cpu_limit;
	private String mem_limit;
	private String disk_limit;
	
	private String user_seq ;
    private String user_nm ;
    private String user_mbl_num ;
    private String manageseq ;
    private String detailclse ;
    private String troblgradse ;
    private String troblcolctse ;
    private String thrhld ;
    private String colctcycle ;

    private String troblseq;
    private String jobse;
    private String hostname;
    private String troblprocesssttus;
    private String troblcn;
    private String rm;
    private String inst_date;
    private String real_hostname;
    
    private String event_text;
    private String hangul_hostname;
    private String dual;
    private String dual_cnt;
    private String cre_date;
    private String netio;
    
    private String stat_date;
    private String resp_time;
    private String think_time;
    private String inst_no;
    private String total_session;
    private String active_session;
    private String execute_counts;
	private float wait_time;
    private String time;
    
    private String exec_cnt;
    private String concurrent_vs;
    private String avg_resp_time;
    
    private String actioncn;
    
    private String cmmn_cd;
	private String cmmn_cd_nm;
	private String inqy_tord;
	private String cre_dttm;
	private String trst_stat_cnt;
	private String is_error;
	
	private String colct_gubun;
	private String process;
	
	private String disk_trobl;
	private String disk_action;
	private String cpu_trobl;
	private String cpu_action;
	private String mem_trobl;
	private String mem_action;
	private String netio_trobl;
	private String netio_action;
	private String conerr_trobl;
	private String conerr_action;
	
	private String last_troblprocesssttus;
	private String last_troblprocesssttus_text;
	private String troblprocesssttus_text;
	private String log_rm;
	
	private String istoday;
    
    public String getActioncn() {
		return actioncn;
	}
	public void setActioncn(String actioncn) {
		this.actioncn = actioncn;
	}

	public String getGubun() {
		return gubun;
	}
	public void setGubun(String gubun) {
		this.gubun = gubun;
	}
	public String getGroup1() {
		return group1;
	}
	public void setGroup1(String group1) {
		this.group1 = group1;
	}
	public String getGroup2() {
		return group2;
	}
	public void setGroup2(String group2) {
		this.group2 = group2;
	}
	public String getCre_datetime() {
		return cre_datetime;
	}
	public void setCre_datetime(String cre_datetime) {
		this.cre_datetime = cre_datetime;
	}
	public String getCpu() {
		return cpu;
	}
	public void setCpu(String cpu) {
		this.cpu = cpu;
	}
	public String getMemory() {
		return memory;
	}
	public void setMemory(String memory) {
		this.memory = memory;
	}
	public String getDisk() {
		return disk;
	}
	public void setDisk(String disk) {
		this.disk = disk;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getGubun_name() {
		return gubun_name;
	}
	public void setGubun_name(String gubun_name) {
		this.gubun_name = gubun_name;
	}
	public String getGroup1_name() {
		return group1_name;
	}
	public void setGroup1_name(String group1_name) {
		this.group1_name = group1_name;
	}
	public String getGroup2_name() {
		return group2_name;
	}
	public void setGroup2_name(String group2_name) {
		this.group2_name = group2_name;
	}
	public String getGroup1_order() {
		return group1_order;
	}
	public void setGroup1_order(String group1_order) {
		this.group1_order = group1_order;
	}
	public String getGroup2_order() {
		return group2_order;
	}
	public void setGroup2_order(String group2_order) {
		this.group2_order = group2_order;
	}
	public String getHost_name() {
		return host_name;
	}
	public void setHost_name(String host_name) {
		this.host_name = host_name;
	}
	public String getState_name() {
		return state_name;
	}
	public void setState_name(String state_name) {
		this.state_name = state_name;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getRownum() {
		return rownum;
	}
	public void setRownum(String rownum) {
		this.rownum = rownum;
	}
	public String getTotal_session() {
		return total_session;
	}
	public void setTotal_session(String total_session) {
		this.total_session = total_session;
	}
	public String getActive_session() {
		return active_session;
	}
	public void setActive_session(String active_session) {
		this.active_session = active_session;
	}
	public String getLock_session() {
		return lock_session;
	}
	public void setLock_session(String lock_session) {
		this.lock_session = lock_session;
	}
	public String getCode_name() {
		return code_name;
	}
	public void setCode_name(String code_name) {
		this.code_name = code_name;
	}
	public String getCode_order() {
		return code_order;
	}
	public void setCode_order(String code_order) {
		this.code_order = code_order;
	}
	public String getCpu_limit() {
		return cpu_limit;
	}
	public void setCpu_limit(String cpu_limit) {
		this.cpu_limit = cpu_limit;
	}
	public String getMem_limit() {
		return mem_limit;
	}
	public void setMem_limit(String mem_limit) {
		this.mem_limit = mem_limit;
	}
	public String getDisk_limit() {
		return disk_limit;
	}
	public void setDisk_limit(String disk_limit) {
		this.disk_limit = disk_limit;
	}
	public String getUser_seq() {
		return user_seq;
	}
	public void setUser_seq(String user_seq) {
		this.user_seq = user_seq;
	}
	public String getUser_nm() {
		return user_nm;
	}
	public void setUser_nm(String user_nm) {
		this.user_nm = user_nm;
	}
	public String getUser_mbl_num() {
		return user_mbl_num;
	}
	public void setUser_mbl_num(String user_mbl_num) {
		this.user_mbl_num = user_mbl_num;
	}
	public String getManageseq() {
		return manageseq;
	}
	public void setManageseq(String manageseq) {
		this.manageseq = manageseq;
	}
	public String getDetailclse() {
		return detailclse;
	}
	public void setDetailclse(String detailclse) {
		this.detailclse = detailclse;
	}
	public String getTroblgradse() {
		return troblgradse;
	}
	public void setTroblgradse(String troblgradse) {
		this.troblgradse = troblgradse;
	}
	public String getTroblcolctse() {
		return troblcolctse;
	}
	public void setTroblcolctse(String troblcolctse) {
		this.troblcolctse = troblcolctse;
	}
	public String getThrhld() {
		return thrhld;
	}
	public void setThrhld(String thrhld) {
		this.thrhld = thrhld;
	}
	public String getColctcycle() {
		return colctcycle;
	}
	public void setColctcycle(String colctcycle) {
		this.colctcycle = colctcycle;
	}
	public String getTroblseq() {
		return troblseq;
	}
	public void setTroblseq(String troblseq) {
		this.troblseq = troblseq;
	}
	public String getJobse() {
		return jobse;
	}
	public void setJobse(String jobse) {
		this.jobse = jobse;
	}
	public String getHostname() {
		return hostname;
	}
	public void setHostname(String hostname) {
		this.hostname = hostname;
	}
	public String getTroblprocesssttus() {
		return troblprocesssttus;
	}
	public void setTroblprocesssttus(String troblprocesssttus) {
		this.troblprocesssttus = troblprocesssttus;
	}
	public String getTroblcn() {
		return troblcn;
	}
	public void setTroblcn(String troblcn) {
		this.troblcn = troblcn;
	}
	public String getRm() {
		return rm;
	}
	public void setRm(String rm) {
		this.rm = rm;
	}
	public String getInst_date() {
		return inst_date;
	}
	public void setInst_date(String inst_date) {
		this.inst_date = inst_date;
	}
	public String getReal_hostname() {
		return real_hostname;
	}
	public void setReal_hostname(String real_hostname) {
		this.real_hostname = real_hostname;
	}
	public String getEvent_text() {
		return event_text;
	}
	public void setEvent_text(String event_text) {
		this.event_text = event_text;
	}
	public String getHangul_hostname() {
		return hangul_hostname;
	}
	public void setHangul_hostname(String hangul_hostname) {
		this.hangul_hostname = hangul_hostname;
	}
	public String getDual() {
		return dual;
	}
	public void setDual(String dual) {
		this.dual = dual;
	}
	public String getDual_cnt() {
		return dual_cnt;
	}
	public void setDual_cnt(String dual_cnt) {
		this.dual_cnt = dual_cnt;
	}
	public String getCre_date() {
		return cre_date;
	}
	public void setCre_date(String cre_date) {
		this.cre_date = cre_date;
	}
	public String getNetio() {
		return netio;
	}
	public void setNetio(String netio) {
		this.netio = netio;
	}
	public String getStat_date() {
		return stat_date;
	}
	public void setStat_date(String stat_date) {
		this.stat_date = stat_date;
	}
	public String getExec_cnt() {
		return exec_cnt;
	}
	public void setExec_cnt(String exec_cnt) {
		this.exec_cnt = exec_cnt;
	}
	public String getResp_time() {
		return resp_time;
	}
	public void setResp_time(String resp_time) {
		this.resp_time = resp_time;
	}
	public String getThink_time() {
		return think_time;
	}
	public void setThink_time(String think_time) {
		this.think_time = think_time;
	}
	public String getInst_no() {
		return inst_no;
	}
	public void setInst_no(String inst_no) {
		this.inst_no = inst_no;
	}
	public String getExecute_counts() {
		return execute_counts;
	}
	public void setExecute_counts(String execute_counts) {
		this.execute_counts = execute_counts;
	}
	public float getWait_time() {
		return wait_time;
	}
	public void setWait_time(float wait_time) {
		this.wait_time = wait_time;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getConcurrent_vs() {
		return concurrent_vs;
	}
	public void setConcurrent_vs(String concurrent_vs) {
		this.concurrent_vs = concurrent_vs;
	}
	public String getAvg_resp_time() {
		return avg_resp_time;
	}
	public void setAvg_resp_time(String avg_resp_time) {
		this.avg_resp_time = avg_resp_time;
	}
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
	public String getColct_gubun() {
		return colct_gubun;
	}
	public void setColct_gubun(String colct_gubun) {
		this.colct_gubun = colct_gubun;
	}
	public String getProcess() {
		return process;
	}
	public void setProcess(String process) {
		this.process = process;
	}
	public String getDisk_trobl() {
		return disk_trobl;
	}
	public void setDisk_trobl(String disk_trobl) {
		this.disk_trobl = disk_trobl;
	}
	public String getDisk_action() {
		return disk_action;
	}
	public void setDisk_action(String disk_action) {
		this.disk_action = disk_action;
	}
	public String getCpu_trobl() {
		return cpu_trobl;
	}
	public void setCpu_trobl(String cpu_trobl) {
		this.cpu_trobl = cpu_trobl;
	}
	public String getCpu_action() {
		return cpu_action;
	}
	public void setCpu_action(String cpu_action) {
		this.cpu_action = cpu_action;
	}
	public String getMem_trobl() {
		return mem_trobl;
	}
	public void setMem_trobl(String mem_trobl) {
		this.mem_trobl = mem_trobl;
	}
	public String getMem_action() {
		return mem_action;
	}
	public void setMem_action(String mem_action) {
		this.mem_action = mem_action;
	}
	public String getNetio_trobl() {
		return netio_trobl;
	}
	public void setNetio_trobl(String netio_trobl) {
		this.netio_trobl = netio_trobl;
	}
	public String getNetio_action() {
		return netio_action;
	}
	public void setNetio_action(String netio_action) {
		this.netio_action = netio_action;
	}
	public String getConerr_trobl() {
		return conerr_trobl;
	}
	public void setConerr_trobl(String conerr_trobl) {
		this.conerr_trobl = conerr_trobl;
	}
	public String getConerr_action() {
		return conerr_action;
	}
	public void setConerr_action(String conerr_action) {
		this.conerr_action = conerr_action;
	}
	public String getLast_troblprocesssttus() {
		return last_troblprocesssttus;
	}
	public void setLast_troblprocesssttus(String last_troblprocesssttus) {
		this.last_troblprocesssttus = last_troblprocesssttus;
	}
	public String getLast_troblprocesssttus_text() {
		return last_troblprocesssttus_text;
	}
	public void setLast_troblprocesssttus_text(String last_troblprocesssttus_text) {
		this.last_troblprocesssttus_text = last_troblprocesssttus_text;
	}
	public String getTroblprocesssttus_text() {
		return troblprocesssttus_text;
	}
	public void setTroblprocesssttus_text(String troblprocesssttus_text) {
		this.troblprocesssttus_text = troblprocesssttus_text;
	}
	public String getLog_rm() {
		return log_rm;
	}
	public void setLog_rm(String log_rm) {
		this.log_rm = log_rm;
	}
	public String getIstoday() {
		return istoday;
	}
	public void setIstoday(String istoday) {
		this.istoday = istoday;
	}   
}