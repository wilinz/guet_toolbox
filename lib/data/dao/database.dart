import 'dart:async';
import 'package:floor/floor.dart';
import 'package:guettoolbox/data/dao/datetime_converter.dart';
import 'package:guettoolbox/data/dao/schedule.dart';
import 'package:guettoolbox/data/dao/user.dart';
import 'package:guettoolbox/data/model/course/semester_schedule.dart';
import 'package:guettoolbox/data/model/term/term.dart';
import 'package:guettoolbox/data/model/user/user.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart'; // the generated code will be there

@TypeConverters([DateTimeConverter, DateTimeNullableConverter])
@Database(version: 1, entities: [SemesterSchedule, User, Term])
abstract class AppDatabase extends FloorDatabase {
  SemesterScheduleDao get semesterScheduleDao;

  UserDao get userDao;
}

Future<AppDatabase> getDatabase() =>
    $FloorAppDatabase.databaseBuilder('app_database.db').build();
