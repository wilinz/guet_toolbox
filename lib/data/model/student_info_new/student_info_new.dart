import 'package:json_annotation/json_annotation.dart';

part 'student_info_new.g.dart';

@JsonSerializable(explicitToJson: true)
class StudentInfoNew {
  StudentInfoNew({required this.student});

  @JsonKey(name: "student", defaultValue: Student.emptyInstance)
  Student student;

  factory StudentInfoNew.fromJson(Map<String, dynamic> json) =>
      _$StudentInfoNewFromJson(json);

  Map<String, dynamic> toJson() => _$StudentInfoNewToJson(this);

  factory StudentInfoNew.emptyInstance() =>
      StudentInfoNew(student: Student.emptyInstance());
}

@JsonSerializable(explicitToJson: true)
class ContactInfo {
  ContactInfo(
      {this.email,
      this.telephone,
      this.mobile,
      this.address,
      this.postcode,
      this.qq,
      this.wechat,
      this.emergencyContact,
      this.emergencyPhone,
      this.dormAddress,
      this.dormPhone});

  @JsonKey(name: "email")
  dynamic email;

  @JsonKey(name: "telephone")
  dynamic telephone;

  @JsonKey(name: "mobile")
  dynamic mobile;

  @JsonKey(name: "address")
  dynamic address;

  @JsonKey(name: "postcode")
  dynamic postcode;

  @JsonKey(name: "qq")
  dynamic qq;

  @JsonKey(name: "wechat")
  dynamic wechat;

  @JsonKey(name: "emergencyContact")
  dynamic emergencyContact;

  @JsonKey(name: "emergencyPhone")
  dynamic emergencyPhone;

  @JsonKey(name: "dormAddress")
  dynamic dormAddress;

  @JsonKey(name: "dormPhone")
  dynamic dormPhone;

  factory ContactInfo.fromJson(Map<String, dynamic> json) =>
      _$ContactInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ContactInfoToJson(this);

  factory ContactInfo.emptyInstance() => ContactInfo();
}

@JsonSerializable(explicitToJson: true)
class Family {
  Family(
      {this.id,
      this.nameZh,
      this.nameEn,
      required this.personAssoc,
      required this.contactInfo,
      required this.members});

  @JsonKey(name: "id")
  dynamic id;

  @JsonKey(name: "nameZh")
  dynamic nameZh;

  @JsonKey(name: "nameEn")
  dynamic nameEn;

  @JsonKey(name: "personAssoc", defaultValue: 0)
  int personAssoc;

  @JsonKey(name: "contactInfo", defaultValue: ContactInfo.emptyInstance)
  ContactInfo contactInfo;

  @JsonKey(name: "members", defaultValue: [])
  List members;

  factory Family.fromJson(Map<String, dynamic> json) => _$FamilyFromJson(json);

  Map<String, dynamic> toJson() => _$FamilyToJson(this);

  factory Family.emptyInstance() => Family(
      personAssoc: 0, contactInfo: ContactInfo.emptyInstance(), members: []);
}

@JsonSerializable(explicitToJson: true)
class Gender {
  Gender(
      {required this.nameZh,
      required this.nameEn,
      required this.id,
      required this.code,
      required this.enabled,
      required this.bizTypeAssocs,
      required this.bizTypeIds,
      required this.transient,
      required this.name});

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn", defaultValue: "")
  String nameEn;

  @JsonKey(name: "id", defaultValue: 0)
  int id;

  @JsonKey(name: "code", defaultValue: "")
  String code;

  @JsonKey(name: "enabled", defaultValue: false)
  bool enabled;

  @JsonKey(name: "bizTypeAssocs", defaultValue: [])
  List<int> bizTypeAssocs;

  @JsonKey(name: "bizTypeIds", defaultValue: [])
  List<int> bizTypeIds;

  @JsonKey(name: "transient", defaultValue: false)
  bool transient;

  @JsonKey(name: "name", defaultValue: "")
  String name;

  factory Gender.fromJson(Map<String, dynamic> json) => _$GenderFromJson(json);

  Map<String, dynamic> toJson() => _$GenderToJson(this);

  factory Gender.emptyInstance() => Gender(
      nameZh: "",
      nameEn: "",
      id: 0,
      code: "",
      enabled: false,
      bizTypeAssocs: [],
      bizTypeIds: [],
      transient: false,
      name: "");
}

