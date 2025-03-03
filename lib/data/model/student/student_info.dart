import 'package:floor/floor.dart';
import 'package:guethub/data/model/student_info_new/student_info_new.dart';
import 'package:json_annotation/json_annotation.dart';

part 'student_info.g.dart';

@JsonSerializable(explicitToJson: true)
@Entity(tableName: "student_info", indices: [
  Index(value: ["student_id"], unique: true)
])
class StudentInfo {
  StudentInfo(
      {required this.term,
      required this.grade,
      required this.collegeNo,
      required this.collegeName,
      required this.majorNo,
      required this.majorName,
      required this.studentId,
      required this.name});

  @PrimaryKey(autoGenerate: true)
  @JsonKey(includeFromJson: false)
  int? id;

  @JsonKey(name: "term", defaultValue: "")
  String term;

  @JsonKey(name: "grade", defaultValue: "")
  String grade;

  @JsonKey(name: "dptno", defaultValue: "")
  @ColumnInfo(name: 'college_no')
  String collegeNo;

  @JsonKey(name: "dptname", defaultValue: "")
  @ColumnInfo(name: 'college_name')
  String collegeName;

  @JsonKey(name: "spno", defaultValue: "")
  @ColumnInfo(name: 'major_no')
  String majorNo;

  @JsonKey(name: "spname", defaultValue: "")
  @ColumnInfo(name: 'major_name')
  String majorName;

  @JsonKey(name: "stid", defaultValue: "")
  @ColumnInfo(name: 'student_id')
  String studentId;

  @JsonKey(name: "name", defaultValue: "")
  String name;

  @override
  String toString() =>
      'StudentInfo{id: $id, term: $term, grade: $grade, collegeNo: $collegeNo, collegeName: $collegeName, majorNo: $majorNo, majorName: $majorName, studentId: $studentId, name: $name}';

  factory StudentInfo.fromJson(Map<String, dynamic> json) =>
      _$StudentInfoFromJson(json);

  factory StudentInfo.fromNewSystem(StudentInfoNew newInfo) {
    return StudentInfo(
        term: "",
        grade: newInfo.student.grade,
        collegeNo: newInfo.student.department.code,
        collegeName: newInfo.student.department.nameZh,
        majorNo: newInfo.student.major.code,
        majorName: newInfo.student.major.nameZh,
        studentId: newInfo.student.code,
        name: newInfo.student.person.nameZh,
    );
  }

  Map<String, dynamic> toJson() => _$StudentInfoToJson(this);
}
