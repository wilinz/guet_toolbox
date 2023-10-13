import 'dart:async';
import 'package:floor/floor.dart';
import 'package:guettoolbox/data/model/course/semester_schedule.dart';

@dao
abstract class SemesterScheduleDao {
  @Query('SELECT * FROM semester_schedule')
  Future<List<SemesterSchedule>> getAll();

  @Query('SELECT * FROM semester_schedule WHERE term = :term')
  Future<List<SemesterSchedule>> getAllByTerm(String term);

  @Query('SELECT * FROM semester_schedule WHERE id = :id and username = :username')
  Future<SemesterSchedule?> find(String id, String username);

  @Query('DELETE * FROM semester_schedule WHERE id NOT IN (:ids)')
  Future<SemesterSchedule?> deleteNotIn(List<String> ids);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertOrUpdateSemesterSchedule(SemesterSchedule semesterSchedule);

}