@JsonSerializable(explicitToJson: true)
class IdCardType {
  IdCardType(
      {required this.nameZh,
      required this.nameEn,
      required this.id,
      required this.code,
      required this.enabled,
      required this.bizTypeAssocs,
      required this.bizTypeIds,
      required this.transient,
      required this.name});

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn", defaultValue: "")
  String nameEn;

  @JsonKey(name: "id", defaultValue: 0)
  int id;

  @JsonKey(name: "code", defaultValue: "")
  String code;

  @JsonKey(name: "enabled", defaultValue: false)
  bool enabled;

  @JsonKey(name: "bizTypeAssocs", defaultValue: [])
  List<int> bizTypeAssocs;

  @JsonKey(name: "bizTypeIds", defaultValue: [])
  List<int> bizTypeIds;

  @JsonKey(name: "transient", defaultValue: false)
  bool transient;

  @JsonKey(name: "name", defaultValue: "")
  String name;

  factory IdCardType.fromJson(Map<String, dynamic> json) =>
      _$IdCardTypeFromJson(json);

  Map<String, dynamic> toJson() => _$IdCardTypeToJson(this);

  factory IdCardType.emptyInstance() => IdCardType(
      nameZh: "",
      nameEn: "",
      id: 0,
      code: "",
      enabled: false,
      bizTypeAssocs: [],
      bizTypeIds: [],
      transient: false,
      name: "");
}

@JsonSerializable(explicitToJson: true)
class Person {
  Person(
      {required this.id,
      required this.nameZh,
      required this.nameEn,
      required this.idCardNumber,
      this.country,
      required this.contactInfo,
      required this.family,
      this.portrait,
      required this.gender,
      required this.idCardType,
      this.birthday,
      this.nation,
      this.politicalVisage,
      this.age,
      this.nativePlace,
      this.bank,
      this.bankAccount,
      this.trainStationChinaPlace,
      this.trainStation,
      this.healthStatus,
      this.joinPartyDatePlace,
      this.joinLeagueDatePlace,
      this.residence,
      this.residenceNature,
      this.formerName,
      required this.namePinyin,
      this.birthPlace,
      this.remark,
      required this.studyExperiences,
      required this.workExperiences,
      this.maritalStatus,
      this.activeSoldier,
      this.countryType,
      this.backHomeNumber,
      this.ancestralHome,
      this.arrivalTime,
      required this.permanentResident,
      this.religiousBelief,
      this.graduatedSchool,
      this.workCompany,
      this.specialistPositionLevel,
      this.leaderPositionLevel,
      required this.stdLeaders,
      this.character,
      this.hobby,
      this.specialty,
      this.workExperience,
      this.volunteerExperience});

  @JsonKey(name: "id", defaultValue: 0)
  int id;

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn", defaultValue: "")
  String nameEn;

  @JsonKey(name: "idCardNumber", defaultValue: "")
  String idCardNumber;

  @JsonKey(name: "country")
  dynamic country;

  @JsonKey(name: "contactInfo", defaultValue: ContactInfo.emptyInstance)
  ContactInfo contactInfo;

  @JsonKey(name: "family", defaultValue: Family.emptyInstance)
  Family family;

  @JsonKey(name: "portrait")
  dynamic portrait;

  @JsonKey(name: "gender", defaultValue: Gender.emptyInstance)
  Gender gender;

  @JsonKey(name: "idCardType", defaultValue: IdCardType.emptyInstance)
  IdCardType idCardType;

  @JsonKey(name: "birthday")
  dynamic birthday;

  @JsonKey(name: "nation")
  dynamic nation;

  @JsonKey(name: "politicalVisage")
  dynamic politicalVisage;

  @JsonKey(name: "age")
  dynamic age;

  @JsonKey(name: "nativePlace")
  dynamic nativePlace;

  @JsonKey(name: "bank")
  dynamic bank;

  @JsonKey(name: "bankAccount")
  dynamic bankAccount;

  @JsonKey(name: "trainStationChinaPlace")
  dynamic trainStationChinaPlace;

  @JsonKey(name: "trainStation")
  dynamic trainStation;

  @JsonKey(name: "healthStatus")
  dynamic healthStatus;

  @JsonKey(name: "joinPartyDatePlace")
  dynamic joinPartyDatePlace;

  @JsonKey(name: "joinLeagueDatePlace")
  dynamic joinLeagueDatePlace;

  @JsonKey(name: "residence")
  dynamic residence;

  @JsonKey(name: "residenceNature")
  dynamic residenceNature;

  @JsonKey(name: "formerName")
  dynamic formerName;

