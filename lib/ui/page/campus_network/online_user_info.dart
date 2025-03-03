import 'package:flutter/material.dart';
import 'package:guethub/data/model/campus_network/campus_network_auth_online_list.dart';
import 'package:guethub/data/service/campus_network_auth.dart';
import 'package:guethub/ui/widget/selection_transformer.dart';
import 'package:intl/intl.dart';
import 'package:kt_dart/collection.dart';

class OnlineUserInfoView extends StatelessWidget {
  final OnlineUserInfo userInfo;

  const OnlineUserInfoView({Key? key, required this.userInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = splitUserAccount(userInfo.userAccount);
    final children = [
      buildInfoRow('用户账号', user.first),
      buildInfoRow('网络类型', user.second.displayName()),
      buildInfoRow('在线会话', userInfo.onlineSession.toString()),
      buildInfoRow('登录时间', userInfo.onlineTime),
      buildInfoRow('IP地址', userInfo.onlineIp),
      buildInfoRow('在线时长', formatTimeLong(userInfo.timeLong)),
      buildInfoRow('上行流量', formatBytes(userInfo.uplinkBytes)),
      buildInfoRow('下行流量', formatBytes(userInfo.downlinkBytes)),
    ];
    return SelectionArea(
      child: SelectionTransformer.tabular(
        columns: children.length,
        child: Table(
          columnWidths: {
            0: FlexColumnWidth(3),
            1: FlexColumnWidth(7),
          },
          children: children,
        ),
      ),
    );
  }

  KtPair<String, ISP> splitUserAccount(String account) {
    if (!account.contains("@")) return KtPair(account, ISP.campus);
    final split = account.split("@");
    return KtPair(split[0], ISP.valueOf(split[1]));
  }

  String getDisplayText(String text) => text.isNotEmpty ? text : " ";

  TableRow buildInfoRow(String label, String value) {
    return TableRow(
      children: [
        TableCell(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              '$label：',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        TableCell(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(getDisplayText(value)),
          ),
        ),
      ],
    );
  }

  String formatTimeLong(String timeLong) {
    final seconds = int.tryParse(timeLong) ?? 0;
    final duration = Duration(seconds: seconds);
    final formattedDuration = durationToString(duration);
    return formattedDuration;
  }

  String formatBytes(String bytesString) {
    final bytes = int.tryParse(bytesString) ?? 0;
    final formattedBytes = bytesToReadableString(bytes);
    return formattedBytes;
  }

  String formatIsOwnerIp(String isOwnerIp) {
    return isOwnerIp == '1' ? '是' : '否';
  }

  String durationToString(Duration duration) {
    final hours = duration.inHours;
    final minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$hours:$minutes:$seconds';
  }

  String bytesToReadableString(int bytes) {
    if (bytes < 1024) {
      return '$bytes B';
    } else if (bytes < 1024 * 1024) {
      final kilobytes = (bytes / 1024).toStringAsFixed(2);
      return '$kilobytes KB';
    } else if (bytes < 1024 * 1024 * 1024) {
      final megabytes = (bytes / (1024 * 1024)).toStringAsFixed(2);
      return '$megabytes MB';
    } else {
      final gigabytes = (bytes / (1024 * 1024 * 1024)).toStringAsFixed(2);
      return '$gigabytes GB';
    }
  }
}
