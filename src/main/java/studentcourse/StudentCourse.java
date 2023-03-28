package studentcourse;

public class StudentCourse {
    private int StudentID;
    private int CourseID;

    public StudentCourse() {
    }

    public StudentCourse(int studentID, int courseID) {
        StudentID = studentID;
        CourseID = courseID;
    }

    public int getStudentID() {
        return StudentID;
    }

    public void setStudentID(int studentID) {
        StudentID = studentID;
    }

    public int getCourseID() {
        return CourseID;
    }

    public void setCourseID(int courseID) {
        CourseID = courseID;
    }

    @Override
    public String toString() {
        return "StudentCourse{" +
                "StudentID=" + StudentID +
                ", CourseID=" + CourseID +
                '}';
    }
}