  @JsonKey(name: "namePinyin", defaultValue: "")
  String namePinyin;

  @JsonKey(name: "birthPlace")
  dynamic birthPlace;

  @JsonKey(name: "remark")
  dynamic remark;

  @JsonKey(name: "studyExperiences", defaultValue: [])
  List studyExperiences;

  @JsonKey(name: "workExperiences", defaultValue: [])
  List workExperiences;

  @JsonKey(name: "maritalStatus")
  dynamic maritalStatus;

  @JsonKey(name: "activeSoldier")
  dynamic activeSoldier;

  @JsonKey(name: "countryType")
  dynamic countryType;

  @JsonKey(name: "backHomeNumber")
  dynamic backHomeNumber;

  @JsonKey(name: "ancestralHome")
  dynamic ancestralHome;

  @JsonKey(name: "arrivalTime")
  dynamic arrivalTime;

  @JsonKey(name: "permanentResident", defaultValue: false)
  bool permanentResident;

  @JsonKey(name: "religiousBelief")
  dynamic religiousBelief;

  @JsonKey(name: "graduatedSchool")
  dynamic graduatedSchool;

  @JsonKey(name: "workCompany")
  dynamic workCompany;

  @JsonKey(name: "specialistPositionLevel")
  dynamic specialistPositionLevel;

  @JsonKey(name: "leaderPositionLevel")
  dynamic leaderPositionLevel;

  @JsonKey(name: "stdLeaders", defaultValue: false)
  bool stdLeaders;

  @JsonKey(name: "character")
  dynamic character;

  @JsonKey(name: "hobby")
  dynamic hobby;

  @JsonKey(name: "specialty")
  dynamic specialty;

  @JsonKey(name: "workExperience")
  dynamic workExperience;

  @JsonKey(name: "volunteerExperience")
  dynamic volunteerExperience;

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  Map<String, dynamic> toJson() => _$PersonToJson(this);

  factory Person.emptyInstance() => Person(
      id: 0,
      nameZh: "",
      nameEn: "",
      idCardNumber: "",
      contactInfo: ContactInfo.emptyInstance(),
      family: Family.emptyInstance(),
      gender: Gender.emptyInstance(),
      idCardType: IdCardType.emptyInstance(),
      namePinyin: "",
      studyExperiences: [],
      workExperiences: [],
      permanentResident: false,
      stdLeaders: false);
}

@JsonSerializable(explicitToJson: true)
class BizType {
  BizType({required this.id, required this.nameZh, required this.nameEn});

  @JsonKey(name: "id", defaultValue: 0)
  int id;

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn", defaultValue: "")
  String nameEn;

  factory BizType.fromJson(Map<String, dynamic> json) =>
      _$BizTypeFromJson(json);

  Map<String, dynamic> toJson() => _$BizTypeToJson(this);

  factory BizType.emptyInstance() => BizType(id: 0, nameZh: "", nameEn: "");
}

@JsonSerializable(explicitToJson: true)
class MngtDepartment {
  MngtDepartment(
      {required this.id,
      required this.nameZh,
      required this.nameEn,
      required this.code,
      required this.abbrZh,
      this.abbrEn,
      required this.college,
      required this.research,
      required this.openCourse,
      required this.experiment,
      this.telephone,
      this.address,
      required this.indexNo,
      required this.recruitTypeSet,
      required this.recruitTypes});

  @JsonKey(name: "id", defaultValue: 0)
  int id;

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn", defaultValue: "")
  String nameEn;

  @JsonKey(name: "code", defaultValue: "")
  String code;

  @JsonKey(name: "abbrZh", defaultValue: "")
  String abbrZh;

  @JsonKey(name: "abbrEn")
  dynamic abbrEn;

  @JsonKey(name: "college", defaultValue: false)
  bool college;

  @JsonKey(name: "research", defaultValue: false)
  bool research;

  @JsonKey(name: "openCourse", defaultValue: false)
  bool openCourse;

  @JsonKey(name: "experiment", defaultValue: false)
  bool experiment;

  @JsonKey(name: "telephone")
  dynamic telephone;

  @JsonKey(name: "address")
  dynamic address;

  @JsonKey(name: "indexNo", defaultValue: 0)
  int indexNo;

  @JsonKey(name: "recruitTypeSet", defaultValue: [])
  List<String> recruitTypeSet;

  @JsonKey(name: "recruitTypes", defaultValue: "")
  String recruitTypes;

