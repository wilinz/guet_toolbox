// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  SemesterScheduleDao? _semesterScheduleDaoInstance;

  UserDao? _userDaoInstance;

  TermDao? _termDaoInstance;

  StudentInfoDao? _studentInfoDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `semester_schedule` (`id` TEXT NOT NULL, `username` TEXT NOT NULL, `is_manually_add` INTEGER NOT NULL, `type` TEXT NOT NULL, `typename` TEXT NOT NULL, `exam_type` TEXT NOT NULL, `college_name` TEXT NOT NULL, `college_no` TEXT NOT NULL, `major_name` TEXT NOT NULL, `major_no` TEXT NOT NULL, `grade` TEXT NOT NULL, `name` TEXT NOT NULL, `course_no` TEXT NOT NULL, `teacher_no` TEXT NOT NULL, `teacher` TEXT NOT NULL, `term` TEXT NOT NULL, `course_id` TEXT NOT NULL, `capacity` INTEGER NOT NULL, `selected` INTEGER NOT NULL, `credits` REAL NOT NULL, `is_lab` INTEGER NOT NULL, `lab_lesson_id` TEXT NOT NULL, `batch` INTEGER NOT NULL, `assistant_no` TEXT NOT NULL, `comment` TEXT NOT NULL, `experiment` TEXT NOT NULL, `classroom` TEXT NOT NULL, `classroom_alias` TEXT NOT NULL, `classroom_id` TEXT NOT NULL, `start_week` INTEGER NOT NULL, `end_week` INTEGER NOT NULL, `odd_week` INTEGER NOT NULL, `weekday` INTEGER NOT NULL, `section` INTEGER NOT NULL, `create_time` INTEGER NOT NULL, `update_time` INTEGER NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `users` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `username` TEXT NOT NULL, `password` TEXT NOT NULL, `is_active` INTEGER NOT NULL, `create_time` INTEGER NOT NULL, `update_time` INTEGER NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `student_info` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `term` TEXT NOT NULL, `grade` TEXT NOT NULL, `college_no` TEXT NOT NULL, `college_name` TEXT NOT NULL, `major_no` TEXT NOT NULL, `major_name` TEXT NOT NULL, `student_id` TEXT NOT NULL, `name` TEXT NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `terms` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `term` TEXT NOT NULL, `start_date` INTEGER NOT NULL, `end_date` INTEGER NOT NULL, `week_num` INTEGER NOT NULL, `term_name` TEXT NOT NULL, `school_year` INTEGER NOT NULL, `comment` TEXT NOT NULL)');
        await database.execute(
            'CREATE UNIQUE INDEX `index_users_username` ON `users` (`username`)');
        await database.execute(
            'CREATE UNIQUE INDEX `index_student_info_student_id` ON `student_info` (`student_id`)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  SemesterScheduleDao get semesterScheduleDao {
    return _semesterScheduleDaoInstance ??=
        _$SemesterScheduleDao(database, changeListener);
  }

  @override
  UserDao get userDao {
    return _userDaoInstance ??= _$UserDao(database, changeListener);
  }

  @override
  TermDao get termDao {
    return _termDaoInstance ??= _$TermDao(database, changeListener);
  }

  @override
  StudentInfoDao get studentInfoDao {
    return _studentInfoDaoInstance ??=
        _$StudentInfoDao(database, changeListener);
  }
}

