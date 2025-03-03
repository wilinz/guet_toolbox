import 'package:dart_extensions/dart_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:guethub/data/database/database.dart';
import 'package:guethub/data/model/course/semester_schedule.dart';
import 'package:guethub/data/repository/course.dart';
import 'package:guethub/data/repository/user.dart';
import 'package:guethub/ui/util/toast.dart';
import 'package:guethub/util/time.dart';
import 'package:kt_dart/kt.dart';

class FieldKeys {
  static const String termName = 'termName';
  static const String startWeek = 'startWeek';
  static const String endWeek = 'endWeek';
  static const String startTime = 'startTime';
  static const String endTime = 'endTime';
  static const String weekday = 'weekday';
  static const String section = 'section';
  static const String courseNo = 'courseNo';
  static const String courseName = 'courseName';
  static const String teacher = 'teacher';
  static const String classroom = 'classroom';
  static const String classroomAlias = 'classroomAlias';
  static const String credits = 'credits';
  static const String comment = 'comment';
  static const String examType = 'examType';
  static const String courseType = 'courseType';
  static const String courseTypename = 'courseTypename';
  static const String capacity = 'capacity';
  static const String selected = 'selected';
  static const String collegeName = 'collegeName';
  static const String majorName = 'majorName';
  static const String grade = 'grade';
  static const String isLab = 'isLab';
  static const String batch = 'batch';
  static const String experiment = 'experiment';
  static const String experimentNo = 'experiment_no';
}

class AddCourseController extends GetxController {
  // 用 Map 管理布尔值字段
  final Map<String, RxBool> boolFields = {
    FieldKeys.isLab: false.obs, // 示例布尔值字段
  };

  // 用 Map 管理所有的 TextEditingController
  final Map<String, TextEditingController> controllers = {
    FieldKeys.termName: TextEditingController(),
    FieldKeys.startWeek: TextEditingController(),
    FieldKeys.endWeek: TextEditingController(),
    FieldKeys.startTime: TextEditingController(),
    FieldKeys.endTime: TextEditingController(),
    FieldKeys.weekday: TextEditingController(),
    FieldKeys.section: TextEditingController(),
    FieldKeys.courseNo: TextEditingController(),
    FieldKeys.courseName: TextEditingController(),
    FieldKeys.teacher: TextEditingController(),
    FieldKeys.classroom: TextEditingController(),
    FieldKeys.credits: TextEditingController(),
    FieldKeys.comment: TextEditingController(),
    FieldKeys.examType: TextEditingController(),
    FieldKeys.courseType: TextEditingController(),
    FieldKeys.courseTypename: TextEditingController(),
    FieldKeys.capacity: TextEditingController(),
    FieldKeys.selected: TextEditingController(),
    FieldKeys.collegeName: TextEditingController(),
    FieldKeys.majorName: TextEditingController(),
    FieldKeys.grade: TextEditingController(),
    FieldKeys.batch: TextEditingController(),
    FieldKeys.experiment: TextEditingController(),
    FieldKeys.experimentNo: TextEditingController(),
    FieldKeys.classroomAlias: TextEditingController(),
  };

