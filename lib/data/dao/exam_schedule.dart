import 'dart:async';
import 'package:floor/floor.dart';
import 'package:guethub/data/model/exam_schedule/exam_schedule.dart';

@dao
abstract class ExamScheduleDao {

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertOrUpdate(
      ExamSchedule ExamScoresNew);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertOrUpdateAll(
      List<ExamSchedule> ExamScoresNews);

  @Query(
      'SELECT * FROM exam_schedule WHERE username = :username')
  Future<List<ExamSchedule>> getAllByUsername(String username);

  @Query('DELETE FROM exam_schedule WHERE username = :username')
  Future<void> deleteByUsername(String username);
}
