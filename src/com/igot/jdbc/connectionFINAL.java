package com.igot.jdbc;

import java.sql.*;
import java.util.ArrayList;

import org.eclipse.jdt.internal.compiler.batch.Main;

import com.mysql.jdbc.Driver;
import com.igot.models.MainThread;
import com.igot.models.SubThread;
import com.igot.models.User;

public class connectionFINAL {

	private Connection connection; // to connect to the db
	private ResultSet result; // works like a arraylist
	private PreparedStatement ps; // querying
	private Statement statement; // query

	public connectionFINAL() {

		try {

			Class.forName("com.mysql.jdbc.Driver");
			this.connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/forum", "root", "123456");
			statement = connection.createStatement(); // executes db connection

			String createTable = "CREATE TABLE IF NOT EXISTS user("
					+ "username varchar(50) primary key,"
					+ "password varchar(25)," 
					+ "lastname varchar(50),"
					+ "firstname varchar(50)" + ")"
					;
			statement.execute(createTable);
		//	System.out.println("1");
//================================================================================================================		
			String p ="CREATE TABLE IF NOT EXISTS category("
					+ "categoryID int primary key,"
					+ "categoryName varchar(50)"
					+ ")";

			statement.execute(p);
		//	System.out.println("2");
//================================================================================================================
			this.result = statement.executeQuery("SELECT count(*) as ct FROM category");
			this.result.next();
			
			if(this.result.getString("ct").equals("0")){
				for(int i=0;i<7;i++){
					String kani="";
					switch(i){
						case 0: kani = "Android"; break;
						case 1: kani = "IOS"; break;
						case 2: kani = "Internet"; break;
						case 3: kani = "Gadgets"; break;
						case 4: kani = "Inventions"; break;
						case 5: kani = "Root"; break;
						case 6: kani = "Updates"; break;
					}
					ps = connection.prepareStatement("INSERT INTO category VALUES('"+i+"','"+kani+"')");
					ps.execute();
				}
			}
		//	System.out.println("3");
//================================================================================================================
			String pipop ="CREATE TABLE IF NOT EXISTS mainthread("
					+ "mthreadID int primary key,"
					+ "categoryID int,"
					+ "threadTitle varchar(70),"
					+ "threadDescription varchar(250),"
					+ "threadDateStarted varchar(50),"
					+ "username varchar (40)"
					+ ")";
			
			statement.execute(pipop);
		//	System.out.println("4");
//================================================================================================================			
			String ct ="CREATE TABLE IF NOT EXISTS subthread("
					+ "sthreadID int primary key,"
					+ "categoryID int,"
					+ "mthreadID int,"
					+ "comment varchar(600),"
					+ "threadDateSent varchar(50),"
					+ "username varchar(50)"
					+ ")";
			
			statement.execute(ct);
		//	System.out.println("5");
//================================================================================================================			
		} catch (Exception e) {
			System.out.println("!>> connect const: " + e.toString());
		}

	}
	
	public String getThreadTitle(int threadID,int categoryID){
		
		try{
			
			this.result = statement.executeQuery("select threadTitle from mainthread "
									+ "where categoryID = '"+categoryID+"' and mthreadID = '"+threadID+"'");
			
			this.result.next();
			
			String title = this.result.getString("threadTitle");
					
			return title;
		}catch(Exception e){
			System.out.println("!>> getThreadTitle: "+e.toString());
			return "";
		}
		
		
	}

	public ArrayList<MainThread> getMainThread(int categoryID) {

		ArrayList<MainThread> mk= new ArrayList<MainThread>();
		try {
			String samting = "SELECT *  FROM mainthread m WHERE m.categoryID = '"+categoryID+"'";
			
			this.result = statement.executeQuery(samting);
			
			while (this.result.next()) {
				String mthreadID = result.getString("mthreadID");
				String categoryID2 = result.getString("categoryID");
				String title = result.getString("threadTitle");
				String desc  = result.getString("threadDescription");
				String dateStarted = result.getString("threadDateStarted");
				String username = result.getString("username");
				MainThread m = new MainThread(mthreadID, categoryID2, title, desc,dateStarted,username);
				mk.add(m);
			}
		} catch (Exception e) {
			System.out.println("*!>> mainThread AL: " + e.toString());
		}

		return mk;

	}