  factory MngtDepartment.fromJson(Map<String, dynamic> json) =>
      _$MngtDepartmentFromJson(json);

  Map<String, dynamic> toJson() => _$MngtDepartmentToJson(this);

  factory MngtDepartment.emptyInstance() => MngtDepartment(
      id: 0,
      nameZh: "",
      nameEn: "",
      code: "",
      abbrZh: "",
      college: false,
      research: false,
      openCourse: false,
      experiment: false,
      indexNo: 0,
      recruitTypeSet: [],
      recruitTypes: "");
}

@JsonSerializable(explicitToJson: true)
class Education {
  Education(
      {required this.nameZh,
      this.nameEn,
      required this.id,
      required this.code,
      required this.enabled,
      required this.bizTypeAssocs,
      required this.bizTypeIds,
      required this.transient,
      required this.name});

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn")
  dynamic nameEn;

  @JsonKey(name: "id", defaultValue: 0)
  int id;

  @JsonKey(name: "code", defaultValue: "")
  String code;

  @JsonKey(name: "enabled", defaultValue: false)
  bool enabled;

  @JsonKey(name: "bizTypeAssocs", defaultValue: [])
  List<int> bizTypeAssocs;

  @JsonKey(name: "bizTypeIds", defaultValue: [])
  List<int> bizTypeIds;

  @JsonKey(name: "transient", defaultValue: false)
  bool transient;

  @JsonKey(name: "name", defaultValue: "")
  String name;

  factory Education.fromJson(Map<String, dynamic> json) =>
      _$EducationFromJson(json);

  Map<String, dynamic> toJson() => _$EducationToJson(this);

  factory Education.emptyInstance() => Education(
      nameZh: "",
      id: 0,
      code: "",
      enabled: false,
      bizTypeAssocs: [],
      bizTypeIds: [],
      transient: false,
      name: "");
}

@JsonSerializable(explicitToJson: true)
class StdType {
  StdType(
      {required this.nameZh,
      this.nameEn,
      required this.id,
      required this.code,
      required this.enabled,
      required this.bizTypeAssocs,
      required this.bizTypeIds,
      required this.transient,
      required this.name});

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn")
  dynamic nameEn;

  @JsonKey(name: "id", defaultValue: 0)
  int id;

  @JsonKey(name: "code", defaultValue: "")
  String code;

  @JsonKey(name: "enabled", defaultValue: false)
  bool enabled;

  @JsonKey(name: "bizTypeAssocs", defaultValue: [])
  List<int> bizTypeAssocs;

  @JsonKey(name: "bizTypeIds", defaultValue: [])
  List<int> bizTypeIds;

  @JsonKey(name: "transient", defaultValue: false)
  bool transient;

  @JsonKey(name: "name", defaultValue: "")
  String name;

  factory StdType.fromJson(Map<String, dynamic> json) =>
      _$StdTypeFromJson(json);

  Map<String, dynamic> toJson() => _$StdTypeToJson(this);

  factory StdType.emptyInstance() => StdType(
      nameZh: "",
      id: 0,
      code: "",
      enabled: false,
      bizTypeAssocs: [],
      bizTypeIds: [],
      transient: false,
      name: "");
}

@JsonSerializable(explicitToJson: true)
class Department {
  Department(
      {required this.id,
      required this.nameZh,
      required this.nameEn,
      required this.code,
      required this.abbrZh,
      this.abbrEn,
      required this.college,
      required this.research,
      required this.openCourse,
      required this.experiment,
      this.telephone,
      this.address,
      required this.indexNo,
      required this.recruitTypeSet,
      required this.recruitTypes});

  @JsonKey(name: "id", defaultValue: 0)
  int id;

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn", defaultValue: "")
  String nameEn;

  @JsonKey(name: "code", defaultValue: "")
  String code;

  @JsonKey(name: "abbrZh", defaultValue: "")
  String abbrZh;

  @JsonKey(name: "abbrEn")
  dynamic abbrEn;

  @JsonKey(name: "college", defaultValue: false)
  bool college;

  @JsonKey(name: "research", defaultValue: false)
  bool research;

  @JsonKey(name: "openCourse", defaultValue: false)
  bool openCourse;

  @JsonKey(name: "experiment", defaultValue: false)
  bool experiment;

  @JsonKey(name: "telephone")
  dynamic telephone;

  @JsonKey(name: "address")
  dynamic address;

  @JsonKey(name: "indexNo", defaultValue: 0)
  int indexNo;

