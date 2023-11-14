package com.smhrd.model;

public class MemberVO {
	// DB 테이블의 컬럼명과 일치시키기
	private String email;
	private String pw;
	private String tel;
	private String address;
	
	public MemberVO(){
		
	}

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	
}
