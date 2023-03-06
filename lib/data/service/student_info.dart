import 'package:guettoolbox/data/model/student/student_info.dart';
import 'package:guettoolbox/data/network.dart';

class StudioInfoService {
  static Future<StudentInfo> get() async {
    final resp = await (await AppNetwork.getDio()).get("student/StuInfo");
    final respData = StudentInfo.fromJson(resp.data);
    return respData;
  }
}