  @JsonKey(name: "recruitTypeSet", defaultValue: [])
  List<String> recruitTypeSet;

  @JsonKey(name: "recruitTypes", defaultValue: "")
  String recruitTypes;

  factory Department.fromJson(Map<String, dynamic> json) =>
      _$DepartmentFromJson(json);

  Map<String, dynamic> toJson() => _$DepartmentToJson(this);

  factory Department.emptyInstance() => Department(
      id: 0,
      nameZh: "",
      nameEn: "",
      code: "",
      abbrZh: "",
      college: false,
      research: false,
      openCourse: false,
      experiment: false,
      indexNo: 0,
      recruitTypeSet: [],
      recruitTypes: "");
}

@JsonSerializable(explicitToJson: true)
class Major {
  Major(
      {required this.id,
      required this.nameZh,
      required this.nameEn,
      required this.code,
      required this.abbrZh,
      this.abbrEn,
      required this.parent,
      required this.studyYears,
      this.schoolingYear,
      this.shuntTime,
      this.majorCertificate,
      required this.parentMajorAssocs,
      required this.childMajorAssocs});

  @JsonKey(name: "id", defaultValue: 0)
  int id;

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn", defaultValue: "")
  String nameEn;

  @JsonKey(name: "code", defaultValue: "")
  String code;

  @JsonKey(name: "abbrZh", defaultValue: "")
  String abbrZh;

  @JsonKey(name: "abbrEn")
  dynamic abbrEn;

  @JsonKey(name: "parent", defaultValue: false)
  bool parent;

  @JsonKey(name: "studyYears", defaultValue: 0.0)
  double studyYears;

  @JsonKey(name: "schoolingYear")
  dynamic schoolingYear;

  @JsonKey(name: "shuntTime")
  dynamic shuntTime;

  @JsonKey(name: "majorCertificate")
  dynamic majorCertificate;

  @JsonKey(name: "parentMajorAssocs", defaultValue: [])
  List parentMajorAssocs;

  @JsonKey(name: "childMajorAssocs", defaultValue: [])
  List childMajorAssocs;

  factory Major.fromJson(Map<String, dynamic> json) => _$MajorFromJson(json);

  Map<String, dynamic> toJson() => _$MajorToJson(this);

  factory Major.emptyInstance() => Major(
      id: 0,
      nameZh: "",
      nameEn: "",
      code: "",
      abbrZh: "",
      parent: false,
      studyYears: 0,
      parentMajorAssocs: [],
      childMajorAssocs: []);
}

@JsonSerializable(explicitToJson: true)
class Adminclass {
  Adminclass(
      {required this.id,
      required this.nameZh,
      required this.nameEn,
      required this.code,
      required this.grade,
      required this.stdCount,
      required this.planCount,
      required this.enabled,
      this.abbrZh,
      this.abbrEn,
      this.remark});

  @JsonKey(name: "id", defaultValue: 0)
  int id;

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn", defaultValue: "")
  String nameEn;

  @JsonKey(name: "code", defaultValue: "")
  String code;

  @JsonKey(name: "grade", defaultValue: "")
  String grade;

  @JsonKey(name: "stdCount", defaultValue: 0)
  int stdCount;

  @JsonKey(name: "planCount", defaultValue: 0)
  int planCount;

  @JsonKey(name: "enabled", defaultValue: false)
  bool enabled;

  @JsonKey(name: "abbrZh")
  dynamic abbrZh;

  @JsonKey(name: "abbrEn")
  dynamic abbrEn;

  @JsonKey(name: "remark")
  dynamic remark;

  factory Adminclass.fromJson(Map<String, dynamic> json) =>
      _$AdminclassFromJson(json);

  Map<String, dynamic> toJson() => _$AdminclassToJson(this);

  factory Adminclass.emptyInstance() => Adminclass(
      id: 0,
      nameZh: "",
      nameEn: "",
      code: "",
      grade: "",
      stdCount: 0,
      planCount: 0,
      enabled: false);
}

@JsonSerializable(explicitToJson: true)
class Campus {
  Campus(
      {required this.id,
      required this.nameZh,
      required this.nameEn,
      required this.code,
      required this.enabled});

  @JsonKey(name: "id", defaultValue: 0)
  int id;

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn", defaultValue: "")
  String nameEn;

  @JsonKey(name: "code", defaultValue: "")
  String code;

  @JsonKey(name: "enabled", defaultValue: false)
  bool enabled;

  factory Campus.fromJson(Map<String, dynamic> json) => _$CampusFromJson(json);