  String? validateField(String key, String value) {
    switch (key) {
      case FieldKeys.courseName:
        return value.isNotBlank ? null : '课程名称不能为空';
      case FieldKeys.courseNo:
        return value.isNotBlank ? null : '课号不能为空';
      case FieldKeys.startWeek:
      case FieldKeys.endWeek:
        final week = int.tryParse(value);
        if (key == FieldKeys.startWeek) {
          return week != null && week > 0 ? null : '开始周必须是正整数';
        }
        if (key == FieldKeys.endWeek) {
          final startWeek =
              int.tryParse(controllers[FieldKeys.startWeek]?.text ?? '');
          return week != null &&
                  week > 0 &&
                  (startWeek == null || week >= startWeek)
              ? null
              : '结束周必须是正整数，且不得小于开始周';
        }
        break;
      case FieldKeys.weekday:
        final weekday = int.tryParse(value);
        return weekday != null && (weekday >= 1 && weekday <= 7)
            ? null
            : '星期应该为1~7之间';
      case FieldKeys.section:
        final section = int.tryParse(value);
        return section != null && (section >= 1 && section <= 5)
            ? null
            : '节次应该为1~5之间';
      case FieldKeys.batch:
        final batch = int.tryParse(value);
        return batch != null ? null : '批次应该为整数';
      case FieldKeys.capacity:
        final capacity = int.tryParse(value);
        return capacity != null && capacity >= 0 ? null : '容量应该为整数且大于等于0';
      case FieldKeys.selected:
        final selected = int.tryParse(value);
        return selected != null && selected >= 0 ? null : '已选人数应该为整数且大于等于0';
      case FieldKeys.credits:
        final credits = double.tryParse(value);
        return credits != null && credits >= 0 ? null : '学分应该大于等于0';
      case FieldKeys.startTime:
      case FieldKeys.endTime:
        final time = ExtendedTimeOfDay.tryParse(value);
        if (key == FieldKeys.startTime) {
          return time != null ? null : '请检查格式，示例：08:00';
        }
        if (key == FieldKeys.endTime) {
          final startTime = ExtendedTimeOfDay.tryParse(
              controllers[FieldKeys.startTime]?.text ?? '');
          return time != null && (startTime == null || time >= startTime)
              ? null
              : '请检查格式，示例：10:00，且结束时间不得小于开始时间';
        }
      case FieldKeys.teacher:
        return null;
      case FieldKeys.classroomAlias:
        return null;
      default:
        return null;
    }
    return null;
  }

  // 验证整个表单
  bool isFormValid() {
    bool isValid = true;
    controllers.forEach((key, controller) {
      final error = validateField(key, controller.text);
      if (error != null) {
        isValid = false;
      }
    });
    return isValid;
  }

  // 用 Map 来存储每个字段的标签名
  final Map<String, String> fieldLabels = {
    FieldKeys.courseName: '课程名称*',
    FieldKeys.teacher: '教师',
    FieldKeys.credits: '学分',
    FieldKeys.startWeek: '开始周',
    FieldKeys.endWeek: '结束周',
    FieldKeys.startTime: '开始时间',
    FieldKeys.endTime: '结束时间',
    FieldKeys.weekday: '星期几',
    FieldKeys.section: '节次（大节）',
    FieldKeys.classroom: '教室',
    FieldKeys.courseType: '课程类型',
    FieldKeys.courseTypename: '类型名称',
    FieldKeys.courseNo: '课号*',
    FieldKeys.capacity: '容量',
    FieldKeys.selected: '已选人数',
    FieldKeys.collegeName: '学院名称',
    FieldKeys.majorName: '专业名称',
    FieldKeys.grade: '年级',
    FieldKeys.termName: '学期名称',
    FieldKeys.examType: '考试类型',
    FieldKeys.isLab: '是否实验课',
    FieldKeys.batch: '实验批次',
    FieldKeys.experiment: '实验名称',
    FieldKeys.experimentNo: '实验批次号',
    FieldKeys.classroomAlias: '教室别名',
    FieldKeys.comment: '备注',
  };

  final Map<String, TextInputType> inputTypes = {
    FieldKeys.termName: TextInputType.text,
    FieldKeys.startWeek: TextInputType.number,
    FieldKeys.endWeek: TextInputType.number,
    FieldKeys.startTime: TextInputType.text,
    FieldKeys.endTime: TextInputType.text,
    FieldKeys.weekday: TextInputType.number,
    FieldKeys.section: TextInputType.number,
    FieldKeys.courseNo: TextInputType.text,
    FieldKeys.courseName: TextInputType.text,
    FieldKeys.teacher: TextInputType.text,
    FieldKeys.classroom: TextInputType.text,
    FieldKeys.credits: TextInputType.number,
    FieldKeys.comment: TextInputType.text,
    FieldKeys.examType: TextInputType.text,
    FieldKeys.courseType: TextInputType.text,
    FieldKeys.courseTypename: TextInputType.text,
    FieldKeys.capacity: TextInputType.number,
    FieldKeys.selected: TextInputType.number,
    FieldKeys.collegeName: TextInputType.text,
    FieldKeys.majorName: TextInputType.text,
    FieldKeys.grade: TextInputType.text,
    FieldKeys.batch: TextInputType.number,
    FieldKeys.experiment: TextInputType.text,
    FieldKeys.experimentNo: TextInputType.text,
    FieldKeys.classroomAlias: TextInputType.text,
  };

