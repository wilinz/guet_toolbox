
import 'package:floor/floor.dart';
import 'package:guethub/data/model/student/student_info.dart';

@dao
abstract class StudentInfoDao {

  @Query('SELECT * FROM student_info WHERE student_id = :username LIMIT 1')
  Future<StudentInfo?> get(String username);

  @Query("SELECT * FROM student_info")
  Future<List<StudentInfo>> getAll();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertOrUpdate(StudentInfo info);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> update(StudentInfo info);

}