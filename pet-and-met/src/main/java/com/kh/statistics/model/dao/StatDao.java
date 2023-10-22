package com.kh.statistics.model.dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

import com.kh.common.JDBCTemplate;
import com.kh.payment.model.dao.PaymentDao;
import com.kh.statistics.model.vo.Income;
import com.kh.statistics.model.vo.Percent;
import com.kh.statistics.model.vo.Reserve;
import com.kh.statistics.model.vo.Visitor;

public class StatDao {
	private Properties prop = new Properties();
	public StatDao() {
		try { prop.loadFromXML(new FileInputStream(PaymentDao.class.getResource("/sql/statistics/stat-mapper.xml").getPath())); }
		catch (InvalidPropertiesFormatException e) { e.printStackTrace(); }
		catch (FileNotFoundException e) { e.printStackTrace(); }
		catch (IOException e) { e.printStackTrace(); }
	}
	public ArrayList<Visitor> getVisitorMonth(Connection conn, int year, int month) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Visitor>list = new ArrayList<Visitor>();
		
		String sql = prop.getProperty("getVisitorMonth");
		
		int date = 0;
		
		if(month == 2) { date = 28; }
		else if(month <= 7 && month % 2 == 1) { date = 31; }
		else if(month >= 8 && month % 2 == 0) { date = 31; }
		else { date = 30; }
		
		String minDate = year + "-" + String.format("%02d", month) + "-01";
		String maxDate = year + "-" + String.format("%02d", month) + "-" + date;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, minDate);
			pstmt.setString(2, maxDate);
			pstmt.setString(3, minDate);
			pstmt.setString(4, maxDate);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) { list.add(new Visitor(month, rset.getInt("COUNT_CONFIRM") + rset.getInt("COUNT_CANCEL"), rset.getInt("COUNT_CANCEL"))); }
		} 
		catch (SQLException e) { e.printStackTrace(); }
		
		JDBCTemplate.close(rset);
		JDBCTemplate.close(pstmt);
		
		return list;
	}
	public ArrayList<Visitor> getVisitorMonth(Connection conn, int y) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Visitor>list = new ArrayList<Visitor>();
		
		String sql = prop.getProperty("getVisitorYear");
		
		String minDate = y + "-01-01";
		String maxDate = y + "-12-31";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, minDate);
			pstmt.setString(2, maxDate);
			pstmt.setString(3, minDate);
			pstmt.setString(4, maxDate);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) { list.add(new Visitor(y, rset.getInt("COUNT_CONFIRM") + rset.getInt("COUNT_CANCEL"), rset.getInt("COUNT_CANCEL"))); }
		} 
		catch (SQLException e) { e.printStackTrace(); }
		
		JDBCTemplate.close(rset);
		JDBCTemplate.close(pstmt);
		
		return list;
	}
	public ArrayList<Income> getIncomeMonth(Connection conn, int year, int month) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Income>list = new ArrayList<Income>();
		
		String sql = prop.getProperty("getIncome");
		
		int date = 0;
		
		if(month == 2) { date = 28; }
		else if(month <= 7 && month % 2 == 1) { date = 31; }
		else if(month >= 8 && month % 2 == 0) { date = 31; }
		else { date = 30; }
		
		String minDate = year + "-" + String.format("%02d", month) + "-01";
		String maxDate = year + "-" + String.format("%02d", month) + "-" + date;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, minDate);
			pstmt.setString(2, maxDate);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				int temp = 0;
				try { temp = Integer.parseInt(rset.getString("INCOME")); } catch(Exception e) { temp = 0; }
				list.add(new Income(month, temp, ((int)(temp / 10)) * 7)); 
			}
		} 
		catch (SQLException e) { e.printStackTrace(); }
		
		JDBCTemplate.close(rset);
		JDBCTemplate.close(pstmt);
		
		return list;
	}
	public ArrayList<Income> getVisitorYear(Connection conn, int y) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Income>list = new ArrayList<Income>();
		
		String sql = prop.getProperty("getIncome");
		
		String minDate = y + "-01-01";
		String maxDate = y + "-12-31";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, minDate);
			pstmt.setString(2, maxDate);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				int temp = 0;
				try { temp = Integer.parseInt(rset.getString("INCOME")); } catch(Exception e) { temp = 0; }
				list.add(new Income(y, temp, ((int)(temp / 10)) * 7)); 
			}
		} 
		catch (SQLException e) { e.printStackTrace(); }
		
		JDBCTemplate.close(rset);
		JDBCTemplate.close(pstmt);
		
		return list;
	}
	public ArrayList<Reserve> getTypeReserve(Connection conn) {
		PreparedStatement pstmt = null;
		PreparedStatement pstmt_whole = null;
		ResultSet rset = null;
		ResultSet rset_whole = null;
		ArrayList<Reserve> list = new ArrayList<>();
		
		String sql = prop.getProperty("getTypeReserve");
		String sql_whole = prop.getProperty("getTypeWhole");
		
		for(String s:new String[] {"A", "B"}) {
			int whole = 0;
			int resv = 0;
			try {
				pstmt_whole = conn.prepareStatement(sql_whole);
				
				pstmt_whole.setString(1, s);
				
				rset_whole = pstmt_whole.executeQuery();
				
				if(rset_whole.next()) { whole = rset_whole.getInt("WHOLE"); }
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, s);
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					resv = rset.getInt("RESV");
					list.add(new Reserve(s + "타입", resv, whole-resv)); 
				}
			} 
			catch (SQLException e) { e.printStackTrace(); }
		}
		
		JDBCTemplate.close(rset_whole);
		JDBCTemplate.close(rset);
		JDBCTemplate.close(pstmt_whole);
		JDBCTemplate.close(pstmt);
		
		return list;
	}
	public Percent getTypePercent(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Percent percent = new Percent();
		
		String sql = prop.getProperty("getTypePercent");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) { percent = new Percent(rset.getInt("A"), rset.getInt("B"), rset.getInt("A") + rset.getInt("B")); } 
		} 
		catch (SQLException e) { e.printStackTrace(); }
		
		JDBCTemplate.close(rset);
		JDBCTemplate.close(pstmt);
		
		return percent;
	}
}