class _$SemesterScheduleDao extends SemesterScheduleDao {
  _$SemesterScheduleDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _semesterScheduleInsertionAdapter = InsertionAdapter(
            database,
            'semester_schedule',
            (SemesterSchedule item) => <String, Object?>{
                  'id': item.id,
                  'username': item.username,
                  'is_manually_add': item.isManuallyAdd ? 1 : 0,
                  'type': item.type,
                  'typename': item.typename,
                  'exam_type': item.examType,
                  'college_name': item.collegeName,
                  'college_no': item.collegeNo,
                  'major_name': item.majorName,
                  'major_no': item.majorNo,
                  'grade': item.grade,
                  'name': item.name,
                  'course_no': item.courseNo,
                  'teacher_no': item.teacherNo,
                  'teacher': item.teacher,
                  'term': item.term,
                  'course_id': item.courseId,
                  'capacity': item.capacity,
                  'selected': item.selected,
                  'credits': item.credits,
                  'is_lab': item.isLab ? 1 : 0,
                  'lab_lesson_id': item.labLessonId,
                  'batch': item.batch,
                  'assistant_no': item.assistantNo,
                  'comment': item.comment,
                  'experiment': item.experiment,
                  'classroom': item.classroom,
                  'classroom_alias': item.classroomAlias,
                  'classroom_id': item.classroomId,
                  'start_week': item.startWeek,
                  'end_week': item.endWeek,
                  'odd_week': item.oddWeek ? 1 : 0,
                  'weekday': item.weekday,
                  'section': item.section,
                  'create_time': _dateTimeConverter.encode(item.createTime),
                  'update_time': _dateTimeConverter.encode(item.updateTime)
                }),
        _semesterScheduleUpdateAdapter = UpdateAdapter(
            database,
            'semester_schedule',
            ['id'],
            (SemesterSchedule item) => <String, Object?>{
                  'id': item.id,
                  'username': item.username,
                  'is_manually_add': item.isManuallyAdd ? 1 : 0,
                  'type': item.type,
                  'typename': item.typename,
                  'exam_type': item.examType,
                  'college_name': item.collegeName,
                  'college_no': item.collegeNo,
                  'major_name': item.majorName,
                  'major_no': item.majorNo,
                  'grade': item.grade,
                  'name': item.name,
                  'course_no': item.courseNo,
                  'teacher_no': item.teacherNo,
                  'teacher': item.teacher,
                  'term': item.term,
                  'course_id': item.courseId,
                  'capacity': item.capacity,
                  'selected': item.selected,
                  'credits': item.credits,
                  'is_lab': item.isLab ? 1 : 0,
                  'lab_lesson_id': item.labLessonId,
                  'batch': item.batch,
                  'assistant_no': item.assistantNo,
                  'comment': item.comment,
                  'experiment': item.experiment,
                  'classroom': item.classroom,
                  'classroom_alias': item.classroomAlias,
                  'classroom_id': item.classroomId,
                  'start_week': item.startWeek,
                  'end_week': item.endWeek,
                  'odd_week': item.oddWeek ? 1 : 0,
                  'weekday': item.weekday,
                  'section': item.section,
                  'create_time': _dateTimeConverter.encode(item.createTime),
                  'update_time': _dateTimeConverter.encode(item.updateTime)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<SemesterSchedule> _semesterScheduleInsertionAdapter;

  final UpdateAdapter<SemesterSchedule> _semesterScheduleUpdateAdapter;

  @override
  Future<List<SemesterSchedule>> getAll() async {
    return _queryAdapter.queryList('SELECT * FROM semester_schedule',
        mapper: (Map<String, Object?> row) => SemesterSchedule(
            id: row['id'] as String,
            username: row['username'] as String,
            isManuallyAdd: (row['is_manually_add'] as int) != 0,
            updateTime: _dateTimeConverter.decode(row['update_time'] as int),
            type: row['type'] as String,
            typename: row['typename'] as String,
            examType: row['exam_type'] as String,
            collegeName: row['college_name'] as String,
            collegeNo: row['college_no'] as String,
            majorName: row['major_name'] as String,
            majorNo: row['major_no'] as String,
            grade: row['grade'] as String,
            name: row['name'] as String,
            courseNo: row['course_no'] as String,
            teacherNo: row['teacher_no'] as String,
            teacher: row['teacher'] as String,
            term: row['term'] as String,
            courseId: row['course_id'] as String,
            capacity: row['capacity'] as int,
            selected: row['selected'] as int,
            credits: row['credits'] as double,
            isLab: (row['is_lab'] as int) != 0,
            labLessonId: row['lab_lesson_id'] as String,
            batch: row['batch'] as int,
            assistantNo: row['assistant_no'] as String,
            startWeek: row['start_week'] as int,
            endWeek: row['end_week'] as int,
            oddWeek: (row['odd_week'] as int) != 0,
            weekday: row['weekday'] as int,
            section: row['section'] as int,
            experiment: row['experiment'] as String,
            classroom: row['classroom'] as String,
            classroomAlias: row['classroom_alias'] as String,
            classroomId: row['classroom_id'] as String,
            comment: row['comment'] as String));
  }

  @override
  Future<List<SemesterSchedule>> getAllByTerm(String term) async {
    return _queryAdapter.queryList(
        'SELECT * FROM semester_schedule WHERE term = ?1',
        mapper: (Map<String, Object?> row) => SemesterSchedule(
            id: row['id'] as String,
            username: row['username'] as String,
            isManuallyAdd: (row['is_manually_add'] as int) != 0,
            updateTime: _dateTimeConverter.decode(row['update_time'] as int),
            type: row['type'] as String,
            typename: row['typename'] as String,
            examType: row['exam_type'] as String,
            collegeName: row['college_name'] as String,
            collegeNo: row['college_no'] as String,
            majorName: row['major_name'] as String,
            majorNo: row['major_no'] as String,
            grade: row['grade'] as String,
            name: row['name'] as String,
            courseNo: row['course_no'] as String,
            teacherNo: row['teacher_no'] as String,
            teacher: row['teacher'] as String,
            term: row['term'] as String,
            courseId: row['course_id'] as String,
            capacity: row['capacity'] as int,
            selected: row['selected'] as int,
            credits: row['credits'] as double,
            isLab: (row['is_lab'] as int) != 0,
            labLessonId: row['lab_lesson_id'] as String,
            batch: row['batch'] as int,
            assistantNo: row['assistant_no'] as String,
            startWeek: row['start_week'] as int,
            endWeek: row['end_week'] as int,
            oddWeek: (row['odd_week'] as int) != 0,
            weekday: row['weekday'] as int,
            section: row['section'] as int,
            experiment: row['experiment'] as String,
            classroom: row['classroom'] as String,
            classroomAlias: row['classroom_alias'] as String,
            classroomId: row['classroom_id'] as String,
            comment: row['comment'] as String),
        arguments: [term]);
  }

  @override
  Future<SemesterSchedule?> find(
    String id,
    String username,
  ) async {
    return _queryAdapter.query(
        'SELECT * FROM semester_schedule WHERE id = ?1 and username = ?2',
        mapper: (Map<String, Object?> row) => SemesterSchedule(
            id: row['id'] as String,
            username: row['username'] as String,
            isManuallyAdd: (row['is_manually_add'] as int) != 0,
            updateTime: _dateTimeConverter.decode(row['update_time'] as int),
            type: row['type'] as String,
            typename: row['typename'] as String,
            examType: row['exam_type'] as String,
            collegeName: row['college_name'] as String,
            collegeNo: row['college_no'] as String,
            majorName: row['major_name'] as String,
            majorNo: row['major_no'] as String,
            grade: row['grade'] as String,
            name: row['name'] as String,
            courseNo: row['course_no'] as String,
            teacherNo: row['teacher_no'] as String,
            teacher: row['teacher'] as String,
            term: row['term'] as String,
            courseId: row['course_id'] as String,
            capacity: row['capacity'] as int,
            selected: row['selected'] as int,
            credits: row['credits'] as double,
            isLab: (row['is_lab'] as int) != 0,
            labLessonId: row['lab_lesson_id'] as String,
            batch: row['batch'] as int,
            assistantNo: row['assistant_no'] as String,
            startWeek: row['start_week'] as int,
            endWeek: row['end_week'] as int,
            oddWeek: (row['odd_week'] as int) != 0,
            weekday: row['weekday'] as int,
            section: row['section'] as int,
            experiment: row['experiment'] as String,
            classroom: row['classroom'] as String,
            classroomAlias: row['classroom_alias'] as String,
            classroomId: row['classroom_id'] as String,
            comment: row['comment'] as String),
        arguments: [id, username]);
  }

  @override
  Future<SemesterSchedule?> deleteNotIn(List<String> ids) async {
    const offset = 1;
    final _sqliteVariablesForIds =
        Iterable<String>.generate(ids.length, (i) => '?${i + offset}')
            .join(',');
    return _queryAdapter.query(
        'DELETE * FROM semester_schedule WHERE id NOT IN (' +
            _sqliteVariablesForIds +
            ')',
        mapper: (Map<String, Object?> row) => SemesterSchedule(
            id: row['id'] as String,
            username: row['username'] as String,
            isManuallyAdd: (row['is_manually_add'] as int) != 0,
            updateTime: _dateTimeConverter.decode(row['update_time'] as int),
            type: row['type'] as String,
            typename: row['typename'] as String,
            examType: row['exam_type'] as String,
            collegeName: row['college_name'] as String,
            collegeNo: row['college_no'] as String,
            majorName: row['major_name'] as String,
            majorNo: row['major_no'] as String,
            grade: row['grade'] as String,
            name: row['name'] as String,
            courseNo: row['course_no'] as String,
            teacherNo: row['teacher_no'] as String,
            teacher: row['teacher'] as String,
            term: row['term'] as String,
            courseId: row['course_id'] as String,
            capacity: row['capacity'] as int,
            selected: row['selected'] as int,
            credits: row['credits'] as double,
            isLab: (row['is_lab'] as int) != 0,
            labLessonId: row['lab_lesson_id'] as String,
            batch: row['batch'] as int,
            assistantNo: row['assistant_no'] as String,
            startWeek: row['start_week'] as int,
            endWeek: row['end_week'] as int,
            oddWeek: (row['odd_week'] as int) != 0,
            weekday: row['weekday'] as int,
            section: row['section'] as int,
            experiment: row['experiment'] as String,
            classroom: row['classroom'] as String,
            classroomAlias: row['classroom_alias'] as String,
            classroomId: row['classroom_id'] as String,
            comment: row['comment'] as String),
        arguments: [...ids]);
  }

  @override
  Future<void> insertSemesterSchedule(SemesterSchedule semesterSchedule) async {
    await _semesterScheduleInsertionAdapter.insert(
        semesterSchedule, OnConflictStrategy.replace);
  }

  @override
  Future<void> updateSemesterSchedule(SemesterSchedule semesterSchedule) async {
    await _semesterScheduleUpdateAdapter.update(
        semesterSchedule, OnConflictStrategy.replace);
  }
}

class _$UserDao extends UserDao {
  _$UserDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _userInsertionAdapter = InsertionAdapter(
            database,
            'users',
            (User item) => <String, Object?>{
                  'id': item.id,
                  'username': item.username,
                  'password': item.password,
                  'is_active': item.isActive ? 1 : 0,
                  'create_time': _dateTimeConverter.encode(item.createTime),
                  'update_time': _dateTimeConverter.encode(item.updateTime)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<User> _userInsertionAdapter;

  @override
  Future<User?> getActive() async {
    return _queryAdapter.query(
        'SELECT * FROM users WHERE is_active = 1 LIMIT 1',
        mapper: (Map<String, Object?> row) => User(
            updateTime: _dateTimeConverter.decode(row['update_time'] as int),
            createTime:
                _dateTimeNullableConverter.decode(row['create_time'] as int?),
            username: row['username'] as String,
            password: row['password'] as String,
            isActive: (row['is_active'] as int) != 0));
  }

  @override
  Future<User?> get(String username) async {
    return _queryAdapter.query(
        'SELECT * FROM users WHERE username = ?1 LIMIT 1',
        mapper: (Map<String, Object?> row) => User(
            updateTime: _dateTimeConverter.decode(row['update_time'] as int),
            createTime:
                _dateTimeNullableConverter.decode(row['create_time'] as int?),
            username: row['username'] as String,
            password: row['password'] as String,
            isActive: (row['is_active'] as int) != 0),
        arguments: [username]);
  }

  @override
  Future<List<User>> getRecent() async {
    return _queryAdapter.queryList(
        'SELECT * FROM users ORDER BY update_time DESC LIMIT 5',
        mapper: (Map<String, Object?> row) => User(
            updateTime: _dateTimeConverter.decode(row['update_time'] as int),
            createTime:
                _dateTimeNullableConverter.decode(row['create_time'] as int?),
            username: row['username'] as String,
            password: row['password'] as String,
            isActive: (row['is_active'] as int) != 0));
  }

  @override
  Future<List<User>> searchUsers(String keyword) async {
    return _queryAdapter.queryList('SELECT * FROM users WHERE username LIKE ?1',
        mapper: (Map<String, Object?> row) => User(
            updateTime: _dateTimeConverter.decode(row['update_time'] as int),
            createTime:
                _dateTimeNullableConverter.decode(row['create_time'] as int?),
            username: row['username'] as String,
            password: row['password'] as String,
            isActive: (row['is_active'] as int) != 0),
        arguments: [keyword]);
  }

  @override
  Future<List<User>> getAll() async {
    return _queryAdapter.queryList('SELECT * FROM users',
        mapper: (Map<String, Object?> row) => User(
            updateTime: _dateTimeConverter.decode(row['update_time'] as int),
            createTime:
                _dateTimeNullableConverter.decode(row['create_time'] as int?),
            username: row['username'] as String,
            password: row['password'] as String,
            isActive: (row['is_active'] as int) != 0));
  }

  @override
  Future<void> offlineOtherUser(String username) async {
    await _queryAdapter.queryNoReturn(
        'UPDATE users SET is_active = 0 WHERE username <> ?1',
        arguments: [username]);
  }

  @override
  Future<void> insertUser(User user) async {
    await _userInsertionAdapter.insert(user, OnConflictStrategy.replace);
  }

  @override
  Future<void> updateUser(User user) async {
    await _userInsertionAdapter.insert(user, OnConflictStrategy.replace);
  }
}

class _$TermDao extends TermDao {
  _$TermDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _termInsertionAdapter = InsertionAdapter(
            database,
            'terms',
            (Term item) => <String, Object?>{
                  'id': item.id,
                  'term': item.term,
                  'start_date': _dateTimeConverter.encode(item.startDate),
                  'end_date': _dateTimeConverter.encode(item.endDate),
                  'week_num': item.weekNum,
                  'term_name': item.termName,
                  'school_year': item.schoolYear,
                  'comment': item.comment
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Term> _termInsertionAdapter;

  @override
  Future<List<Term>> getAll() async {
    return _queryAdapter.queryList('SELECT * FROM terms',
        mapper: (Map<String, Object?> row) => Term(
            term: row['term'] as String,
            startDate: _dateTimeConverter.decode(row['start_date'] as int),
            endDate: _dateTimeConverter.decode(row['end_date'] as int),
            weekNum: row['week_num'] as int,
            termName: row['term_name'] as String,
            schoolYear: row['school_year'] as int,
            comment: row['comment'] as String));
  }

  @override
  Future<void> insert(Term term) async {
    await _termInsertionAdapter.insert(term, OnConflictStrategy.fail);
  }

  @override
  Future<void> insertAll(List<Term> terms) async {
    await _termInsertionAdapter.insertList(terms, OnConflictStrategy.fail);
  }

  @override
  Future<void> update(Term term) async {
    await _termInsertionAdapter.insert(term, OnConflictStrategy.fail);
  }
}

class _$StudentInfoDao extends StudentInfoDao {
  _$StudentInfoDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _studentInfoInsertionAdapter = InsertionAdapter(
            database,
            'student_info',
            (StudentInfo item) => <String, Object?>{
                  'id': item.id,
                  'term': item.term,
                  'grade': item.grade,
                  'college_no': item.collegeNo,
                  'college_name': item.collegeName,
                  'major_no': item.majorNo,
                  'major_name': item.majorName,
                  'student_id': item.studentId,
                  'name': item.name
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<StudentInfo> _studentInfoInsertionAdapter;

  @override
  Future<StudentInfo?> get(String username) async {
    return _queryAdapter.query(
        'SELECT * FROM student_info WHERE student_id = ?1 LIMIT 1',
        mapper: (Map<String, Object?> row) => StudentInfo(
            term: row['term'] as String,
            grade: row['grade'] as String,
            collegeNo: row['college_no'] as String,
            collegeName: row['college_name'] as String,
            majorNo: row['major_no'] as String,
            majorName: row['major_name'] as String,
            studentId: row['student_id'] as String,
            name: row['name'] as String),
        arguments: [username]);
  }

  @override
  Future<List<StudentInfo>> getAll() async {
    return _queryAdapter.queryList('SELECT * FROM student_info',
        mapper: (Map<String, Object?> row) => StudentInfo(
            term: row['term'] as String,
            grade: row['grade'] as String,
            collegeNo: row['college_no'] as String,
            collegeName: row['college_name'] as String,
            majorNo: row['major_no'] as String,
            majorName: row['major_name'] as String,
            studentId: row['student_id'] as String,
            name: row['name'] as String));
  }

  @override
  Future<void> insert(StudentInfo info) async {
    await _studentInfoInsertionAdapter.insert(info, OnConflictStrategy.replace);
  }

  @override
  Future<void> update(StudentInfo info) async {
    await _studentInfoInsertionAdapter.insert(info, OnConflictStrategy.replace);
  }
}

// ignore_for_file: unused_element
final _dateTimeConverter = DateTimeConverter();
final _dateTimeNullableConverter = DateTimeNullableConverter();