	public ArrayList<SubThread> getSubThread(int mthreadID, int categoryID){
		
		ArrayList<SubThread> mk= new ArrayList<SubThread>();
		try {
			String samting = "SELECT c.categoryName, m.threadTitle, s.comment, s.threadDateSent, s.username  "
					+ "FROM subthread s, mainthread m, category c "
					+ "WHERE (s.mthreadID = '"+mthreadID+"' and s.categoryID = '"+categoryID+"') and (m.mthreadID = s.mthreadID) and (c.categoryID = s.categoryID)";
			
			this.result = statement.executeQuery(samting);
			
			while (this.result.next()) {
				String category = result.getString("c.categoryName");
				String threadTitle = result.getString("m.threadTitle");
				String comment  = result.getString("s.comment");
				String dateSent = result.getString("s.threadDateSent");
				String sender  = result.getString("s.username");
				
				SubThread s = new SubThread(category, threadTitle, comment, dateSent, sender);
				
				
				mk.add(s);
			}
		} catch (Exception e) {
			System.out.println("*!>> subThread AL: " + e.toString());
		}

		return mk;
		
	}
	public String checkStudent(String username, String password)throws SQLException {
		String r="";
		try {

			// execute select SQL statement
			this.result = statement.executeQuery("SELECT username,lastname,firstname FROM user WHERE username = '"
							+ username + "' and password ='" + password + "'");
			if(result!=null){
				while (result.next()) {

					String lastname = result.getString("lastname");
					String firstname = result.getString("firstname");

					System.out.println("lastname : " + lastname);
					System.out.println("firstname : " + firstname);
					r= firstname + " " + lastname;
				}
				return r;
			} else{
				System.out.println("hala wala");
			}			
			

		} catch (Exception e) {

			System.out.println("!>>checkStudent: " + e.toString());
			return r;
		} finally {

			if (ps != null) {
				ps.close();
			}

			if (connection != null) {
				connection.close();
			}
			
			
		}
		return r;
	}

	public String addUser(User us) {
		try {

			ps = connection.prepareStatement("INSERT INTO user VALUES(?,?,?,?)");
			ps.setString(1, us.getUserName()); // starts with index 1 jd
			ps.setString(2, us.getPassword());
			ps.setString(3, us.getLastname());
			ps.setString(4, us.getFirstName());

			ps.execute();

		} catch (Exception e) {
			System.out.println("!>> addUser: " + e.toString());
			return "fail";
		}
		return "success";
	}
	public String addMainThread(int categoryID, String title, String desc,String date, String username){// String date; 
		
		try {
						
			this.result = statement.executeQuery("SELECT count(*) as ct FROM mainthread");
			this.result.next();
			
			int threadID = Integer.parseInt(this.result.getString("ct").toString());
			
			
			ps = connection.prepareStatement("INSERT INTO mainthread VALUES('"+threadID+"','"+categoryID+"','"+title+"','"+desc+"','"+date+"','"+username+"')");
			ps.execute();

		} catch (Exception e) {
			System.out.println("!>> addMainThread: " + e.toString());
			return "danger";
		}
		return "success";
	}
	public int getSubThreadCount(int categoryID,int mainThreadID){
		
		try {
			
			this.result = statement.executeQuery("SELECT count(*) as ct FROM subthread WHERE mthreadID='"+mainThreadID+"' AND categoryID='"+categoryID+"'");
			this.result.next();
			
			int count = Integer.parseInt(this.result.getString("ct").toString());
			
			return count;
		} catch (Exception e) {
			System.out.println("!>> getSubThreadCount: " + e.toString());
			return -1;
		}
		
	}
	public String addSubThread(int categoryID,int mainThreadID,String comment, String dateSent,String username){
		try {
			
			this.result = statement.executeQuery("SELECT count(*) as ct FROM subthread");
			this.result.next();
			int threadID = Integer.parseInt(this.result.getString("ct").toString());
						
			ps = connection.prepareStatement("INSERT INTO subthread VALUES('"+threadID+"','"+categoryID+"','"+mainThreadID+"','"+comment+"','"+dateSent+"','"+username+"')");
			ps.execute();

		} catch (Exception e) {
			System.out.println("!>> addSubThread: " + e.toString());
			return "danger";
		}
		return "success";
	}
}
















