import 'dart:async';
import 'package:floor/floor.dart';
import 'package:guethub/data/model/course/semester_schedule.dart';

@dao
abstract class SemesterScheduleDao {
  @Query('SELECT * FROM semester_schedule')
  Future<List<SemesterSchedule>> getAll();

  @Query(
      'SELECT * FROM semester_schedule WHERE term = :term AND username = :username')
  Future<List<SemesterSchedule>> getAllByTermAndUsername(String term, String username);

  @Query(
      'SELECT * FROM semester_schedule WHERE id = :id and username = :username')
  Future<SemesterSchedule?> find(String id, String username);

  @Query('DELETE FROM semester_schedule WHERE id NOT IN (:ids)')
  Future<SemesterSchedule?> deleteNotIn(List<String> ids);

  @Query('DELETE FROM semester_schedule WHERE username = :username AND source NOT IN (:excludeSources) AND term = :term')
  Future<void> deleteByUsernameAndSourceAndTerm(String username, List<String> excludeSources, String term);

  @delete
  Future<void> deleteData(SemesterSchedule data);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertOrUpdateSemesterSchedule(
      SemesterSchedule semesterSchedule);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertOrUpdateSemesterSchedules(
      List<SemesterSchedule> semesterSchedules);
}
