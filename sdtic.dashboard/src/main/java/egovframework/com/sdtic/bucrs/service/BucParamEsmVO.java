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
public class BucParamEsmVO {

    private static final long serialVersionUID = 1L;
    
    private String yyyymmdd;
    private String realhostname;
    

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
	
}