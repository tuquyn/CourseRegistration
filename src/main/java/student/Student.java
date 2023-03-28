package student;

public class Student {
    private int StudentID;
    private String StudentName;

    public Student(){

    }

    public Student(int studentID, String studentName) {
        StudentID = studentID;
        StudentName = studentName;
    }

    public int getStudentID() {
        return StudentID;
    }

    public void setStudentID(int studentID) {
        StudentID = studentID;
    }

    public String getStudentName() {
        return StudentName;
    }

    public void setStudentName(String studentName) {
        StudentName = studentName;
    }

    @Override
    public String toString() {
        return "Student{" +
                "StudentID=" + StudentID +
                ", StudentName='" + StudentName + '\'' +
                '}';
    }
}
