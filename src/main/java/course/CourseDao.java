package course;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class CourseDao implements  CourseServices{
    private Connection con;
    private String query;
    private PreparedStatement pst;
    private ResultSet rs;

    public CourseDao(Connection con) {
        this.con = con;
    }

    @Override
    public List<Course> listAllCourse(){
        List<Course> listAllCourse = new ArrayList<>();
        try {
            Course course = null;
            query = "select * from course";
            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();
            while(rs.next()){
                course = new Course(rs.getInt("CourseID"), rs.getString("CourseName"));
                listAllCourse.add(course);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CourseDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listAllCourse;
    }

    @Override
    public void addCourse(String CourseName) {
        try {
            query = "insert into course (courseName) values (?)";
            pst = this.con.prepareStatement(query);
            pst.setString( 1, CourseName);
            pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CourseDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void editCourse(Integer CourseID, String newCourseName) {
        try {
            query = "update course set courseName = ? where courseID = ?";
            pst = this.con.prepareStatement(query);
            pst.setString(1, newCourseName);
            pst.setInt( 2, CourseID);
            pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CourseDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void deleteCourse(Integer CourseID) {
        try {
            query = "delete from course where CourseID = ?";
            pst = this.con.prepareStatement(query);
            pst.setInt( 1, CourseID);
            pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CourseDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public int findCourseID(String CourseName) {
        Integer CourseID = null;
        try {
            query = "select courseID from course where courseName = ?";
            pst = this.con.prepareStatement(query);
            pst.setString(1,CourseName);
            rs = pst.executeQuery();
            if(rs.next()){
                CourseID = rs.getInt("CourseID");
            }
        } catch (SQLException ex) {
            Logger.getLogger(CourseDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return CourseID;
    }
}