  Map<String, dynamic> toJson() => _$CampusToJson(this);

  factory Campus.emptyInstance() =>
      Campus(id: 0, nameZh: "", nameEn: "", code: "", enabled: false);
}

@JsonSerializable(explicitToJson: true)
class StdStatus {
  StdStatus(
      {required this.nameZh,
      this.nameEn,
      required this.id,
      required this.code,
      required this.enabled,
      required this.bizTypeAssocs,
      required this.bizTypeIds,
      required this.transient,
      required this.name});

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn")
  dynamic nameEn;

  @JsonKey(name: "id", defaultValue: 0)
  int id;

  @JsonKey(name: "code", defaultValue: "")
  String code;

  @JsonKey(name: "enabled", defaultValue: false)
  bool enabled;

  @JsonKey(name: "bizTypeAssocs", defaultValue: [])
  List<int> bizTypeAssocs;

  @JsonKey(name: "bizTypeIds", defaultValue: [])
  List<int> bizTypeIds;

  @JsonKey(name: "transient", defaultValue: false)
  bool transient;

  @JsonKey(name: "name", defaultValue: "")
  String name;

  factory StdStatus.fromJson(Map<String, dynamic> json) =>
      _$StdStatusFromJson(json);

  Map<String, dynamic> toJson() => _$StdStatusToJson(this);

  factory StdStatus.emptyInstance() => StdStatus(
      nameZh: "",
      id: 0,
      code: "",
      enabled: false,
      bizTypeAssocs: [],
      bizTypeIds: [],
      transient: false,
      name: "");
}

@JsonSerializable(explicitToJson: true)
class Program {
  Program(
      {required this.id,
      required this.nameZh,
      this.nameEn,
      required this.grade,
      required this.type,
      required this.enabled,
      required this.auditState,
      this.currentNode});

  @JsonKey(name: "id", defaultValue: 0)
  int id;

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn")
  dynamic nameEn;

  @JsonKey(name: "grade", defaultValue: "")
  String grade;

  @JsonKey(name: "type", defaultValue: "")
  String type;

  @JsonKey(name: "enabled", defaultValue: false)
  bool enabled;

  @JsonKey(name: "auditState", defaultValue: "")
  String auditState;

  @JsonKey(name: "currentNode")
  dynamic currentNode;

  factory Program.fromJson(Map<String, dynamic> json) =>
      _$ProgramFromJson(json);

  Map<String, dynamic> toJson() => _$ProgramToJson(this);

  factory Program.emptyInstance() => Program(
      id: 0, nameZh: "", grade: "", type: "", enabled: false, auditState: "");
}

@JsonSerializable(explicitToJson: true)
class StudyForm {
  StudyForm(
      {required this.nameZh,
      this.nameEn,
      required this.id,
      required this.code,
      required this.enabled,
      required this.bizTypeAssocs,
      required this.bizTypeIds,
      required this.transient,
      required this.name});

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn")
  dynamic nameEn;

  @JsonKey(name: "id", defaultValue: 0)
  int id;

  @JsonKey(name: "code", defaultValue: "")
  String code;

  @JsonKey(name: "enabled", defaultValue: false)
  bool enabled;

  @JsonKey(name: "bizTypeAssocs", defaultValue: [])
  List<int> bizTypeAssocs;

  @JsonKey(name: "bizTypeIds", defaultValue: [])
  List<int> bizTypeIds;

  @JsonKey(name: "transient", defaultValue: false)
  bool transient;

  @JsonKey(name: "name", defaultValue: "")
  String name;

  factory StudyForm.fromJson(Map<String, dynamic> json) =>
      _$StudyFormFromJson(json);

  Map<String, dynamic> toJson() => _$StudyFormToJson(this);

  factory StudyForm.emptyInstance() => StudyForm(
      nameZh: "",
      id: 0,
      code: "",
      enabled: false,
      bizTypeAssocs: [],
      bizTypeIds: [],
      transient: false,
      name: "");
}

@JsonSerializable(explicitToJson: true)
class CultivateType {
  CultivateType(
      {required this.nameZh,
      required this.nameEn,
      required this.id,
      required this.code,
      required this.enabled,
      required this.bizTypeAssocs,
      required this.bizTypeIds,
      required this.transient,
      required this.name});

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn", defaultValue: "")
  String nameEn;

  @JsonKey(name: "id", defaultValue: 0)
  int id;

  @JsonKey(name: "code", defaultValue: "")
  String code;

