package egovframework.com.sdtic.ifcrs.service;

/**
 * @Class Name :  IfcDbVo.java
 * @Description : IfcDbVo Class
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
public class IfcDbVO extends IfcDefaultSearchVO {

    private String gubun;
    private String group1;
    private String group2;
    private String cre_datetime;
    private String cpu;
    private String disk;
    private String memory;
    private String etc1;
    private String etc2;
    private String etc3;
    
    private String total_session;
    private String active_session;
    private String execute_counts;
    private String run_queue;
    private float wait_time;
    private String table_space_name1;
    private String table_space1;
    private String table_space_name2;
    private String table_space2;
    private String code_name;
    private String code_order;

    private String group1_name;
    private String group2_name;
    private String group1_order;
    private String group2_order;
    
    private String hostname;
    private String regedit;
    
    private String inst_no;
    private String rownum;
    private String logtime;
    private String tablespace_name;
    private String used_percent;
    private String hostname1;
    private String hostname2;
    private String hostname3;
    private String hostname4;
    
    private String inst_date;
    private String cre_date;
    
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
	public String getDisk() {
		return disk;
	}
	public void setDisk(String disk) {
		this.disk = disk;
	}
	public String getMemory() {
		return memory;
	}
	public void setMemory(String memory) {
		this.memory = memory;
	}
	public String getEtc1() {
		return etc1;
	}
	public void setEtc1(String etc1) {
		this.etc1 = etc1;
	}
	public String getEtc2() {
		return etc2;
	}
	public void setEtc2(String etc2) {
		this.etc2 = etc2;
	}
	public String getEtc3() {
		return etc3;
	}
	public void setEtc3(String etc3) {
		this.etc3 = etc3;
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
	public String getExecute_counts() {
		return execute_counts;
	}
	public void setExecute_counts(String execute_counts) {
		this.execute_counts = execute_counts;
	}
	public String getRun_queue() {
		return run_queue;
	}
	public void setRun_queue(String run_queue) {
		this.run_queue = run_queue;
	}
	public float getWait_time() {
		return wait_time;
	}
	public void setWait_time(float wait_time) {
		this.wait_time = wait_time;
	}
	public String getTable_space_name1() {
		return table_space_name1;
	}
	public void setTable_space_name1(String table_space_name1) {
		this.table_space_name1 = table_space_name1;
	}
	public String getTable_space1() {
		return table_space1;
	}
	public void setTable_space1(String table_space1) {
		this.table_space1 = table_space1;
	}
	public String getTable_space_name2() {
		return table_space_name2;
	}
	public void setTable_space_name2(String table_space_name2) {
		this.table_space_name2 = table_space_name2;
	}
	public String getTable_space2() {
		return table_space2;
	}
	public void setTable_space2(String table_space2) {
		this.table_space2 = table_space2;
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
	public String getHostname() {
		return hostname;
	}
	public void setHostname(String hostname) {
		this.hostname = hostname;
	}
	public String getRegedit() {
		return regedit;
	}
	public void setRegedit(String regedit) {
		this.regedit = regedit;
	}
	public String getInst_no() {
		return inst_no;
	}
	public void setInst_no(String inst_no) {
		this.inst_no = inst_no;
	}
	public String getRownum() {
		return rownum;
	}
	public void setRownum(String rownum) {
		this.rownum = rownum;
	}
	public String getLogtime() {
		return logtime;
	}
	public void setLogtime(String logtime) {
		this.logtime = logtime;
	}
	public String getTablespace_name() {
		return tablespace_name;
	}
	public void setTablespace_name(String tablespace_name) {
		this.tablespace_name = tablespace_name;
	}
	public String getUsed_percent() {
		return used_percent;
	}
	public void setUsed_percent(String used_percent) {
		this.used_percent = used_percent;
	}
	public String getHostname1() {
		return hostname1;
	}
	public void setHostname1(String hostname1) {
		this.hostname1 = hostname1;
	}
	public String getHostname2() {
		return hostname2;
	}
	public void setHostname2(String hostname2) {
		this.hostname2 = hostname2;
	}
	public String getHostname3() {
		return hostname3;
	}
	public void setHostname3(String hostname3) {
		this.hostname3 = hostname3;
	}
	public String getHostname4() {
		return hostname4;
	}
	public void setHostname4(String hostname4) {
		this.hostname4 = hostname4;
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