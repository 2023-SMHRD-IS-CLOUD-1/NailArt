package com.smhrd.model;

// 가게 직원 
public class StaffVO {

    // 직원 번호 
    private Double staff_seq;

    // 가게 번호 
    private Double shop_seq;

    // 회원 아이디 
    private String mem_id;
    
    private String staff_name;

    // 채용 일자 
//    private Date hired_at;

    public String getStaff_name() {
		return staff_name;
	}

	public void setStaff_name(String staff_name) {
		this.staff_name = staff_name;
	}

	public Double getStaffSeq() {
        return staff_seq;
    }

    public void setStaffSeq(Double staff_seq) {
        this.staff_seq = staff_seq;
    }

    public Double getShopSeq() {
        return shop_seq;
    }

    public void setShopSeq(Double shop_seq) {
        this.shop_seq = shop_seq;
    }

    public String getMemId() {
        return mem_id;
    }

    public void setMemId(String mem_id) {
        this.mem_id = mem_id;
    }

//    public Date getHiredAt() {
//        return hired_at;
//    }

//    public void setHiredAt(Date hired_at) {
//        this.hired_at = hired_at;
//    }

    // staff_info 모델 복사
    public void CopyData(StaffVO param)
    {
        this.staff_seq = param.getStaffSeq();
        this.shop_seq = param.getShopSeq();
        this.mem_id = param.getMemId();
//        this.hired_at = param.getHiredAt();
    }
}