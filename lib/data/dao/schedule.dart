import 'dart:async';
import 'package:floor/floor.dart';
import 'package:guettoolbox/data/model/semester_schedule.dart';

@dao
abstract class SemesterScheduleDao {
  @Query('SELECT * FROM semester_schedule')
  Future<List<SemesterSchedule>> getAll();

  @Query('SELECT * FROM semester_schedule WHERE id = :id')
  Future<SemesterSchedule?> findById(String id);

  @Query('DELETE * FROM semester_schedule WHERE id NOT IN (:ids)')
  Future<SemesterSchedule?> deleteNotIn(List<String> ids);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertSemesterSchedule(SemesterSchedule semesterSchedule);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateSemesterSchedule(SemesterSchedule semesterSchedule);

}