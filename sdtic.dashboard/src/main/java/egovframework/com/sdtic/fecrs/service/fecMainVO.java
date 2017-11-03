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
public class fecMainVO {

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
