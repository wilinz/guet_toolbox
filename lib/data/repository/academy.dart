import 'package:guettoolbox/data/model/academy_response.dart';
import 'package:guettoolbox/data/model/majors_response.dart';
import 'package:guettoolbox/data/service/academy.dart';
import 'package:guettoolbox/data/service/majors.dart';

class AcademyRepository {
  Future<List<Academy>> getAcademy() async {
    final data = await AcademyService.get();
    data.sort((i, j) {
      return int.parse(i.dptno).compareTo(int.parse(j.dptno));
    });
    return data;
  }

  AcademyRepository._();

  static AcademyRepository? _instance = null;

  factory AcademyRepository.getInstance() =>
      _instance ??= AcademyRepository._();
}
