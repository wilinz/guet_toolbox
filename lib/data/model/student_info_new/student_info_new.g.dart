// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_info_new.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentInfoNew _$StudentInfoNewFromJson(Map<String, dynamic> json) =>
    StudentInfoNew(
      student: json['student'] == null
          ? Student.emptyInstance()
          : Student.fromJson(json['student'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StudentInfoNewToJson(StudentInfoNew instance) =>
    <String, dynamic>{
      'student': instance.student.toJson(),
    };

ContactInfo _$ContactInfoFromJson(Map<String, dynamic> json) => ContactInfo(
      email: json['email'],
      telephone: json['telephone'],
      mobile: json['mobile'],
      address: json['address'],
      postcode: json['postcode'],
      qq: json['qq'],
      wechat: json['wechat'],
      emergencyContact: json['emergencyContact'],
      emergencyPhone: json['emergencyPhone'],
      dormAddress: json['dormAddress'],
      dormPhone: json['dormPhone'],
    );

Map<String, dynamic> _$ContactInfoToJson(ContactInfo instance) =>
    <String, dynamic>{
      'email': instance.email,
      'telephone': instance.telephone,
      'mobile': instance.mobile,
      'address': instance.address,
      'postcode': instance.postcode,
      'qq': instance.qq,
      'wechat': instance.wechat,
      'emergencyContact': instance.emergencyContact,
      'emergencyPhone': instance.emergencyPhone,
      'dormAddress': instance.dormAddress,
      'dormPhone': instance.dormPhone,
    };

Family _$FamilyFromJson(Map<String, dynamic> json) => Family(
      id: json['id'],
      nameZh: json['nameZh'],
      nameEn: json['nameEn'],
      personAssoc: (json['personAssoc'] as num?)?.toInt() ?? 0,
      contactInfo: json['contactInfo'] == null
          ? ContactInfo.emptyInstance()
          : ContactInfo.fromJson(json['contactInfo'] as Map<String, dynamic>),
      members: json['members'] as List<dynamic>? ?? [],
    );

Map<String, dynamic> _$FamilyToJson(Family instance) => <String, dynamic>{
      'id': instance.id,
      'nameZh': instance.nameZh,
      'nameEn': instance.nameEn,
      'personAssoc': instance.personAssoc,
      'contactInfo': instance.contactInfo.toJson(),
      'members': instance.members,
    };

Gender _$GenderFromJson(Map<String, dynamic> json) => Gender(
      nameZh: json['nameZh'] as String? ?? '',
      nameEn: json['nameEn'] as String? ?? '',
      id: (json['id'] as num?)?.toInt() ?? 0,
      code: json['code'] as String? ?? '',
      enabled: json['enabled'] as bool? ?? false,
      bizTypeAssocs: (json['bizTypeAssocs'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          [],
      bizTypeIds: (json['bizTypeIds'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          [],
      transient: json['transient'] as bool? ?? false,
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$GenderToJson(Gender instance) => <String, dynamic>{
      'nameZh': instance.nameZh,
      'nameEn': instance.nameEn,
      'id': instance.id,
      'code': instance.code,
      'enabled': instance.enabled,
      'bizTypeAssocs': instance.bizTypeAssocs,
      'bizTypeIds': instance.bizTypeIds,
      'transient': instance.transient,
      'name': instance.name,
    };

IdCardType _$IdCardTypeFromJson(Map<String, dynamic> json) => IdCardType(
      nameZh: json['nameZh'] as String? ?? '',
      nameEn: json['nameEn'] as String? ?? '',
      id: (json['id'] as num?)?.toInt() ?? 0,
      code: json['code'] as String? ?? '',
      enabled: json['enabled'] as bool? ?? false,
      bizTypeAssocs: (json['bizTypeAssocs'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          [],
      bizTypeIds: (json['bizTypeIds'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          [],
      transient: json['transient'] as bool? ?? false,
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$IdCardTypeToJson(IdCardType instance) =>
    <String, dynamic>{
      'nameZh': instance.nameZh,
      'nameEn': instance.nameEn,
      'id': instance.id,
      'code': instance.code,
      'enabled': instance.enabled,
      'bizTypeAssocs': instance.bizTypeAssocs,
      'bizTypeIds': instance.bizTypeIds,
      'transient': instance.transient,
      'name': instance.name,
    };

Person _$PersonFromJson(Map<String, dynamic> json) => Person(
      id: (json['id'] as num?)?.toInt() ?? 0,
      nameZh: json['nameZh'] as String? ?? '',
      nameEn: json['nameEn'] as String? ?? '',
      idCardNumber: json['idCardNumber'] as String? ?? '',
      country: json['country'],
      contactInfo: json['contactInfo'] == null
          ? ContactInfo.emptyInstance()
          : ContactInfo.fromJson(json['contactInfo'] as Map<String, dynamic>),
      family: json['family'] == null
          ? Family.emptyInstance()
          : Family.fromJson(json['family'] as Map<String, dynamic>),
      portrait: json['portrait'],
      gender: json['gender'] == null
          ? Gender.emptyInstance()
          : Gender.fromJson(json['gender'] as Map<String, dynamic>),
      idCardType: json['idCardType'] == null
          ? IdCardType.emptyInstance()
          : IdCardType.fromJson(json['idCardType'] as Map<String, dynamic>),
      birthday: json['birthday'],
      nation: json['nation'],
      politicalVisage: json['politicalVisage'],
      age: json['age'],
      nativePlace: json['nativePlace'],
      bank: json['bank'],
      bankAccount: json['bankAccount'],
      trainStationChinaPlace: json['trainStationChinaPlace'],
      trainStation: json['trainStation'],
      healthStatus: json['healthStatus'],
      joinPartyDatePlace: json['joinPartyDatePlace'],
      joinLeagueDatePlace: json['joinLeagueDatePlace'],
      residence: json['residence'],
      residenceNature: json['residenceNature'],
      formerName: json['formerName'],
      namePinyin: json['namePinyin'] as String? ?? '',
      birthPlace: json['birthPlace'],
      remark: json['remark'],
      studyExperiences: json['studyExperiences'] as List<dynamic>? ?? [],
      workExperiences: json['workExperiences'] as List<dynamic>? ?? [],
      maritalStatus: json['maritalStatus'],
      activeSoldier: json['activeSoldier'],
      countryType: json['countryType'],
      backHomeNumber: json['backHomeNumber'],
      ancestralHome: json['ancestralHome'],
      arrivalTime: json['arrivalTime'],
      permanentResident: json['permanentResident'] as bool? ?? false,
      religiousBelief: json['religiousBelief'],
      graduatedSchool: json['graduatedSchool'],
      workCompany: json['workCompany'],
      specialistPositionLevel: json['specialistPositionLevel'],
      leaderPositionLevel: json['leaderPositionLevel'],
      stdLeaders: json['stdLeaders'] as bool? ?? false,
      character: json['character'],
      hobby: json['hobby'],
      specialty: json['specialty'],
      workExperience: json['workExperience'],
      volunteerExperience: json['volunteerExperience'],
    );

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
      'id': instance.id,
      'nameZh': instance.nameZh,
      'nameEn': instance.nameEn,
      'idCardNumber': instance.idCardNumber,
      'country': instance.country,
      'contactInfo': instance.contactInfo.toJson(),
      'family': instance.family.toJson(),
      'portrait': instance.portrait,
      'gender': instance.gender.toJson(),
      'idCardType': instance.idCardType.toJson(),
      'birthday': instance.birthday,
      'nation': instance.nation,
      'politicalVisage': instance.politicalVisage,
      'age': instance.age,
      'nativePlace': instance.nativePlace,
      'bank': instance.bank,
      'bankAccount': instance.bankAccount,
      'trainStationChinaPlace': instance.trainStationChinaPlace,
      'trainStation': instance.trainStation,
      'healthStatus': instance.healthStatus,
      'joinPartyDatePlace': instance.joinPartyDatePlace,
      'joinLeagueDatePlace': instance.joinLeagueDatePlace,
      'residence': instance.residence,
      'residenceNature': instance.residenceNature,
      'formerName': instance.formerName,
      'namePinyin': instance.namePinyin,
      'birthPlace': instance.birthPlace,
      'remark': instance.remark,
      'studyExperiences': instance.studyExperiences,
      'workExperiences': instance.workExperiences,
      'maritalStatus': instance.maritalStatus,
      'activeSoldier': instance.activeSoldier,
      'countryType': instance.countryType,
      'backHomeNumber': instance.backHomeNumber,
      'ancestralHome': instance.ancestralHome,
      'arrivalTime': instance.arrivalTime,
      'permanentResident': instance.permanentResident,
      'religiousBelief': instance.religiousBelief,
      'graduatedSchool': instance.graduatedSchool,
      'workCompany': instance.workCompany,
      'specialistPositionLevel': instance.specialistPositionLevel,
      'leaderPositionLevel': instance.leaderPositionLevel,
      'stdLeaders': instance.stdLeaders,
      'character': instance.character,
      'hobby': instance.hobby,
      'specialty': instance.specialty,
      'workExperience': instance.workExperience,
      'volunteerExperience': instance.volunteerExperience,
    };

BizType _$BizTypeFromJson(Map<String, dynamic> json) => BizType(
      id: (json['id'] as num?)?.toInt() ?? 0,
      nameZh: json['nameZh'] as String? ?? '',
      nameEn: json['nameEn'] as String? ?? '',
    );

Map<String, dynamic> _$BizTypeToJson(BizType instance) => <String, dynamic>{
      'id': instance.id,
      'nameZh': instance.nameZh,
      'nameEn': instance.nameEn,
    };

MngtDepartment _$MngtDepartmentFromJson(Map<String, dynamic> json) =>
    MngtDepartment(
      id: (json['id'] as num?)?.toInt() ?? 0,
      nameZh: json['nameZh'] as String? ?? '',
      nameEn: json['nameEn'] as String? ?? '',
      code: json['code'] as String? ?? '',
      abbrZh: json['abbrZh'] as String? ?? '',
      abbrEn: json['abbrEn'],
      college: json['college'] as bool? ?? false,
      research: json['research'] as bool? ?? false,
      openCourse: json['openCourse'] as bool? ?? false,
      experiment: json['experiment'] as bool? ?? false,
      telephone: json['telephone'],
      address: json['address'],
      indexNo: (json['indexNo'] as num?)?.toInt() ?? 0,
      recruitTypeSet: (json['recruitTypeSet'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      recruitTypes: json['recruitTypes'] as String? ?? '',
    );

Map<String, dynamic> _$MngtDepartmentToJson(MngtDepartment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nameZh': instance.nameZh,
      'nameEn': instance.nameEn,
      'code': instance.code,
      'abbrZh': instance.abbrZh,
      'abbrEn': instance.abbrEn,
      'college': instance.college,
      'research': instance.research,
      'openCourse': instance.openCourse,
      'experiment': instance.experiment,
      'telephone': instance.telephone,
      'address': instance.address,
      'indexNo': instance.indexNo,
      'recruitTypeSet': instance.recruitTypeSet,
      'recruitTypes': instance.recruitTypes,
    };

Education _$EducationFromJson(Map<String, dynamic> json) => Education(
      nameZh: json['nameZh'] as String? ?? '',
      nameEn: json['nameEn'],
      id: (json['id'] as num?)?.toInt() ?? 0,
      code: json['code'] as String? ?? '',
      enabled: json['enabled'] as bool? ?? false,
      bizTypeAssocs: (json['bizTypeAssocs'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          [],
      bizTypeIds: (json['bizTypeIds'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          [],
      transient: json['transient'] as bool? ?? false,
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$EducationToJson(Education instance) => <String, dynamic>{
      'nameZh': instance.nameZh,
      'nameEn': instance.nameEn,
      'id': instance.id,
      'code': instance.code,
      'enabled': instance.enabled,
      'bizTypeAssocs': instance.bizTypeAssocs,
      'bizTypeIds': instance.bizTypeIds,
      'transient': instance.transient,
      'name': instance.name,
    };

StdType _$StdTypeFromJson(Map<String, dynamic> json) => StdType(
      nameZh: json['nameZh'] as String? ?? '',
      nameEn: json['nameEn'],
      id: (json['id'] as num?)?.toInt() ?? 0,
      code: json['code'] as String? ?? '',
      enabled: json['enabled'] as bool? ?? false,
      bizTypeAssocs: (json['bizTypeAssocs'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          [],
      bizTypeIds: (json['bizTypeIds'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          [],
      transient: json['transient'] as bool? ?? false,
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$StdTypeToJson(StdType instance) => <String, dynamic>{
      'nameZh': instance.nameZh,
      'nameEn': instance.nameEn,
      'id': instance.id,
      'code': instance.code,
      'enabled': instance.enabled,
      'bizTypeAssocs': instance.bizTypeAssocs,
      'bizTypeIds': instance.bizTypeIds,
      'transient': instance.transient,
      'name': instance.name,
    };

Department _$DepartmentFromJson(Map<String, dynamic> json) => Department(
      id: (json['id'] as num?)?.toInt() ?? 0,
      nameZh: json['nameZh'] as String? ?? '',
      nameEn: json['nameEn'] as String? ?? '',
      code: json['code'] as String? ?? '',
      abbrZh: json['abbrZh'] as String? ?? '',
      abbrEn: json['abbrEn'],
      college: json['college'] as bool? ?? false,
      research: json['research'] as bool? ?? false,
      openCourse: json['openCourse'] as bool? ?? false,
      experiment: json['experiment'] as bool? ?? false,
      telephone: json['telephone'],
      address: json['address'],
      indexNo: (json['indexNo'] as num?)?.toInt() ?? 0,
      recruitTypeSet: (json['recruitTypeSet'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      recruitTypes: json['recruitTypes'] as String? ?? '',
    );

Map<String, dynamic> _$DepartmentToJson(Department instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nameZh': instance.nameZh,
      'nameEn': instance.nameEn,
      'code': instance.code,
      'abbrZh': instance.abbrZh,
      'abbrEn': instance.abbrEn,
      'college': instance.college,
      'research': instance.research,
      'openCourse': instance.openCourse,
      'experiment': instance.experiment,
      'telephone': instance.telephone,
      'address': instance.address,
      'indexNo': instance.indexNo,
      'recruitTypeSet': instance.recruitTypeSet,
      'recruitTypes': instance.recruitTypes,
    };

Major _$MajorFromJson(Map<String, dynamic> json) => Major(
      id: (json['id'] as num?)?.toInt() ?? 0,
      nameZh: json['nameZh'] as String? ?? '',
      nameEn: json['nameEn'] as String? ?? '',
      code: json['code'] as String? ?? '',
      abbrZh: json['abbrZh'] as String? ?? '',
      abbrEn: json['abbrEn'],
      parent: json['parent'] as bool? ?? false,
      studyYears: (json['studyYears'] as num?)?.toDouble() ?? 0.0,
      schoolingYear: json['schoolingYear'],
      shuntTime: json['shuntTime'],
      majorCertificate: json['majorCertificate'],
      parentMajorAssocs: json['parentMajorAssocs'] as List<dynamic>? ?? [],
      childMajorAssocs: json['childMajorAssocs'] as List<dynamic>? ?? [],
    );

Map<String, dynamic> _$MajorToJson(Major instance) => <String, dynamic>{
      'id': instance.id,
      'nameZh': instance.nameZh,
      'nameEn': instance.nameEn,
      'code': instance.code,
      'abbrZh': instance.abbrZh,
      'abbrEn': instance.abbrEn,
      'parent': instance.parent,
      'studyYears': instance.studyYears,
      'schoolingYear': instance.schoolingYear,
      'shuntTime': instance.shuntTime,
      'majorCertificate': instance.majorCertificate,
      'parentMajorAssocs': instance.parentMajorAssocs,
      'childMajorAssocs': instance.childMajorAssocs,
    };

Adminclass _$AdminclassFromJson(Map<String, dynamic> json) => Adminclass(
      id: (json['id'] as num?)?.toInt() ?? 0,
      nameZh: json['nameZh'] as String? ?? '',
      nameEn: json['nameEn'] as String? ?? '',
      code: json['code'] as String? ?? '',
      grade: json['grade'] as String? ?? '',
      stdCount: (json['stdCount'] as num?)?.toInt() ?? 0,
      planCount: (json['planCount'] as num?)?.toInt() ?? 0,
      enabled: json['enabled'] as bool? ?? false,
      abbrZh: json['abbrZh'],
      abbrEn: json['abbrEn'],
      remark: json['remark'],
    );

Map<String, dynamic> _$AdminclassToJson(Adminclass instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nameZh': instance.nameZh,
      'nameEn': instance.nameEn,
      'code': instance.code,
      'grade': instance.grade,
      'stdCount': instance.stdCount,
      'planCount': instance.planCount,
      'enabled': instance.enabled,
      'abbrZh': instance.abbrZh,
      'abbrEn': instance.abbrEn,
      'remark': instance.remark,
    };

Campus _$CampusFromJson(Map<String, dynamic> json) => Campus(
      id: (json['id'] as num?)?.toInt() ?? 0,
      nameZh: json['nameZh'] as String? ?? '',
      nameEn: json['nameEn'] as String? ?? '',
      code: json['code'] as String? ?? '',
      enabled: json['enabled'] as bool? ?? false,
    );

Map<String, dynamic> _$CampusToJson(Campus instance) => <String, dynamic>{
      'id': instance.id,
      'nameZh': instance.nameZh,
      'nameEn': instance.nameEn,
      'code': instance.code,
      'enabled': instance.enabled,
    };

StdStatus _$StdStatusFromJson(Map<String, dynamic> json) => StdStatus(
      nameZh: json['nameZh'] as String? ?? '',
      nameEn: json['nameEn'],
      id: (json['id'] as num?)?.toInt() ?? 0,
      code: json['code'] as String? ?? '',
      enabled: json['enabled'] as bool? ?? false,
      bizTypeAssocs: (json['bizTypeAssocs'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          [],
      bizTypeIds: (json['bizTypeIds'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          [],
      transient: json['transient'] as bool? ?? false,
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$StdStatusToJson(StdStatus instance) => <String, dynamic>{
      'nameZh': instance.nameZh,
      'nameEn': instance.nameEn,
      'id': instance.id,
      'code': instance.code,
      'enabled': instance.enabled,
      'bizTypeAssocs': instance.bizTypeAssocs,
      'bizTypeIds': instance.bizTypeIds,
      'transient': instance.transient,
      'name': instance.name,
    };

Program _$ProgramFromJson(Map<String, dynamic> json) => Program(
      id: (json['id'] as num?)?.toInt() ?? 0,
      nameZh: json['nameZh'] as String? ?? '',
      nameEn: json['nameEn'],
      grade: json['grade'] as String? ?? '',
      type: json['type'] as String? ?? '',
      enabled: json['enabled'] as bool? ?? false,
      auditState: json['auditState'] as String? ?? '',
      currentNode: json['currentNode'],
    );

Map<String, dynamic> _$ProgramToJson(Program instance) => <String, dynamic>{
      'id': instance.id,
      'nameZh': instance.nameZh,
      'nameEn': instance.nameEn,
      'grade': instance.grade,
      'type': instance.type,
      'enabled': instance.enabled,
      'auditState': instance.auditState,
      'currentNode': instance.currentNode,
    };

StudyForm _$StudyFormFromJson(Map<String, dynamic> json) => StudyForm(
      nameZh: json['nameZh'] as String? ?? '',
      nameEn: json['nameEn'],
      id: (json['id'] as num?)?.toInt() ?? 0,
      code: json['code'] as String? ?? '',
      enabled: json['enabled'] as bool? ?? false,
      bizTypeAssocs: (json['bizTypeAssocs'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          [],
      bizTypeIds: (json['bizTypeIds'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          [],
      transient: json['transient'] as bool? ?? false,
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$StudyFormToJson(StudyForm instance) => <String, dynamic>{
      'nameZh': instance.nameZh,
      'nameEn': instance.nameEn,
      'id': instance.id,
      'code': instance.code,
      'enabled': instance.enabled,
      'bizTypeAssocs': instance.bizTypeAssocs,
      'bizTypeIds': instance.bizTypeIds,
      'transient': instance.transient,
      'name': instance.name,
    };

CultivateType _$CultivateTypeFromJson(Map<String, dynamic> json) =>
    CultivateType(
      nameZh: json['nameZh'] as String? ?? '',
      nameEn: json['nameEn'] as String? ?? '',
      id: (json['id'] as num?)?.toInt() ?? 0,
      code: json['code'] as String? ?? '',
      enabled: json['enabled'] as bool? ?? false,
      bizTypeAssocs: (json['bizTypeAssocs'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          [],
      bizTypeIds: (json['bizTypeIds'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          [],
      transient: json['transient'] as bool? ?? false,
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$CultivateTypeToJson(CultivateType instance) =>
    <String, dynamic>{
      'nameZh': instance.nameZh,
      'nameEn': instance.nameEn,
      'id': instance.id,
      'code': instance.code,
      'enabled': instance.enabled,
      'bizTypeAssocs': instance.bizTypeAssocs,
      'bizTypeIds': instance.bizTypeIds,
      'transient': instance.transient,
      'name': instance.name,
    };

Student _$StudentFromJson(Map<String, dynamic> json) => Student(
      id: (json['id'] as num?)?.toInt() ?? 0,
      studentRecordType: json['studentRecordType'],
      code: json['code'] as String? ?? '',
      grade: json['grade'] as String? ?? '',
      hasXueJi: json['hasXueJi'] as bool? ?? false,
      inSchool: json['inSchool'] as bool? ?? false,
      zaiJi: json['zaiJi'] as bool? ?? false,
      needRegister: json['needRegister'] as bool? ?? false,
      studyYears: (json['studyYears'] as num?)?.toDouble() ?? 0.0,
      enterSchoolDate: json['enterSchoolDate'] as String? ?? '',
      aboardStudentRegisterCode: json['aboardStudentRegisterCode'],
      aboardScholarshipCode: json['aboardScholarshipCode'],
      enterSchoolGrade: (json['enterSchoolGrade'] as num?)?.toInt() ?? 0,
      retirement: json['retirement'] as bool? ?? false,
      retakeTag: json['retakeTag'],
      attendTag: json['attendTag'],
      researchDirection: json['researchDirection'],
      predictEnterDate: json['predictEnterDate'],
      department:
          Department.fromJson(json['department'] as Map<String, dynamic>),
      major: Major.fromJson(json['major'] as Map<String, dynamic>),
      person: Person.fromJson(json['person'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StudentToJson(Student instance) => <String, dynamic>{
      'id': instance.id,
      'studentRecordType': instance.studentRecordType,
      'code': instance.code,
      'grade': instance.grade,
      'hasXueJi': instance.hasXueJi,
      'inSchool': instance.inSchool,
      'zaiJi': instance.zaiJi,
      'needRegister': instance.needRegister,
      'studyYears': instance.studyYears,
      'enterSchoolDate': instance.enterSchoolDate,
      'aboardStudentRegisterCode': instance.aboardStudentRegisterCode,
      'aboardScholarshipCode': instance.aboardScholarshipCode,
      'enterSchoolGrade': instance.enterSchoolGrade,
      'retirement': instance.retirement,
      'retakeTag': instance.retakeTag,
      'attendTag': instance.attendTag,
      'researchDirection': instance.researchDirection,
      'predictEnterDate': instance.predictEnterDate,
      'department': instance.department.toJson(),
      'major': instance.major.toJson(),
      'person': instance.person.toJson(),
    };

Graduate _$GraduateFromJson(Map<String, dynamic> json) => Graduate(
      id: (json['id'] as num?)?.toInt() ?? 0,
      expectedGraduateDate: json['expectedGraduateDate'] as String? ?? '',
      graduateDate: json['graduateDate'],
      result: json['result'],
      certificateCode: json['certificateCode'],
      remark: json['remark'],
      needAudit: json['needAudit'] as bool? ?? false,
      deadlineDate: json['deadlineDate'],
      principalName: json['principalName'],
      principalNameEn: json['principalNameEn'],
      deliveryDate: json['deliveryDate'],
      college: json['college'],
      collegeEn: json['collegeEn'],
      major: json['major'],
      majorEn: json['majorEn'],
      school: json['school'],
      schoolEn: json['schoolEn'],
      schoolCode: json['schoolCode'],
      afterGraduateDir: json['afterGraduateDir'],
      confirmCompanyName: json['confirmCompanyName'],
      student: json['student'] == null
          ? Student.emptyInstance()
          : Student.fromJson(json['student'] as Map<String, dynamic>),
      portraitFileInfo: json['portraitFileInfo'],
    );

Map<String, dynamic> _$GraduateToJson(Graduate instance) => <String, dynamic>{
      'id': instance.id,
      'expectedGraduateDate': instance.expectedGraduateDate,
      'graduateDate': instance.graduateDate,
      'result': instance.result,
      'certificateCode': instance.certificateCode,
      'remark': instance.remark,
      'needAudit': instance.needAudit,
      'deadlineDate': instance.deadlineDate,
      'principalName': instance.principalName,
      'principalNameEn': instance.principalNameEn,
      'deliveryDate': instance.deliveryDate,
      'college': instance.college,
      'collegeEn': instance.collegeEn,
      'major': instance.major,
      'majorEn': instance.majorEn,
      'school': instance.school,
      'schoolEn': instance.schoolEn,
      'schoolCode': instance.schoolCode,
      'afterGraduateDir': instance.afterGraduateDir,
      'confirmCompanyName': instance.confirmCompanyName,
      'student': instance.student.toJson(),
      'portraitFileInfo': instance.portraitFileInfo,
    };

StudentGraduateInfo _$StudentGraduateInfoFromJson(Map<String, dynamic> json) =>
    StudentGraduateInfo(
      id: (json['id'] as num?)?.toInt() ?? 0,
      expectedGraduateDate: json['expectedGraduateDate'] as String? ?? '',
      graduateDate: json['graduateDate'],
      result: json['result'],
      certificateCode: json['certificateCode'],
      remark: json['remark'],
      needAudit: json['needAudit'] as bool? ?? false,
      deadlineDate: json['deadlineDate'],
      principalName: json['principalName'],
      principalNameEn: json['principalNameEn'],
      deliveryDate: json['deliveryDate'],
      college: json['college'],
      collegeEn: json['collegeEn'],
      major: json['major'],
      majorEn: json['majorEn'],
      school: json['school'],
      schoolEn: json['schoolEn'],
      schoolCode: json['schoolCode'],
      afterGraduateDir: json['afterGraduateDir'],
      confirmCompanyName: json['confirmCompanyName'],
    );

Map<String, dynamic> _$StudentGraduateInfoToJson(
        StudentGraduateInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'expectedGraduateDate': instance.expectedGraduateDate,
      'graduateDate': instance.graduateDate,
      'result': instance.result,
      'certificateCode': instance.certificateCode,
      'remark': instance.remark,
      'needAudit': instance.needAudit,
      'deadlineDate': instance.deadlineDate,
      'principalName': instance.principalName,
      'principalNameEn': instance.principalNameEn,
      'deliveryDate': instance.deliveryDate,
      'college': instance.college,
      'collegeEn': instance.collegeEn,
      'major': instance.major,
      'majorEn': instance.majorEn,
      'school': instance.school,
      'schoolEn': instance.schoolEn,
      'schoolCode': instance.schoolCode,
      'afterGraduateDir': instance.afterGraduateDir,
      'confirmCompanyName': instance.confirmCompanyName,
    };
