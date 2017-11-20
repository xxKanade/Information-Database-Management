<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%!
    public String generateRandomNumber(){
		Random rand = new Random();
		int n = rand.nextInt(900000000) + 100000000;
		String x = "" + n;
		return x;
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CustomerRegistera</title>
</head>
<body>
<div align="left">
<a href="Home.jsp">Home</a>
</div>
<br>
<br>

<%
	try {
			
			//Create a connection string
			String url = "jdbc:mysql://cs336project2017summer.cdbdnh5z4lat.us-west-2.rds.amazonaws.com:3306/cs336";
			//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
			Class.forName("com.mysql.jdbc.Driver");

			//Create a connection to your DB
			Connection con = DriverManager.getConnection(url, "cs336", "cs336test");

			String user=request.getParameter("username");
			session.putValue("userid",user);
			String pwd=request.getParameter("pwd");
			String cid=request.getParameter("cid");
			String email=request.getParameter("email");
			
			String fname=request.getParameter("fname");
			String lname=request.getParameter("lname");
			String adress=request.getParameter("adress");
			String city=request.getParameter("city");
			String state=request.getParameter("state");
			String zip=request.getParameter("zip");
			String tel=request.getParameter("tel");
			
			//Create a SQL statement
			Statement st= con.createStatement(); 
			ResultSet rs;
			
			boolean loggedin = false; 
			ResultSet check_rs=st.executeQuery("select * from Account where userName='"+user+"'"); 
			if(check_rs.next()) {
				out.println("ERROR: User already exists! Please try again!");
				request.getSession().setAttribute("accNo", null); 		
				con.close();
				return;
			}
			else{
				//generate account_id
				Statement st1 = con.createStatement();
				PreparedStatement Account_pstatement = null;
				int updateQuery = 0;
				String acid = generateRandomNumber();
				ResultSet check_acid=st1.executeQuery("select * from Account where Account_No='"+acid+"'"); 
				while (check_acid.next()) {
					acid = generateRandomNumber();
					check_acid=st.executeQuery("select * from Account where Account_No='"+acid+"'"); 
				}
				

				System.out.println("generated account_id is:" + acid);
				boolean Input_valid = false;
				boolean Is_NewCustomer = true;
				if(cid == null || cid.isEmpty() || cid.trim().isEmpty()){//generate id_number for person table
					System.out.println("cid input null!");
					Statement st2 = con.createStatement();
					cid = generateRandomNumber();
					ResultSet check_ID_no=st1.executeQuery("select * from Person where ID_No ='"+cid+"'"); 
					while (check_ID_no.next()) {
						cid = generateRandomNumber();
						check_ID_no=st.executeQuery("select * from Person where ID_No='"+cid+"'"); 
					}
					Input_valid = true;
				}else{//check weather the cid input by the user is available
					ResultSet check_ID_no=st1.executeQuery("select * from Person where ID_No ='"+cid+"'"); 
					if (!check_ID_no.next()) {
						Input_valid = false;
						out.println("opps, the customer id not valid, please check again");
					}else{
						Input_valid = true;
						Is_NewCustomer = false;
					}
				}
				System.out.println("generated ID_no is:" + cid);
				//
				if(Input_valid == true){
					//update person table
					if(Is_NewCustomer){
					PreparedStatement person_pstatement = null;
					String person_insert = "INSERT INTO Person (ID_No, First_Name,Last_Name,Address,City,State,Zip_Code,Telephone_No) VALUES (?,?,?,?,?,?,?,?)";
					person_pstatement = con.prepareStatement(person_insert);
					person_pstatement.setString(1, cid);
					person_pstatement.setString(2, fname);
					person_pstatement.setString(3, lname);
					person_pstatement.setString(4, adress);
					person_pstatement.setString(5, city);
					person_pstatement.setString(6, state);
					person_pstatement.setString(7, zip);
					person_pstatement.setString(8, tel);
					updateQuery = person_pstatement.executeUpdate();
					System.out.println("person table updated!");
					
					//update the customer table
					
						PreparedStatement customer_pstatement = null;
						String customer_insert = "INSERT INTO Customer (ID_No, Meal_Preference,Seating_Preference) VALUES (?,?,?)";
						customer_pstatement = con.prepareStatement(customer_insert);
						customer_pstatement.setString(1, cid);
						customer_pstatement.setString(2, null);
						customer_pstatement.setString(3, null);
						updateQuery = customer_pstatement.executeUpdate();
						System.out.println("customer table updated!");
					}
					//insert into account table
					String insert = "INSERT INTO Account (Account_No, ID_No,userName,pass,email) VALUES (?,?,?,?,?)";
					Account_pstatement = con.prepareStatement(insert);
					Account_pstatement.setString(1, acid);
					Account_pstatement.setString(2, cid);
					Account_pstatement.setString(3, user);//set date empty temporily
					Account_pstatement.setString(4, pwd);
					Account_pstatement.setString(5, email);
					updateQuery = Account_pstatement.executeUpdate();
					System.out.println("account table updated!");
					loggedin = true;
					out.println("Congratulations, you have successfully registered! <br><br> Your username is: "  + user + "." ); 
					out.println("<br>Your customer ID is: " + cid + " <br><br> Please remember this customer ID. Click on the Home button to Log In.");
					request.getSession().setAttribute("accNo", acid); 		


				}//end if(Input_valid == true)
			} //end if(check_rs.next()) 

			
	} catch (Exception e) {
		out.print("ERROR: Registration Failed");
		}

%>


</body>
</html>