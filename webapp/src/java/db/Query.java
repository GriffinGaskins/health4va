package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;

public class Query {
    
    public int year;
    public String degree;
    
    public int div_num;
    public int sch_num;
    public String sch_name;
    public int sch_year;
    public int program_num;

    private int[][] race_data;
    private ArrayList<Integer> data;
    private int[][] stemData;

    public Query(HttpServletRequest request) {
        div_num = parseInt(request, "div_num");
        sch_year = parseInt(request, "sch_year");
        program_num = parseInt(request, "program_num");
        year = parseInt(request, "year");
        degree = parseStr(request, "degree");
    }

    private int parseInt(HttpServletRequest request, String name) {
        String str = request.getParameter(name);
        try {
            return Integer.parseInt(str);
        } catch (NumberFormatException exc) {
            return 0;
        }
    }

    private String parseStr(HttpServletRequest request, String name) {
        String str = request.getParameter(name);
        if (str != null) {
            return str;
        } else {
            return "ALL";
        }
    }

   public int[][] getRaceData() {
        // return cached copy if exists
        if (race_data != null) {
            return race_data;
        } 
        // TODO Step 3: Execute SQL
        String sql = "SELECT * FROM fake_race_program(?, ?, ?)";
        try {
            // set the query parameters
            Connection db = Database.open();
            PreparedStatement st = db.prepareStatement(sql);
            st.setInt(1, sch_year);
            st.setInt(2, program_num);
            st.setInt(3, div_num);
            
            ResultSet rs = st.executeQuery();
            
            // execute query, save results
            race_data = new int[7][2];
            
            int i = 0;
            
            while(rs.next())
            {
                race_data[i][0] = Integer.parseInt(rs.getString("race"));
                race_data[i][1] = rs.getInt("comp_cnt");
                i++;
            }
            
            // close database resources
            st.close();
            rs.close();
            return race_data;
            
        } catch (SQLException exc) {
            // lazy hack to simplify hw5
            throw new RuntimeException(exc);
        }
    }

    public ArrayList getData() {
        // return cached copy if exists
        if (data != null) {
            return data;
        }
        // TODO Step 3: Execute SQL
        String sql = "SELECT * FROM degrees(?)";
        String sql2 = "SELECT * FROM degrees_stemh(?)";
        
        try {
            // set the query parameters
            Connection db = Database.open();
            PreparedStatement st = db.prepareStatement(sql);
            PreparedStatement st2 = db.prepareStatement(sql2);
            ResultSet rs;
            ResultSet rs2;
            
            st.setInt(1, div_num);
            // execute query, save results
            rs = st.executeQuery();
            data = new ArrayList();
           
            //rs.next();
            while(rs.next())
            {
                //rs.next();
                data.add(rs.getInt(1));
                
            }
            
            st2.setInt(1, div_num);
            rs2 = st2.executeQuery();
            while(rs2.next())
            {
                data.add(rs2.getInt(1));
            }
            
            // close database resources
            rs.close();
            st.close();
            db.close();
            return data;
        } catch (SQLException exc) {
            // lazy hack to simplify hw5
            throw new RuntimeException(exc);
        }
    }
    
    public int[][] getDataSTEM() {
        // return cached copy if exists
        if (stemData != null) {
            return stemData;
        } 
        String sql = "SELECT * FROM stem_enroll(?, ?)";
        
        try {
            // set the query parameters
            Connection db = Database.open();
            PreparedStatement st = db.prepareStatement(sql);
            ResultSet rs;
            
            st.setInt(1, year);
            st.setString(2, degree);
            // execute query, save results
            rs = st.executeQuery();
            stemData = new int[2][6];
            
            if(rs.next())
            {
                for(int i = 0; i<2; i++)
                {
                //rs.next();
                    stemData[i][0] = rs.getInt(1);
                
                    for(int j = 1; j<6; j++)
                    {
                        stemData[i][j] = rs.getInt(j+3);
                    }
                    if(!rs.next())
                    {
                        break;
                    }
                }
            }

            // close database resources
            rs.close();
            st.close();
            db.close();
            return stemData;
        } catch (SQLException exc) {
            // lazy hack to simplify hw5
            throw new RuntimeException(exc);
        }
    }
    public int getSchYear()
    {
        return sch_year;
    }
}
