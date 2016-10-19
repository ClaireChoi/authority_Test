package org.scit.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import org.scit.dao.SeschoolDAO;
import org.scit.vo.Seschool;

import com.opensymphony.xwork2.ActionSupport;

public class SeschoolAction extends ActionSupport implements SessionAware{

	Seschool seschool;
	Map<String, Object> session;
	String userId;
	String userPassword;
	List<Seschool> list_ses;
	
	public String login() throws Exception{
		seschool = new Seschool();
		seschool.setUserId(userId);
		seschool.setUserPassword(userPassword);
		SeschoolDAO dao = new SeschoolDAO();
		seschool = dao.find(seschool);
		if(seschool==null){
			return "false";
		}else{
			session.put("loginId", userId);
			session.put("loginName", "관리자");
			return SUCCESS;
		}
	}//login
	
	public String printAll() throws Exception{
		SeschoolDAO dao = new SeschoolDAO();
		list_ses = dao.printAll();
		for(int i=0; i<list_ses.size(); i++){
			if(list_ses.get(i).getUserId().equals(session.get("loginId"))){
				list_ses.remove(i);
			}//if
		}//for
		return SUCCESS;
	}//printAll
	
	public String grant() throws Exception{
		SeschoolDAO dao = new SeschoolDAO();
		dao.grant(userId);
		return SUCCESS;
	}//grant
	
	public String logout() throws Exception{
		session.clear();//로그아웃
		return SUCCESS;
	}//logout
	
	
	
	
	
	public List<Seschool> getList_ses() {
		return list_ses;
	}

	public void setList_ses(List<Seschool> list_ses) {
		this.list_ses = list_ses;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public Seschool getSeschool() {
		return seschool;
	}

	public void setSeschool(Seschool seschool) {
		this.seschool = seschool;
	}

	@Override
	public void setSession(Map<String, Object> map) {
		this.session = map;
	}//setSession

}//class