  bool isReadOnly(String key) {
    switch (key) {
      case FieldKeys.termName: // 使用 FieldKeys 中的常量
        return true;
      default:
        return false;
    }
  }

  final SemesterSchedule semesterSchedule;
  SemesterSchedule? initSemesterSchedule;
  final formKey = GlobalKey<FormState>();

  AddCourseController(this.semesterSchedule);

  @override
  Future<void> onInit() async {
    super.onInit();
    // Initialize all TextEditingControllers with values from semesterSchedule
    controllers[FieldKeys.termName]?.text = semesterSchedule.termName ?? '';
    controllers[FieldKeys.startWeek]?.text =
        semesterSchedule.startWeek.toString() ?? '';
    controllers[FieldKeys.endWeek]?.text =
        semesterSchedule.endWeek.toString() ?? '';
    controllers[FieldKeys.startTime]?.text =
        semesterSchedule.startTime.toString() ?? '';
    controllers[FieldKeys.endTime]?.text =
        semesterSchedule.endTime.toString() ?? '';
    controllers[FieldKeys.weekday]?.text =
        semesterSchedule.weekday.toString() ?? '';
    controllers[FieldKeys.section]?.text =
        semesterSchedule.section.toString() ?? '';
    controllers[FieldKeys.courseNo]?.text = semesterSchedule.courseNo ?? '';
    controllers[FieldKeys.courseName]?.text = semesterSchedule.name ?? '';
    controllers[FieldKeys.teacher]?.text = semesterSchedule.teachers ?? '';
    controllers[FieldKeys.classroom]?.text = semesterSchedule.classroom ?? '';
    controllers[FieldKeys.credits]?.text =
        semesterSchedule.credits.toString() ?? '';
    controllers[FieldKeys.comment]?.text = semesterSchedule.comment ?? '';
    controllers[FieldKeys.examType]?.text = semesterSchedule.examType ?? '';
    controllers[FieldKeys.courseType]?.text = semesterSchedule.type ?? '';
    controllers[FieldKeys.courseTypename]?.text =
        semesterSchedule.typename ?? '';
    controllers[FieldKeys.capacity]?.text =
        semesterSchedule.capacity.toString() ?? '';
    controllers[FieldKeys.selected]?.text =
        semesterSchedule.selected.toString() ?? '';
    controllers[FieldKeys.collegeName]?.text =
        semesterSchedule.collegeName ?? '';
    controllers[FieldKeys.majorName]?.text = semesterSchedule.majorName ?? '';
    controllers[FieldKeys.grade]?.text = semesterSchedule.grade ?? '';
    controllers[FieldKeys.batch]?.text =
        semesterSchedule.batch.toString() ?? '';
    controllers[FieldKeys.experiment]?.text = semesterSchedule.experiment ?? '';
    controllers[FieldKeys.experimentNo]?.text =
        semesterSchedule.experimentNo ?? '';
    controllers[FieldKeys.classroomAlias]?.text =
        semesterSchedule.classroomAlias ?? '';

    // Initialize boolean field values
    boolFields[FieldKeys.isLab]?.value = semesterSchedule.isLab ?? false;

    initSemesterSchedule = createCourse(
        username: "",
        term: semesterSchedule.term,
        createTime: DateTime(0),
        updateTime: DateTime(0));
  }

