package com.java.pojo;

public class User {
	
	private Integer id        ;
	private String username  ;
	private String userpwd   ;
	private Integer grading;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUserpwd() {
		return userpwd;
	}
	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}
	public Integer getGrading() {
		return grading;
	}
	public void setGrading(Integer grading) {
		this.grading = grading;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", userpwd=" + userpwd + ", grading=" + grading + "]";
	}
	public User(Integer id, String username, String userpwd, Integer grading) {
		super();
		this.id = id;
		this.username = username;
		this.userpwd = userpwd;
		this.grading = grading;
	}
	public User() {
		super();
	}
	
	
	
	
}
