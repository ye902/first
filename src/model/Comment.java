package model;

import java.util.Date;

public class Comment {
	long Uid;
	long C_id;
	String C_text;
	Date c_date;
	int goodNum;
	User user;
	public long getUid() {
		return Uid;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public void setUid(long uid) {
		this.Uid = uid;
	}
	public long getC_id() {
		return C_id;
	}
	public void setC_id(long c_id) {
		this.C_id = c_id;
	}
	public String getC_text() {
		return C_text;
	}
	public void setC_text(String c_text) {
		this.C_text = c_text;
	}
	public Date getC_date() {
		return c_date;
	}
	public void setC_date(Date c_date) {
		this.c_date = c_date;
	}
	public int getGoodNum() {
		return goodNum;
	}
	public void setGoodNum(int goodNum) {
		this.goodNum = goodNum;
	}
}
