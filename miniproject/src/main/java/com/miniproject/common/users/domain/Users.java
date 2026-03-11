package com.miniproject.common.users.domain;

import java.io.Serializable;
import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Entity
@Getter
@Setter
@ToString(exclude = { "password", "roles" })
@Table(name = "Users", schema = "miniproject.dbo")
public class Users implements Serializable {

	private static final long serialVersionUID = -2687249483794409689L;
	@Id
	@NotNull
	@Column(name = "userId", length = 50)
	private String userId; // not use in ERP

	@NotBlank
	@Size(min = 2, max = 30)
	@Column(name = "user_nm")
	private String user_nm;
	
	@NotBlank
	@JsonIgnore
	@Column(name = "Password")
	private String password;
	
	// 부서
	// 직급
	// 직책

	@NotNull
	@Column(name = "Used", length = 1)
	private int used; // not use in ERP

	@Column(name = "CreateUser")	
	private Users createUser;	
	
	@Column(name = "ModifyUser")	
	private Users modifyUser;	

	@Column(name = "ModifyDate")	
	private LocalDateTime modifyDate;

	@Column(name = "CreateDate")
	private LocalDateTime createDate;

	
}
