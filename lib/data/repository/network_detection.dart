import '../network.dart';
import '../service/network_detection.dart';

class NetworkDetectionRepository {
  bool? _isCampusNetworkCache = null;

  Future<bool?> get isCampusNetwork async {
    return _isCampusNetworkCache ??= await _isCampusNetwork();
  }

  Future<bool> _isCampusNetwork() async {
    return NetworkDetectionService.isCampusNetwork();
  }

  NetworkDetectionRepository._();

  static NetworkDetectionRepository? _instance = null;

  factory NetworkDetectionRepository.getInstance() =>
      _instance ??= NetworkDetectionRepository._();
}
