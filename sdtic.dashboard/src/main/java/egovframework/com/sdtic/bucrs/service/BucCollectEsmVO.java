package egovframework.com.sdtic.bucrs.service;

/**
 * @Class Name :  BucBnstyVo.java
 * @Description : BucBnstyVo Class
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
public class BucCollectEsmVO {

    private static final long serialVersionUID = 1L;
    
    private String yyyymmdd;
    private String realhostname;
    private String esm_gubun;
    private String hostName;
    private String obj_name;
    private String rsctype_id;
    private String rsc_key_name;
    private double resultvalue_double;
    private String collect_date;
    

	public String getYyyymmdd() {
		return yyyymmdd;
	}
	public void setYyyymmdd(String yyyymmdd) {
		this.yyyymmdd = yyyymmdd;
	}
	public String getRealhostname() {
		return realhostname;
	}
	public void setRealhostname(String realhostname) {
		this.realhostname = realhostname;
	}
	
	public String getEsm_gubun() {
		return esm_gubun;
	}
	public void setEsm_gubun(String esm_gubun) {
		this.esm_gubun = esm_gubun;
	}
	public String getHostName() {
		return hostName;
	}
	public void setHostName(String hostName) {
		this.hostName = hostName;
	}
	
	public String getObj_name() {
		return obj_name;
	}
	public void setObj_name(String obj_name) {
		this.obj_name = obj_name;
	}
	public String getRsctype_id() {
		return rsctype_id;
	}
	public void setRsctype_id(String rsctype_id) {
		this.rsctype_id = rsctype_id;
	}
	public String getRsc_key_name() {
		return rsc_key_name;
	}
	public void setRsc_key_name(String rsc_key_name) {
		this.rsc_key_name = rsc_key_name;
	}
	public double getResultvalue_double() {
		return resultvalue_double;
	}
	public void setResultvalue_double(double resultvalue_double) {
		this.resultvalue_double = resultvalue_double;
	}
	public String getCollect_date() {
		return collect_date;
	}
	public void setCollect_date(String collect_date) {
		this.collect_date = collect_date;
	}

}