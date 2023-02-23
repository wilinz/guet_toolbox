import '../network.dart';
import '../service/network_detection.dart';

class NetworkDetectionRepository {
  bool? _isCampusNetworkCache = null;

  Future<bool?> get isCampusNetwork async {
    if (_isCampusNetworkCache == null) {
      await _isCampusNetwork();
    }
    return _isCampusNetworkCache;
  }

  Future<bool> _isCampusNetwork() async {
    return NetworkDetectionService.isCampusNetwork().then((value) {
      _isCampusNetworkCache = value;
      return value;
    });
  }

  NetworkDetectionRepository._();

  static NetworkDetectionRepository? _instance = null;

  factory NetworkDetectionRepository.getInstance() =>
      _instance ??= NetworkDetectionRepository._();
}