  @JsonKey(name: "enabled", defaultValue: false)
  bool enabled;

  @JsonKey(name: "bizTypeAssocs", defaultValue: [])
  List<int> bizTypeAssocs;

  @JsonKey(name: "bizTypeIds", defaultValue: [])
  List<int> bizTypeIds;

  @JsonKey(name: "transient", defaultValue: false)
  bool transient;

  @JsonKey(name: "name", defaultValue: "")
  String name;

  factory CultivateType.fromJson(Map<String, dynamic> json) =>
      _$CultivateTypeFromJson(json);

  Map<String, dynamic> toJson() => _$CultivateTypeToJson(this);

  factory CultivateType.emptyInstance() => CultivateType(
      nameZh: "",
      nameEn: "",
      id: 0,
      code: "",
      enabled: false,
      bizTypeAssocs: [],
      bizTypeIds: [],
      transient: false,
      name: "");
}

@JsonSerializable(explicitToJson: true)
class Student {
  Student(
      {required this.id,
      this.studentRecordType,
      required this.code,
      required this.grade,
      required this.hasXueJi,
      required this.inSchool,
      required this.zaiJi,
      required this.needRegister,
      required this.studyYears,
      required this.enterSchoolDate,
      this.aboardStudentRegisterCode,
      this.aboardScholarshipCode,
      required this.enterSchoolGrade,
      required this.retirement,
      this.retakeTag,
      this.attendTag,
      this.researchDirection,
      this.predictEnterDate,
      required this.department,
      required this.major,
      required this.person});

  @JsonKey(name: "id", defaultValue: 0)
  int id;

  @JsonKey(name: "studentRecordType")
  dynamic studentRecordType;

  @JsonKey(name: "code", defaultValue: "")
  String code;

  @JsonKey(name: "grade", defaultValue: "")
  String grade;

  @JsonKey(name: "hasXueJi", defaultValue: false)
  bool hasXueJi;

  @JsonKey(name: "inSchool", defaultValue: false)
  bool inSchool;

  @JsonKey(name: "zaiJi", defaultValue: false)
  bool zaiJi;

  @JsonKey(name: "needRegister", defaultValue: false)
  bool needRegister;

  @JsonKey(name: "studyYears", defaultValue: 0.0)
  double studyYears;

  @JsonKey(name: "enterSchoolDate", defaultValue: "")
  String enterSchoolDate;

  @JsonKey(name: "aboardStudentRegisterCode")
  dynamic aboardStudentRegisterCode;

  @JsonKey(name: "aboardScholarshipCode")
  dynamic aboardScholarshipCode;

  @JsonKey(name: "enterSchoolGrade", defaultValue: 0)
  int enterSchoolGrade;

  @JsonKey(name: "retirement", defaultValue: false)
  bool retirement;

  @JsonKey(name: "retakeTag")
  dynamic retakeTag;

  @JsonKey(name: "attendTag")
  dynamic attendTag;

  @JsonKey(name: "researchDirection")
  dynamic researchDirection;

  @JsonKey(name: "predictEnterDate")
  dynamic predictEnterDate;

  @JsonKey(name: "department")
  Department department;

  @JsonKey(name: "major")
  Major major;

  @JsonKey(name: "person")
  Person person;

  factory Student.fromJson(Map<String, dynamic> json) =>
      _$StudentFromJson(json);

  Map<String, dynamic> toJson() => _$StudentToJson(this);

  factory Student.emptyInstance() => Student(
      id: 0,
      code: "",
      grade: "",
      hasXueJi: false,
      inSchool: false,
      zaiJi: false,
      needRegister: false,
      studyYears: 0,
      enterSchoolDate: "",
      enterSchoolGrade: 0,
      retirement: false,
      department: Department.emptyInstance(),
      major: Major.emptyInstance(),
      person: Person.emptyInstance());
}

@JsonSerializable(explicitToJson: true)
class Graduate {
  Graduate(
      {required this.id,
      required this.expectedGraduateDate,
      this.graduateDate,
      this.result,
      this.certificateCode,
      this.remark,
      required this.needAudit,
      this.deadlineDate,
      this.principalName,
      this.principalNameEn,
      this.deliveryDate,
      this.college,
      this.collegeEn,
      this.major,
      this.majorEn,
      this.school,
      this.schoolEn,
      this.schoolCode,
      this.afterGraduateDir,
      this.confirmCompanyName,
      required this.student,
      this.portraitFileInfo});

