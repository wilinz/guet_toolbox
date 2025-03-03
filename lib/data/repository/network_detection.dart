import 'dart:async';

import 'package:rxdart/rxdart.dart';

import '../network.dart';
import '../service/network_detection.dart';

class NetworkDetectionRepository {

  bool? get isCampusNetworkCache => isCampusNetworkState.valueOrNull;

  BehaviorSubject<bool?> _isCampusNetworkStateController = BehaviorSubject<bool?>();
  ValueStream<bool?> get isCampusNetworkState => _isCampusNetworkStateController.stream;

  Future<bool?> get isCampusNetwork async {
    if (isCampusNetworkCache == null) await refresh();
    return isCampusNetworkCache;
  }

  refresh() async {
    _isCampusNetworkStateController.add(await _isCampusNetwork());
  }

  Future<bool> _isCampusNetwork() async {
    return NetworkDetectionService.isCampusNetwork();
  }

  NetworkDetectionRepository._();

  static NetworkDetectionRepository? _instance = null;

  factory NetworkDetectionRepository.get() =>
      _instance ??= NetworkDetectionRepository._();
}
