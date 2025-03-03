import 'package:dart_extensions/dart_extensions.dart';
import 'package:get/get.dart';
import 'package:guethub/data/model/academy/academy_response.dart';
import 'package:guethub/data/model/common/common_response.dart';
import 'package:guethub/data/model/majors/majors_response.dart';
import 'package:guethub/data/model/plan_course/plan_course_detail_response.dart';
import 'package:guethub/data/model/plan_course/plan_course_response.dart';
import 'package:guethub/data/model/student/student_info.dart';
import 'package:guethub/data/model/term/term.dart';
import 'package:guethub/data/repository/academy.dart';
import 'package:guethub/data/repository/course.dart';
import 'package:guethub/data/repository/majors.dart';
import 'package:guethub/data/repository/student_info.dart';

typedef Filter<T> = bool Function(T value);

@Deprecated("Old system")
class ExpandableWrapper<T>{
  final isExpand = false.obs;
  final T data ;

  ExpandableWrapper({required this.data});
}

@Deprecated("Old system")
class CourseSelectionOldViewModel extends GetxController {
  StudentInfo? studentInfo;

  final terms = <Term>[].obs;
  final academy = <Academy>[].obs;
  final major = <Major>[].obs;
  final planCourses = <ExpandableWrapper<PlanCourse>>[].obs;
  final planCoursesBackup = <ExpandableWrapper<PlanCourse>>[].obs;
  final grades = CourseRepository.get().getLastSixYears().obs;
  final filterGroup = <String, Filter<PlanCourse>>{}.obs;
  final currentTerm = Rx<Term?>(null);
  final currentGrade = RxnInt(null);
  final currentAcademy = Rx<Academy?>(null);
  final currentMajor = Rx<Major?>(null);

  filter(String key, Filter<PlanCourse> filter) {
    filterGroup[key] = filter;
    _filter();
  }

  void _filter() {
    planCourses.value = planCoursesBackup.where((e) {
      bool result = true;
      filterGroup.forEach((k, f) {
        result = result & f(e.data);
      });
      return result;
    }).toList();
  }

  undoFilter(String key) {
    filterGroup.remove(key);
    _filter();
  }

  Future<List<Major>> getMajors() async {
    return MajorsRepository.get().getMajors().then((value) {
      value.sort((a, b) {
        return a.shortPinyin.compareTo(b.shortPinyin);
      });
      major.value = value;
      return value;
    });
  }

  Future<List<Academy>> getAcademy() async {
    return AcademyRepository.get().getAcademy().then((value) {
      academy.value = value;
      return value;
    });
  }

  Future<List<Term>> getTermList({required bool isFlush}) {
    return CourseRepository.get().getTermList(isFlush: isFlush).then((value) {
      terms..clear()..addAll(value.distinctBy((e)=>e.term));
      return value;
    });
  }

  Future<StudentInfo> getStudentInfo() async {
    return StudentInfoRepository.get().getStudentInfo().then((value) {
      studentInfo = value;
      currentTerm.value = terms.firstWhereOrNull((e) => e.term == value.term);
      currentGrade.value = int.parse(value.grade);
      return value;
    });
  }

  Future<CommonResponse> select(PlanCourseDetail planCourseDetail) async {
    return CourseRepository.get().select(planCourseDetail.copyWith(term: currentTerm.value!.term));
  }

  Future<CommonResponse> unselect(PlanCourseDetail planCourseDetail) async {
    return CourseRepository.get().unselect(planCourseDetail.copyWith(term: currentTerm.value!.term));
  }

  Future<List<PlanCourseDetail>> getDetail(ExpandableWrapper<PlanCourse> planCourseWrapper) {
    final planCourse = planCourseWrapper.data;
    return CourseRepository.get()
        .getPlanCourseDetail(planCourse.id, planCourse.courseid)
        .then((value) {
      planCourse.details = value;
      planCourseWrapper.isExpand.value = true;
      return value;
    });
  }

  Future<List<PlanCourse>> getPlan(
      {required String term,
      required String grade,
      required String dptno,
      required String spno,
      bool networkCourseOnly = false}) async {
    planCourses.clear();
    planCoursesBackup.clear();
    return CourseRepository.get()
        .getPlan(term, grade, dptno, spno)
        .then((planCourses) async {
      this.planCourses.value = planCourses.map((e) => ExpandableWrapper(data: e)).toList();
      this.planCoursesBackup.value = this.planCourses;

      if (networkCourseOnly) {
        filter("networkFilter", (e) {
          return e.cname.contains("网络");
        });
      } else {
        undoFilter("networkFilter");
      }
      // notifyListeners();
      // planCourses.forEach((planCourse) {
      //   if (networkCourseOnly && !planCourse.cname.contains("网络")) return;
      //   getDetail(planCourse);
      // });
      return planCourses;
    });
  }
}
