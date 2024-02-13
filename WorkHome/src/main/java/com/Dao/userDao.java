package com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entities.Leave;
import com.entities.Task;
import com.entities.User;
import com.entities.admin;




public class userDao {
	Connection conn;

	public userDao(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean userRegistration(User u) {
	    boolean f = false;

	    try {
	        String query = "INSERT INTO users(name, email, password, `phone no`) VALUES(?,?,?,?)";
	        PreparedStatement ps = conn.prepareStatement(query);

	        ps.setString(1, u.getName());
	        ps.setString(2, u.getEmail());
	        ps.setString(3, u.getPassword());
	        ps.setString(4, u.getPhoneno());

	        int i = ps.executeUpdate();
	        if (i == 1) {
	            f = true;
	        }
	        ps.close();

	    } catch (Exception e) {
	        e.printStackTrace();
	        System.out.println("Error in user registration: " + e.getMessage());
	    }

	    return f;
	}
	
	
	
	public User userlogin(String n, String p) {
		User user=null;
		try {
			String query="select * from users where name=? and password=?";
			PreparedStatement ps=conn.prepareStatement(query);
			ps.setString(1, n);
			ps.setString(2,p);
		
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				
				user=new User();
				user.setId(rs.getInt(1));
				user.setName(rs.getString(2));
				user.setEmail(rs.getString(3));
				user.setPassword(rs.getString(4));
				user.setPhoneno(rs.getString(5));
				 
			}
			ps.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return user;
	}
	
	public admin adminlogin(admin ad) {
		admin a=null;
		try {
			String query="select * from manager where name=? and password=?";
			PreparedStatement ps=conn.prepareStatement(query);
			ps.setString(1, ad.getName());
			ps.setString(2,ad.getPassword());
		
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				
				a=new admin();
				a.setName(rs.getString("name"));
				a.setPassword(rs.getString("password"));
				
				 
			}
			ps.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return a;
	}
	
	public List<Task> getTaskByID(int uid) {
	    List<Task> list = new ArrayList<>();

	    try {
	        String sql = "select * from tasks where uid=?";
	        PreparedStatement ps = conn.prepareStatement(sql);

	        ps.setInt(1, uid);

	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            Task c = new Task();  // Create a new Task object for each iteration
	            c.setTid(rs.getInt("tid"));
	            c.setDescription(rs.getString("Description"));
	            c.setStart_date(rs.getString("start_date"));
	            c.setEnd_date(rs.getString("end_date"));
	            c.setStatus(rs.getString("status"));
	            list.add(c);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return list;
	}

	public boolean modifystatus(int tid, String status) {
	    boolean f = false;
	    try {
	        String query = "update tasks set status=? where tid=?";
	        PreparedStatement ps = conn.prepareStatement(query);

	        ps.setString(1, status);
	        ps.setInt(2, tid);

	        int i = ps.executeUpdate();
	        if (i == 1) {
	            f = true;
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return f;
	}

	public boolean requestleave(Leave leave) {
		boolean f=false;
		try {
			
			String query="insert into leaves(uid,subject,message,status) values(?,?,?,'No Action')";
			PreparedStatement ps=conn.prepareStatement(query);
			
			ps.setInt(1, leave.getUid());
			ps.setString(2, leave.getSubject());
			ps.setString(3, leave.getMessage());
		
			
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public List<Leave> getLeaveById(int uid){
		List<Leave> leave=new ArrayList<>();
		
		try {
			String query="select* from leaves where uid=?";
			PreparedStatement ps=conn.prepareStatement(query);
			
			ps.setInt(1, uid);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				Leave l=new Leave();
				l.setSubject(rs.getString("subject"));
				l.setMessage(rs.getString("message"));
				l.setStatus(rs.getString("status"));
				leave.add(l);
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return leave;
	}
	
	public List<User> getDetails(User u){
		List<User> users=new ArrayList<>();
		try {
			String query="select uid, name from users ";
			PreparedStatement ps=conn.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				User U=new User();
				U.setId(rs.getInt("uid"));
				U.setName(rs.getString("name"));
				users.add(U);
				
			}
		
					
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return  users;
		
	}

	public boolean createtask(Task t) {
		boolean f=false;
		
		try {
			String query="insert into tasks(uid,Description,start_date,end_date,status) values(?,?,?,?,'NO Action')";
			PreparedStatement ps=conn.prepareStatement(query);
			
			ps.setInt(1, t.getuid());
			ps.setString(2,t.getDescription());
			ps.setString(3, t.getStart_date());
			ps.setString(4, t.getEnd_date());
			
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public List<Task> getAllTask(){
		List<Task> t=new ArrayList<>();
		
		try {
			String query="select * from tasks";
			PreparedStatement ps=conn.prepareStatement(query);
			
			 ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				Task  task=new Task();
				task.setTid(rs.getInt("tid"));
				task.setDescription(rs.getString("description"));
				task.setStart_date(rs.getString("start_date"));
				task.setEnd_date(rs.getString("end_date"));
				task.setStatus(rs.getString("status"));
				
				t.add(task);
			}
			
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		return t;
	}

	public boolean EditTask(Task t) {
	    boolean r = false;
	    try {
	        String query = "update tasks set uid=?, description=?, start_date=?, end_date=? where tid=?";
	        PreparedStatement ps = conn.prepareStatement(query);

	        ps.setInt(1, t.getuid());
	        ps.setString(2, t.getDescription());
	        ps.setString(3, t.getStart_date());
	        ps.setString(4, t.getEnd_date());
	        ps.setInt(5, t.getTid());

	        int i = ps.executeUpdate();

	        if (i == 1) {
	            r = true;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return r;
	}



	public boolean DeleteTask(int tid) {
		
		boolean f=false;
		try {
			String query="delete from tasks where tid=?";
			PreparedStatement ps=conn.prepareStatement(query);
			
			ps.setInt(1, tid);
		int i=	ps.executeUpdate();
		if(i==1) {
			return  f=true;
		}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
		
	}


	public Task getTaskDetails(int taskId) {
	    Task task = null;
	    try {
	        String query = "SELECT * FROM tasks WHERE tid=?";
	        PreparedStatement ps = conn.prepareStatement(query);
	        ps.setInt(1, taskId);

	        ResultSet rs = ps.executeQuery();

	        if (rs.next()) {
	            task = new Task();
	            task.setTid(rs.getInt("tid"));
	            task.setuid(rs.getInt("uid"));
	            task.setDescription(rs.getString("Description"));
	            task.setStart_date(rs.getString("start_date"));
	            task.setEnd_date(rs.getString("end_date"));
	            task.setStatus(rs.getString("status")); // Assuming there's a setter for status in your Task class
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return task;
	}


	
	
	

}
