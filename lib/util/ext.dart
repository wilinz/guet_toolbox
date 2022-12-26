import 'package:guettoolbox/data/network.dart';

import '../common/encrypt/webvpn.dart';

extension UriExtension on Uri {
  toWebVpnUrl() {
    return Uri.parse(
        "${AppNetwork.webVpnUrl}$scheme/${WebVPN.encryptHost(host)}/");
  }
}
