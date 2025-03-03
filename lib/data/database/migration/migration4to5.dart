import 'package:floor/floor.dart';

final migration4to5 = Migration(4, 5, (database) async {
  // Step 1: Rename the original table
  await database.execute('ALTER TABLE semester_schedule RENAME TO semester_schedule_old');

  // Step 2: Create a new table with the composite primary key
  await database.execute('''
    CREATE TABLE IF NOT EXISTS semester_schedule (
      id TEXT NOT NULL,
      username TEXT NOT NULL,
      is_manually_add INTEGER NOT NULL,
      source TEXT NOT NULL,
      type TEXT NOT NULL,
      typename TEXT NOT NULL,
      exam_type TEXT NOT NULL,
      college_name TEXT NOT NULL,
      college_no TEXT NOT NULL,
      major_name TEXT NOT NULL,
      major_no TEXT NOT NULL,
      grade TEXT NOT NULL,
      name TEXT NOT NULL,
      course_no TEXT NOT NULL,
      teacher_no TEXT NOT NULL,
      teacher TEXT NOT NULL,
      term TEXT NOT NULL,
      term_name TEXT NOT NULL,
      course_id TEXT NOT NULL,
      capacity INTEGER NOT NULL,
      selected INTEGER NOT NULL,
      credits REAL NOT NULL,
      is_lab INTEGER NOT NULL,
      lab_lesson_id TEXT NOT NULL,
      batch INTEGER NOT NULL,
      assistant_no TEXT NOT NULL,
      comment TEXT NOT NULL,
      experiment TEXT NOT NULL,
      classroom TEXT NOT NULL,
      classroom_alias TEXT NOT NULL,
      classroom_id TEXT NOT NULL,
      start_week INTEGER NOT NULL,
      end_week INTEGER NOT NULL,
      odd_week INTEGER NOT NULL,
      weekday INTEGER NOT NULL,
      section INTEGER NOT NULL,
      create_time INTEGER NOT NULL,
      update_time INTEGER NOT NULL,
      PRIMARY KEY (id, username)
    )
  ''');

  // Step 3: Copy data from the old table to the new table
  await database.execute('''
    INSERT INTO semester_schedule (
      id, username, is_manually_add, source, type, typename, exam_type, college_name, college_no,
      major_name, major_no, grade, name, course_no, teacher_no, teacher, term, term_name, course_id,
      capacity, selected, credits, is_lab, lab_lesson_id, batch, assistant_no, comment, experiment,
      classroom, classroom_alias, classroom_id, start_week, end_week, odd_week, weekday, section,
      create_time, update_time
    )
    SELECT
      id, username, is_manually_add, source, type, typename, exam_type, college_name, college_no,
      major_name, major_no, grade, name, course_no, teacher_no, teacher, term, term_name, course_id,
      capacity, selected, credits, is_lab, lab_lesson_id, batch, assistant_no, comment, experiment,
      classroom, classroom_alias, classroom_id, start_week, end_week, odd_week, weekday, section,
      create_time, update_time
    FROM semester_schedule_old
  ''');

  // Step 4: Drop the old table
  await database.execute('DROP TABLE semester_schedule_old');

  await database.execute(
      'CREATE TABLE IF NOT EXISTS `exam_scores_new` (`id` INTEGER NOT NULL, `username` TEXT NOT NULL, `semester_id` INTEGER NOT NULL, `semester_name` TEXT NOT NULL, `course_code` TEXT NOT NULL, `course_name` TEXT NOT NULL, `course_name_en` TEXT NOT NULL, `lesson_code` TEXT NOT NULL, `lesson_name` TEXT NOT NULL, `minor_course_code` TEXT, `minor_course_name` TEXT, `minor_course_name_en` TEXT, `credits` REAL NOT NULL, `course_type` TEXT NOT NULL, `course_property` TEXT NOT NULL, `ga_grade` TEXT NOT NULL, `passed` INTEGER NOT NULL, `grade_detail` TEXT NOT NULL, `published` INTEGER NOT NULL, `compulsory` INTEGER NOT NULL, `unread` INTEGER NOT NULL, `create_time` INTEGER NOT NULL, `update_time` INTEGER NOT NULL, PRIMARY KEY (`id`, `username`))');

});
