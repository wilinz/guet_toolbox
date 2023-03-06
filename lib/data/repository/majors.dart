import 'package:guettoolbox/data/model/majors/majors_response.dart';
import 'package:guettoolbox/data/service/majors.dart';

class MajorsRepository {
  List<Major> majorCache = [];

  Future<List<Major>> getMajors() async {
    if (majorCache.isNotEmpty) return majorCache;
    majorCache = await MajorsService.get();
    return majorCache;
  }

  MajorsRepository._();

  static MajorsRepository? _instance = null;

  factory MajorsRepository.getInstance() => _instance ??= MajorsRepository._();
}
