package course;

import java.util.List;

public interface CourseServices {
    public List<Course> listAllCourse();
    public void addCourse(String CourseName);
    public void editCourse(Integer CourseID, String newCourseName);
    public void deleteCourse(Integer CourseID);
    public int findCourseID(String CourseName);
}
