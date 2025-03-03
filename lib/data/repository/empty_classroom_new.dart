import 'package:dart_extensions/dart_extensions.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:guethub/common/list.dart';
import 'package:guethub/data/model/empty_classroom/empty_classroom.dart';
import 'package:guethub/data/model/empty_classroom/empty_classroom_buildings/empty_classroom_buildings.dart';
import 'package:guethub/data/model/empty_classroom/empty_classroom_config/empty_classroom_config.dart';
import 'package:guethub/data/model/empty_classroom/empty_classroom_query_body/empty_classroom_query_body.dart';
import 'package:guethub/data/model/empty_classroom/empty_classroom_query_result/empty_classroom_query_result.dart';
import 'package:guethub/data/model/empty_classroom/empty_classroom_rooms/empty_classroom_rooms.dart';
import 'package:guethub/data/service/empty_classroom_new.dart';
import 'package:guethub/util/js.dart';
import 'package:guethub/util/string_ext.dart';
import 'package:html/parser.dart' as htmlParser;
import 'package:guethub/data/network.dart';
import 'package:html/parser.dart';
import 'package:json5/json5.dart';

class EmptyClassroomNewRepository {
  Dio get dio => AppNetwork.get().bkjwTestDio;

  Future<EmptyClassroomQueryResult> queryEmptyClassroom(
          {required EmptyClassroomQueryBody body}) =>
      EmptyClassroomNewService.queryEmptyClassroom(dio, body: body);

  Future<List<EmptyClassroomRoom>> getEmptyClassroomRooms(
          {required int buildingId,
          bool hasDataPermission = false,
          bool hasUsableDepartPermission = false}) async =>
      EmptyClassroomNewService.getEmptyClassroomRooms(dio,
          buildingId: buildingId);

  Future<List<EmptyClassroomBuilding>> getEmptyClassroomBuildings(
          {required int campusId, bool hasDataPermission = false}) async =>
      EmptyClassroomNewService.getEmptyClassroomBuildings(dio,
          campusId: campusId);

  Future<EmptyClassroomConfig> getEmptyClassroomConfig() async =>
      EmptyClassroomNewService.getEmptyClassroomConfig(dio);

  EmptyClassroomNewRepository._create();

  static EmptyClassroomNewRepository? _instance;

  factory EmptyClassroomNewRepository.get() =>
      _instance ??= EmptyClassroomNewRepository._create();
}
