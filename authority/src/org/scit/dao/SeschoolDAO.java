package org.scit.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.scit.vo.Seschool;

public class SeschoolDAO {
	
	public Seschool find(Seschool ses){
		Seschool seschool = null;
		
		SqlSession ss = MybatisConfig.getSqlSessionFactory().openSession();
		try {
			seschool = ss.selectOne("SeschoolMapper.find", ses);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(ss!=null) ss.close();
		}
		
		return seschool;
	}//find
	
	public List<Seschool> printAll(){
		List<Seschool> list_ses = null;
		SqlSession ss = MybatisConfig.getSqlSessionFactory().openSession();
		try {
			list_ses = ss.selectList("SeschoolMapper.printAll");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(ss!=null) ss.close();
		}
		return list_ses;
	}//printAll
	
	public void grant(String userId){
		SqlSession ss = MybatisConfig.getSqlSessionFactory().openSession();
		try {
			ss.update("SeschoolMapper.grant", userId);
			ss.commit();
		} catch (Exception e) {
			e.printStackTrace();
			ss.rollback();
		} finally {
			if(ss!=null) ss.close();
		}
	}//grant
}//class
