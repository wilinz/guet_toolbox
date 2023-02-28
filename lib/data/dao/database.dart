import 'dart:async';
import 'package:floor/floor.dart';
import 'package:guettoolbox/data/dao/schedule.dart';
import 'package:guettoolbox/data/model/index.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [SemesterSchedule])
abstract class AppDatabase extends FloorDatabase {
  SemesterScheduleDao get semesterScheduleDao;
}

Future<AppDatabase> getDatabase() => $FloorAppDatabase.databaseBuilder('app_database.db').build();
