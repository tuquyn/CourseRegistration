package student;

import course.CourseDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class StudentDao implements StudentServices{
    private Connection con;
    private String query;
    private PreparedStatement pst;
    private ResultSet rs;

    public StudentDao(Connection con) {
        this.con = con;
    }

    @Override
    public List<Student> listAllStudent() {
        List<Student> listAllStudent = new ArrayList<>();
        try {
            Student student = null;
            query = "select * from student";
            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();
            while(rs.next()){
                student = new Student(rs.getInt("StudentID"), rs.getString("StudentName"));
                listAllStudent.add(student);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CourseDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listAllStudent;
    }

    @Override
    public void addStudent(String StudentName) {
        try {
            query = "insert into student (studentName) values (?)";
            pst = this.con.prepareStatement(query);
            pst.setString(1, StudentName);
            pst.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(CourseDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void editStudent(Integer StudentID, String newStudentName) {
        try {
            query = "update student set studentName = ? where studentID = ?";
            pst = this.con.prepareStatement(query);
            pst.setString(1, newStudentName);
            pst.setInt( 2, StudentID);
            pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CourseDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void deleteStudent(Integer StudentID) {
        try {
            query = "delete from student where studentID = ?";
            pst = this.con.prepareStatement(query);
            pst.setInt( 1, StudentID);
            pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CourseDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String findStudentName(Integer StudentID) {
        String StudentName = null;
        try {
            query = "select studentName from student where studentID = ?";
            pst = this.con.prepareStatement(query);
            pst.setInt( 1, StudentID);
            rs = pst.executeQuery();
            if(rs.next()){
                StudentName = rs.getString("StudentName");
            }
        } catch (SQLException ex) {
            Logger.getLogger(CourseDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return StudentName;
    }
}