  @JsonKey(name: "id", defaultValue: 0)
  int id;

  @JsonKey(name: "expectedGraduateDate", defaultValue: "")
  String expectedGraduateDate;

  @JsonKey(name: "graduateDate")
  dynamic graduateDate;

  @JsonKey(name: "result")
  dynamic result;

  @JsonKey(name: "certificateCode")
  dynamic certificateCode;

  @JsonKey(name: "remark")
  dynamic remark;

  @JsonKey(name: "needAudit", defaultValue: false)
  bool needAudit;

  @JsonKey(name: "deadlineDate")
  dynamic deadlineDate;

  @JsonKey(name: "principalName")
  dynamic principalName;

  @JsonKey(name: "principalNameEn")
  dynamic principalNameEn;

  @JsonKey(name: "deliveryDate")
  dynamic deliveryDate;

  @JsonKey(name: "college")
  dynamic college;

  @JsonKey(name: "collegeEn")
  dynamic collegeEn;

  @JsonKey(name: "major")
  dynamic major;

  @JsonKey(name: "majorEn")
  dynamic majorEn;

  @JsonKey(name: "school")
  dynamic school;

  @JsonKey(name: "schoolEn")
  dynamic schoolEn;

  @JsonKey(name: "schoolCode")
  dynamic schoolCode;

  @JsonKey(name: "afterGraduateDir")
  dynamic afterGraduateDir;

  @JsonKey(name: "confirmCompanyName")
  dynamic confirmCompanyName;

  @JsonKey(name: "student", defaultValue: Student.emptyInstance)
  Student student;

  @JsonKey(name: "portraitFileInfo")
  dynamic portraitFileInfo;

  factory Graduate.fromJson(Map<String, dynamic> json) =>
      _$GraduateFromJson(json);

  Map<String, dynamic> toJson() => _$GraduateToJson(this);

  factory Graduate.emptyInstance() => Graduate(
      id: 0,
      expectedGraduateDate: "",
      needAudit: false,
      student: Student.emptyInstance());
}

@JsonSerializable(explicitToJson: true)
class StudentGraduateInfo {
  StudentGraduateInfo(
      {required this.id,
      required this.expectedGraduateDate,
      this.graduateDate,
      this.result,
      this.certificateCode,
      this.remark,
      required this.needAudit,
      this.deadlineDate,
      this.principalName,
      this.principalNameEn,
      this.deliveryDate,
      this.college,
      this.collegeEn,
      this.major,
      this.majorEn,
      this.school,
      this.schoolEn,
      this.schoolCode,
      this.afterGraduateDir,
      this.confirmCompanyName});

  @JsonKey(name: "id", defaultValue: 0)
  int id;

  @JsonKey(name: "expectedGraduateDate", defaultValue: "")
  String expectedGraduateDate;

  @JsonKey(name: "graduateDate")
  dynamic graduateDate;

  @JsonKey(name: "result")
  dynamic result;

  @JsonKey(name: "certificateCode")
  dynamic certificateCode;

  @JsonKey(name: "remark")
  dynamic remark;

  @JsonKey(name: "needAudit", defaultValue: false)
  bool needAudit;

  @JsonKey(name: "deadlineDate")
  dynamic deadlineDate;

  @JsonKey(name: "principalName")
  dynamic principalName;

  @JsonKey(name: "principalNameEn")
  dynamic principalNameEn;

  @JsonKey(name: "deliveryDate")
  dynamic deliveryDate;

  @JsonKey(name: "college")
  dynamic college;

  @JsonKey(name: "collegeEn")
  dynamic collegeEn;

  @JsonKey(name: "major")
  dynamic major;

  @JsonKey(name: "majorEn")
  dynamic majorEn;

  @JsonKey(name: "school")
  dynamic school;

  @JsonKey(name: "schoolEn")
  dynamic schoolEn;

  @JsonKey(name: "schoolCode")
  dynamic schoolCode;

  @JsonKey(name: "afterGraduateDir")
  dynamic afterGraduateDir;

  @JsonKey(name: "confirmCompanyName")
  dynamic confirmCompanyName;

  factory StudentGraduateInfo.fromJson(Map<String, dynamic> json) =>
      _$StudentGraduateInfoFromJson(json);

  Map<String, dynamic> toJson() => _$StudentGraduateInfoToJson(this);

  factory StudentGraduateInfo.emptyInstance() =>
      StudentGraduateInfo(id: 0, expectedGraduateDate: "", needAudit: false);
}
