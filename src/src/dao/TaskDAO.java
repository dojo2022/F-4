package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.LoginUser;
import model.Task;

public class TaskDAO {
	public List<List<Task>> select(LoginUser loginuser, int registday, int today ) {
		//接続オブジェクトの定義
		Connection conn = null;
		//Task型のArrayListのインスタンスを生成してtasklistに格納
		List<List<Task>> taskList = new ArrayList<List<Task>>();
		List<Task> comList = new ArrayList<Task>();
		List<Task> expList = new ArrayList<Task>();

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo_db/Sol-ty", "sa", "");

			// SQL文を準備する
			String sql = "select * from Task WHERE USERID = ? and REGISTDAY like ? and TASKFLAG = '未完了'";
			PreparedStatement pStmt = conn.prepareStatement(sql);
			pStmt.setInt(1, loginuser.getUserid());
			pStmt.setInt(2, registday);

			String sql2 = "select * from Task WHERE USERID = ? and REGISTDAY < ? and TASKFLAG = '未完了'";
			PreparedStatement pStmt2 = conn.prepareStatement(sql2);
			pStmt2.setInt(1, loginuser.getUserid());
			pStmt2.setInt(2, today);


			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();
			ResultSet rs2 = pStmt2.executeQuery();
			// 結果表をコレクションにコピーする
						while (rs.next()) {
							Task todo = new Task(
							rs.getInt("TASKID"),
							rs.getInt("USERID"),
							rs.getInt("REGISTDAY"),
							rs.getString("COMPDAY"),
							rs.getString("TASKFLAG"),
							rs.getString("DEADLINE"),
							rs.getString("TASKCONTENT")
							);
							comList.add(todo);
						}
						while (rs2.next()) {
							Task todo = new Task(
							rs2.getInt("TASKID"),
							rs2.getInt("USERID"),
							rs2.getInt("REGISTDAY"),
							rs2.getString("COMPDAY"),
							rs2.getString("TASKFLAG"),
							rs2.getString("DEADLINE"),
							rs2.getString("TASKCONTENT")
							);
							expList.add(todo);
						}
					taskList.add(comList);
					taskList.add(expList);
					}
					catch (SQLException e) {
						e.printStackTrace();
						taskList = null;
					}
					catch (ClassNotFoundException e) {
						e.printStackTrace();
						taskList = null;
					}
					finally {
						// データベースを切断
						if (conn != null) {
							try {
								conn.close();
							}
							catch (SQLException e) {
								e.printStackTrace();
								taskList = null;
							}
						}
					}
			return taskList;
	}

	public List<Task> compSelect(LoginUser user) {

		Connection conn = null;

		List<Task> compList = new ArrayList<Task>();

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo_db/Sol-ty", "sa", "");

			// SQL文を準備する
			String sql = "select * from Task WHERE USERID = ? and TASKFLAG = '完了' ORDER BY TASKID DESC LIMIT 50";
			PreparedStatement pStmt = conn.prepareStatement(sql);
			pStmt.setInt(1, user.getUserid());

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();
			// 結果表をコレクションにコピーする
						while (rs.next()) {
							Task todo = new Task(
							rs.getInt("TASKID"),
							rs.getInt("USERID"),
							rs.getInt("REGISTDAY"),
							rs.getString("COMPDAY"),
							rs.getString("TASKFLAG"),
							rs.getString("DEADLINE"),
							rs.getString("TASKCONTENT")
							);
							compList.add(todo);
						}
					}
					catch (SQLException e) {
						e.printStackTrace();
						compList = null;
					}
					catch (ClassNotFoundException e) {
						e.printStackTrace();
						compList = null;
					}
					finally {
						// データベースを切断
						if (conn != null) {
							try {
								conn.close();
							}
							catch (SQLException e) {
								e.printStackTrace();
								compList = null;
							}
						}
					}

		return compList;
	}

//新規
public boolean insert(Task todo) {
	Connection conn = null;
	boolean result = false;

	try {
		// JDBCドライバを読み込む
		Class.forName("org.h2.Driver");

		// データベースに接続する
		conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo_db/Sol-ty", "sa", "");

		// SQL文を準備する
		String sql = "insert into Task (USERID, REGISTDAY, DEADLINE, TASKCONTENT) values (?, ?, ?, ?)";
		PreparedStatement pStmt = conn.prepareStatement(sql);

		// SQL文を実行する
		pStmt.setInt(1, todo.getUserid());

		pStmt.setInt(2, todo.getRegistday());

		/*if (todo.getRegistday() != null && !todo.getRegistday().equals("")) {
			pStmt.setString(2, todo.getRegistday());
		}
		else {
			pStmt.setString(2,"");
		}*/

		if (todo.getDeadline() != null && !todo.getDeadline().equals("")) {
			pStmt.setString(3, todo.getDeadline());
		}
		else {
			pStmt.setString(3, "");
		}
		if (todo.getTaskcontent() != null &&!todo.getTaskcontent() .equals("")) {
			pStmt.setString(4, todo.getTaskcontent());
		}
		else {
			pStmt.setString(4, "");
		}

		// SQL
		if (pStmt.executeUpdate() == 1) {
			result = true;
		}
	}
	catch (SQLException e) {
		e.printStackTrace();
		result= false;
	}
	catch (ClassNotFoundException e) {
		e.printStackTrace();
		result= false;
	}

	finally {
		// データベースを切断
		if (conn != null) {
			try {
				conn.close();
			}
			catch (SQLException e) {
				e.printStackTrace();
				result= false;
			}
		}
	}

	// 結果を返す
	return result;
}

//更新
	public boolean update(Task todo, String[]taskArray) {
		Connection conn = null;
		boolean result = false;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			String taskid= "";
			for(int i=0; i<taskArray.length-1; i++) {
				taskid += "TASKID =" + taskArray[i] + "or" ;
			}
			taskid += "TASKID =" + taskArray[taskArray.length-1];

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo_db/Sol-ty", "sa", "");

			// SQL文を準備する
			String sql =  "update Task set TASKFLAG=?, TASKCONTENT=? where" + taskid ;
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			if (todo.getTaskflag().equals("完了") && !todo.getTaskflag().equals("")) {
				pStmt.setString(1, todo.getTaskflag());
			}
			else {
				pStmt.setString(1, "未完了");
			}

			if (todo.getTaskcontent() != null && !todo.getTaskcontent().equals("")) {
				pStmt.setString(2, todo.getTaskcontent());
			}
			else {
				pStmt.setString(2, "task");
			}

			// SQL文を実行する
			if (pStmt.executeUpdate() == 1) {
				result = true;
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			result= false;
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
			result= false;
		}
		finally {
			// データベースを切断する
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
					result= false;
				}
			}
		}

		// 結果を返す
		return result;
	}
//削除
	public boolean delete(String[]taskArray) {
		Connection conn = null;
		boolean result = false;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			String taskid= "";

			for(int i=0; i<taskArray.length-1; i++) {
				taskid += "TASKID =" + taskArray[i] + "or" ;
			}
			taskid += "TASKID =" + taskArray[taskArray.length-1];


			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo_db/Sol-ty", "sa", "");

			// SQL文を準備する
			String sql = "delete from TASK where" + taskid;
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を実行する
			if (pStmt.executeUpdate() == 1) {
				result = true;
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			result= false;
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
			result= false;
		}
		finally {
			// データベースを切断する
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

		// 結果を返す
		return result;
	}
}
