/*
  File: TestLogin.java
  August 2002
*/

import java.io.*;
import java.util.*;
import java.sql.*;

/**
 * This program reads a user's pass.dat and connects to Oracle.
 *
 * @author Paul Werstein
 */

public class Two {


    public static void main (String[] args) {
	new Two().go();
    }

    // This is the function that does all the work
    private void go() {

	// Read pass.dat
	UserPass login = new UserPass();
	String user = login.getUserName();
	String pass = login.getPassWord();
	String host = "silver";

	Connection con = null;
        //Statement stmt = null;
	try {
	    // Register the driver and connect to Oracle
	    DriverManager.registerDriver 
		(new oracle.jdbc.driver.OracleDriver());
	    String url = "jdbc:oracle:thin:@" + host + ":1527:cosc344";
            System.out.println("url: " + url);
	    con = DriverManager.getConnection(url, user, pass);
	    System.out.println("Connected to Oracle");

            Statement stmt  = con.createStatement();
            // Create the SQL statement and execute it.
            String sql = new String("SELECT *"+" FROM department" + " WHERE mgrssn = 333445555");
            System.out.println("SQL: " +sql);
            ResultSet result = stmt.executeQuery(sql);
            ResultSetMetaData rsmd = result.getMetaData();
            int columnsNumber = rsmd.getColumnCount();
            while(result.next()){
                for (int i = 1; i <= columnsNumber; i++) {
                    if (i > 1) {
                        System.out.print(",  ");
                    }
                    String columnValue = result.getString(i);
                    System.out.print(columnValue + " ");
                }
            }
            result.close();
	}catch (SQLException e) {
	    System.out.println(e.getMessage());
	    System.exit(1);

	} finally {
	    if (con != null) {
		try {
		    con.close();
		} catch (SQLException e) {
		    quit(e.getMessage());
		}
	    }
	}
    }  // end go()

    // Used to output an error message and exit
    private void quit(String message) {
	System.err.println(message);
	System.exit(1);
    }

} // end class Two


