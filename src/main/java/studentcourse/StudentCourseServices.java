package studentcourse;

import course.Course;
import student.Student;

import java.util.List;

public interface StudentCourseServices {
    public List<Student> listAllStudent(Integer CourseID);
    public List<Course> listAllCourse(Integer StudentID);
    public void addStudentCourse(Integer StudentID, Integer CourseID);
    public void removeStudentCourse(Integer StudentID, Integer CourseID);
}
