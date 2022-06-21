package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;

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
	public boolean flagUpdate(int userid, String taskflag, String[] taskArray) {
		Connection conn = null;
		boolean result = false;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			String taskid= "";
			for(int i=0; i<taskArray.length-1; i++) {
				taskid += "TASKID =" + taskArray[i] + "or" ;
			}
			taskid += "TASKID =" + taskArray[taskArray.length-1] + ")";

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo_db/Sol-ty", "sa", "");

			// SQL文を準備する
			String sql =  "update Task set TASKFLAG=? where userid = ? and (" + taskid ;
			PreparedStatement pStmt = conn.prepareStatement(sql);
			pStmt.setInt(1, userid);

			// SQL文を完成させる
			if (taskflag.equals("完了") && !taskflag.equals("")) {
				pStmt.setString(1, "未完了");
			}
			else {
				pStmt.setString(1, "完了");
			}
			pStmt.setInt(2, userid);

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
	public boolean textUpdate(int userid, String taskcontent, String taskid) {
		Connection conn = null;
		boolean result = false;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");


			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo_db/Sol-ty", "sa", "");

			// SQL文を準備する
			String sql =  "update Task set TASKCONTENT=? where userid = ? taskid = ?";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			pStmt.setString(1, taskcontent);

			pStmt.setInt(2, userid);
			pStmt.setString(3, taskid);

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
	public boolean delete(int userid, String[]taskArray) {
		Connection conn = null;
		boolean result = false;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			String taskid= "";

			for(int i=0; i<taskArray.length-1; i++) {
				taskid += "TASKID =" + taskArray[i] + "or" ;
			}
			taskid += "TASKID =" + taskArray[taskArray.length-1] + ")";


			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo_db/Sol-ty", "sa", "");

			// SQL文を準備する
			String sql = "delete from TASK where userid = ? and (" + taskid;
			PreparedStatement pStmt = conn.prepareStatement(sql);
			pStmt.setInt(1, userid);

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
	public boolean updateDate(int userid, int taskid, int registday) {
		Connection conn = null;
		boolean flag = false;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo_db/Sol-ty", "sa", "");

			// SQL文を準備する
			String sql =  "update Task set REGISTDAY = ? where userid = ? and taskid = ?";
			PreparedStatement pStmt = conn.prepareStatement(sql);
			//　SQL文"?"の箇所に値を埋める
			pStmt.setInt(1, registday);
			pStmt.setInt(2, userid);
			pStmt.setInt(3, taskid);


			//SQLの実行結果の処理
			if(pStmt.executeUpdate() ==1 ) {
				flag =  true;
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			flag = false;
		} catch (SQLException e) {
			e.printStackTrace();
			flag = false;
		}
		finally {
			// データベースを切断する
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
					flag = false;
				}
			}
		}

		return flag;
	}

	private String monthFormat(int year, int month) {

		if(month == 0) {
			year--;
			month = 12;
		}
		else if(month == 13) {
			year++;
			month = 1;
		}

		String ymDate =  year + String.format("%02d", month);

		return ymDate;
	}

	public JSONObject monthTask(int userid, int year, int month) {
		Connection conn = null;
		JSONObject json = new JSONObject();

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo_db/Sol-ty", "sa", "");

			String prevMonth =  monthFormat(year, month-1) + "25";
			String nextMonth = monthFormat(year, month+1) + "14";

			// SQL文を準備する
			String sql =  "select TASKID, TASKCONTENT, REGISTDAY from Task where USERID = ? and REGISTDAY > ? and REGISTDAY < ? ";
			PreparedStatement pStmt = conn.prepareStatement(sql);
			//　SQL文"?"の箇所に値を埋める
			pStmt.setInt(1, userid);
			pStmt.setInt(2, Integer.parseInt(prevMonth));
			pStmt.setInt(3, Integer.parseInt(nextMonth));

			//DBに対しQuery実行。rsに実行結果を蓄積。
			ResultSet rs = pStmt.executeQuery();

			//SQLの実行結果の処理
			List< Map<String, String>> tasks = new ArrayList<Map<String, String>>();

			while (rs.next()) {
				Map<String, String> task = new HashMap<String, String>();
				task.put("id" ,rs.getString("TASKID"));
				task.put("title", rs.getString("TASKCONTENT"));
				task.put("start", rs.getString("REGISTDAY"));

				tasks.add(task);
			}
			json.put("data", tasks);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
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

		return json;
	}
}
