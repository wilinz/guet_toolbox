import 'package:guettoolbox/data/model/majors_response.dart';
import 'package:guettoolbox/data/service/majors.dart';

class MajorsRepository {
  Future<List<Major>> getMajors() async {
    return MajorsService.get();
  }

  MajorsRepository._();

  static MajorsRepository? _instance = null;

  factory MajorsRepository.getInstance() => _instance ??= MajorsRepository._();
}
