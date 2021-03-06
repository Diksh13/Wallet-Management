/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dbase;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import pkg1.Transaction;
import pkg1.User;
import pkg1.Wallet;

public class Query {
	
	/*
	 * Checks whether user with the given username exist in DB
	 * returns boolean
	 */
	public boolean checkUserExistence(String username) {
		String query = "SELECT * from user where username=?";

		Connection conn = DbConnection.getConnection();
		try {
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			if (!(rs.next() == false)) {
				System.out.println("user exists");
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return false;
	}

	/*
	 * Used to log in the user with the given username and password.
	 */
	public User login(String username, String password) {
		String query = "SELECT id,username,email,password from user where username=? and password=?";

		PreparedStatement ps = null;

		Connection conn = DbConnection.getConnection();
		try {
			ps = conn.prepareStatement(query);
			ps.setString(1, username);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			User user = new User();
			while (rs.next()) {
				user.setId(rs.getInt(1));
				user.setUsername(rs.getString(2));
				user.setEmail(rs.getString(3));
				user.setPassword(rs.getString(4));
			}
			return user;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	/*
	 * Creates user wallet with an initial amount of '0.0'
	 */
	public boolean createUserWallet(User user) {
		String query = "INSERT INTO wallet(cash,uid) VALUES(?,?)";

		Connection conn = DbConnection.getConnection();
		try {
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setDouble(1, 0.0);
			ps.setInt(2, user.getId());
			int rs = ps.executeUpdate();
			if (rs==1) {
				System.out.println("User wallet created.");
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return false;
	}
	
	/*
	 * Retrieves user wallet balance
	 */
	public Wallet getUserWalletBalance(int userId) {
		String query = "SELECT id,cash,uid from wallet where uid=?";

		PreparedStatement ps = null;

		Connection conn = DbConnection.getConnection();
		try {
			ps = conn.prepareStatement(query);
			ps.setInt(1, userId);
			ResultSet rs = ps.executeQuery();
			Wallet wallet = new Wallet();
			while (rs.next()) {
				wallet.setId(rs.getInt(1));
				wallet.setCash(rs.getDouble(2));
				wallet.setUid(rs.getInt(3));
			}
			return wallet;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	/*
	 * Updates user wallet balance with the given amount
	 */
	public Wallet updateUserWalletBalance(int userId,double cash) {
		
		Wallet uWallet = getUserWalletBalance(userId);
		
		String query = "UPDATE wallet SET cash=? where uid=?";

		Connection conn = DbConnection.getConnection();
		try {
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setDouble(1, cash);
			ps.setInt(2, userId);
			int rs = ps.executeUpdate();
			if (rs==1) {
				uWallet.setCash(cash);
				System.out.println("User wallet updated.");
				return uWallet;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return null;
	}
	
	/*
	 * Gets user object based on the userId
	 */
	public User getUserById(int userId) {
		String query = "SELECT id,username,email,password from user where id=?";

		PreparedStatement ps = null;

		Connection conn = DbConnection.getConnection();
		try {
			ps = conn.prepareStatement(query);
			ps.setInt(1, userId);
			ResultSet rs = ps.executeQuery();
			User user = new User();
			while (rs.next()) {
				user.setId(rs.getInt(1));
				user.setUsername(rs.getString(2));
				user.setEmail(rs.getString(3));
				user.setPassword(rs.getString(4));
			}
			return user;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	/*
	 * Gets User Object based on username
	 */
	public User getUserByUserName(String username) {
		String query = "SELECT id,username,email,password from user where username=?";

		PreparedStatement ps = null;

		Connection conn = DbConnection.getConnection();
		try {
			ps = conn.prepareStatement(query);
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			User user = new User();
			while (rs.next()) {
				user.setId(rs.getInt(1));
				user.setUsername(rs.getString(2));
				user.setEmail(rs.getString(3));
				user.setPassword(rs.getString(4));
			}
			return user;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	/*
	 * Do a fresh transaction
	 */
	public boolean doTransaction(Transaction trans) {
		String query = "INSERT INTO transactions(amount,comments,user) VALUES(?,?,?)";

		Connection conn = DbConnection.getConnection();
		
		try {
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setDouble(1, trans.getAmount());
			ps.setString(2, trans.getComments());
			ps.setInt(3, trans.getUser());
			int rs = ps.executeUpdate();
			if (rs==1) {
				System.out.println("User has done a transaction.");
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}

		return false;
	}
	
	
	/*
	 * Retrieves the last n transactions of the user
	 */
	public List<Transaction> getTransactions(int number,User user) {
		String query = "SELECT * FROM transactions where user=? order by time desc limit ?";
		
		List<Transaction> transactions = new ArrayList<Transaction>();

		PreparedStatement ps = null;
		
		Transaction transaction = null;

		Connection conn = DbConnection.getConnection();
		try {
			ps = conn.prepareStatement(query);
			ps.setInt(1, user.getId());
			ps.setInt(2, number);
			
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				transaction = new Transaction(rs.getInt(1), rs.getDouble(2), rs.getString(3), rs.getDate(4), rs.getInt(5));
				transactions.add(transaction);
			}
			return transactions;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
        
        


public ArrayList<ArrayList<String>> getWeekBar(User user){
            String query = "SELECT comments,sum(amount) from transactions where user=? and week(time)=week(CURDATE()) GROUP BY comments";
                ArrayList<ArrayList<String>> BarData=new ArrayList<ArrayList<String>>(2);
		ArrayList<String> BarDataX  = new ArrayList<String>();
                ArrayList<String> BarDataY = new ArrayList<String>();
		PreparedStatement ps = null;
                Connection conn = DbConnection.getConnection();
		try {
			ps = conn.prepareStatement(query);
			ps.setInt(1, user.getId());
			ResultSet rs = ps.executeQuery();
                        while(rs.next()){
                            System.out.println(rs.getString(1));
                            System.out.println(rs.getInt(2));
                            BarDataX.add("\""+rs.getString(1)+"\"");
                            BarDataY.add(rs.getString(2));
                        }
                        BarData.add(BarDataX);
                        BarData.add(BarDataY);
                        return BarData;
                        
                        
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
        }

public ArrayList<ArrayList<String>> getAllBar(User user){
            String query = "SELECT comments,sum(amount) from transactions where user=? GROUP BY comments";
                ArrayList<ArrayList<String>> BarData=new ArrayList<ArrayList<String>>(2);
		ArrayList<String> BarDataX  = new ArrayList<String>();
                ArrayList<String> BarDataY = new ArrayList<String>();
		PreparedStatement ps = null;
                Connection conn = DbConnection.getConnection();
		try {
			ps = conn.prepareStatement(query);
			ps.setInt(1, user.getId());
			ResultSet rs = ps.executeQuery();
                        while(rs.next()){
                            System.out.println(rs.getString(1));
                            System.out.println(rs.getInt(2));
                            BarDataX.add("\""+rs.getString(1)+"\"");
                            BarDataY.add(rs.getString(2));
                        }
                        BarData.add(BarDataX);
                        BarData.add(BarDataY);
                        return BarData;
                        
                        
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
        }


public ArrayList<ArrayList<String>> getBar(User user, String stat){
    String query=null;
    if(stat.equals("Today")){
           query = "SELECT comments,sum(amount) from transactions where user=? and date(time)=CURDATE() GROUP BY comments";
    }
    else if(stat.equals("Weekly")){
    
            query = "SELECT comments,sum(amount) from transactions where user=? and week(time)=week(CURDATE()) GROUP BY comments";
}
    else if(stat.equals("Monthly")){
            query = "SELECT comments,sum(amount) from transactions where user=? and month(time)=month(CURDATE()) GROUP BY comments";}
    else{
            query = "SELECT comments,sum(amount) from transactions where user=? and year(time)=year(CURDATE()) GROUP BY comments";
    }
    
    
                ArrayList<ArrayList<String>> BarData=new ArrayList<ArrayList<String>>(2);
		ArrayList<String> BarDataX  = new ArrayList<String>();
                ArrayList<String> BarDataY = new ArrayList<String>();
		PreparedStatement ps = null;
                Connection conn = DbConnection.getConnection();
		try {
			ps = conn.prepareStatement(query);
			ps.setInt(1, user.getId());
			ResultSet rs = ps.executeQuery();
                        while(rs.next()){
                            System.out.println(rs.getString(1));
                            System.out.println(rs.getInt(2));
                            BarDataX.add("\""+rs.getString(1)+"\"");
                            BarDataY.add(rs.getString(2));
                        }
                        BarData.add(BarDataX);
                        BarData.add(BarDataY);
                        return BarData;
                        
                        
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
        }



	
	

}
