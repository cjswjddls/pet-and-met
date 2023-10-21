package com.kh.statistics.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.JDBCTemplate;
import com.kh.statistics.model.dao.StatDao;
import com.kh.statistics.model.vo.Income;
import com.kh.statistics.model.vo.Visitor;

public class StatService {

	public ArrayList<Visitor> getVisitorMonth(int year, int month) {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Visitor>list = new ArrayList<Visitor>();
		
		ArrayList<Visitor> v = new ArrayList<Visitor>();
		for(int m=month-2; m<=month; m++) { 
			v.clear();
			if(m <= 0) { v = new StatDao().getVisitorMonth(conn, year-1, m+12); }
			else { v = new StatDao().getVisitorMonth(conn, year, m); }
			list.addAll(v);
		}
		
		JDBCTemplate.close(conn);
		
		return list;
	}

	public ArrayList<Visitor> getVisitorYear(int year) {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Visitor>list = new ArrayList<Visitor>();
		
		ArrayList<Visitor> v = new ArrayList<Visitor>();
		for(int y=year-2; y<=year; y++) { 
			v.clear();
			v = new StatDao().getVisitorMonth(conn, y);
			list.addAll(v);
		}
		
		JDBCTemplate.close(conn);
		
		return list;
	}

	public ArrayList<Income> getIncomeMonth(int year, int month) {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Income>list = new ArrayList<Income>();
		
		ArrayList<Income> v = new ArrayList<Income>();
		for(int m=month-2; m<=month; m++) { 
			v.clear();
			if(m <= 0) { v = new StatDao().getIncomeMonth(conn, year-1, m+12); }
			else { v = new StatDao().getIncomeMonth(conn, year, m); }
			list.addAll(v);
		}
		
		JDBCTemplate.close(conn);
		
		return list;
	}
}