package model;

public class User {

	@Override
	public String toString() {
		return "User [userid=" + userid + ", userpwd=" + userpwd
				+ ", username=" + username + "]";
	}
	long userid;
	String userpwd;
	String username;
	public long getUserid() {
		return userid;
	}
	public void setUserid(long userid) {
		this.userid = userid;
	}
	public String getUserpwd() {
		return userpwd;
	}
	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
}
