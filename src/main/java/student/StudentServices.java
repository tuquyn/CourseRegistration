package student;

import java.util.List;

public interface StudentServices {
    public List<Student> listAllStudent();
    public void addStudent(String StudentName);
    public void editStudent(Integer StudentID, String newStudentName);
    public void deleteStudent(Integer StudentID);
    public String findStudentName(Integer StudentID);
}