  bool isHasChange() {
    final nowCourse = createCourse(
        username: "",
        term: semesterSchedule.term,
        createTime: DateTime(0),
        updateTime: DateTime(0));
    final hasChange = initSemesterSchedule != nowCourse;
    return hasChange;
  }

  SemesterSchedule createCourse(
      {required String username,
      required String term,
      DateTime? updateTime,
      DateTime? createTime}) {
    return SemesterSchedule(
      id: "",
      username: username,
      source: SemesterScheduleSource.manual,
      createTime: createTime,
      updateTime: updateTime,
      term: term,
      startTime: controllers[FieldKeys.startTime]?.text.let((it) {
            return ExtendedTimeOfDay.tryParse(it)?.formatToString();
          }) ??
          '',
      endTime: controllers[FieldKeys.endTime]?.text.let((it) {
            return ExtendedTimeOfDay.tryParse(it)?.formatToString();
          }) ??
          '',
      type: controllers[FieldKeys.courseType]?.text ?? '',
      typename: controllers[FieldKeys.courseTypename]?.text ?? '',
      examType: controllers[FieldKeys.examType]?.text ?? '',
      collegeName: controllers[FieldKeys.collegeName]?.text ?? '',
      majorName: controllers[FieldKeys.majorName]?.text ?? '',
      grade: controllers[FieldKeys.grade]?.text ?? '',
      name: controllers[FieldKeys.courseName]?.text ?? '',
      courseNo: controllers[FieldKeys.courseNo]?.text ?? '',
      teachers: controllers[FieldKeys.teacher]?.text ?? '',
      termName: controllers[FieldKeys.termName]?.text ?? '',
      capacity: int.tryParse(controllers[FieldKeys.capacity]?.text ?? '0') ?? 0,
      selected: int.tryParse(controllers[FieldKeys.selected]?.text ?? '0') ?? 0,
      credits: controllers[FieldKeys.credits]?.text.toDoubleOrNull() ?? 0.0,
      isLab: boolFields[FieldKeys.isLab]?.value ?? false,
      labLessonId: controllers[FieldKeys.courseNo]?.text ?? '',
      batch: int.tryParse(controllers[FieldKeys.batch]?.text ?? '0') ?? 0,
      startWeek:
          int.tryParse(controllers[FieldKeys.startWeek]?.text ?? '0') ?? 0,
      endWeek: int.tryParse(controllers[FieldKeys.endWeek]?.text ?? '0') ?? 0,
      weekday: int.tryParse(controllers[FieldKeys.weekday]?.text ?? '0') ?? 0,
      section: int.tryParse(controllers[FieldKeys.section]?.text ?? '0') ?? 0,
      experiment: controllers[FieldKeys.experiment]?.text ?? '',
      experimentNo: controllers[FieldKeys.experimentNo]?.text ?? '',
      classroom: controllers[FieldKeys.classroom]?.text ?? '',
      classroomAlias: controllers[FieldKeys.classroomAlias]?.text ?? '',
      comment: controllers[FieldKeys.comment]?.text ?? '',
    ).let((e) {
      if (semesterSchedule.id.isNotBlank) {
        e.id = semesterSchedule.id;
        e.source = semesterSchedule.source;
      } else {
        e.id = e.courseNo.toString() +
            "_${e.startWeek}_${e.endWeek}_${e.weekday}_${e.section}";
      }
      return e;
    });
    ;
  }

  Future<SemesterSchedule?> addCourse() async {
    final user = await UserRepository.get().getActiveUser();
    if (user == null) {
      toastFailure0("请先登录");
      return null;
    }
    SemesterSchedule course =
        createCourse(username: user.username, term: semesterSchedule.term);
    CourseRepository.get().insertOrUpdateSemesterSchedule(course);
    initSemesterSchedule =
        course.copyWith(createTime: DateTime(0), updateTime: DateTime(0));
    toastSuccess0("成功");
    return course;
  }

  @override
  void onClose() {
    controllers.forEach((key, controller) => controller.dispose());
    super.onClose();
  }
}
