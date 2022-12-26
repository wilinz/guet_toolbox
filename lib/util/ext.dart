import 'package:guettoolbox/data/network.dart';

extension StringExtension on String{
  toWebVpnUrl(){
    // var uri=Uri.parse(this);
    // return "${AppNetwork().webVpnUrl}${uri.scheme}/${WebVPN.encryptHost(this.host)}/"
  }
}