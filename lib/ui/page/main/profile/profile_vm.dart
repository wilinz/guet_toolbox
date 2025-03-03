import 'package:dart_extensions/dart_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:guethub/data/model/app/app_version/app_version.dart';
import 'package:guethub/data/model/app/user/app_user.dart';
import 'package:guethub/data/model/student/student_info.dart';
import 'package:guethub/data/network.dart';
import 'package:guethub/data/repository/app_user.dart';
import 'package:guethub/data/repository/app_version.dart';
import 'package:guethub/data/repository/login.dart';
import 'package:guethub/data/repository/student_info.dart';
import 'package:guethub/data/repository/user.dart';
import 'package:guethub/logger.dart';
import 'package:guethub/ui/util/toast.dart';
import 'package:share_plus/share_plus.dart';

class ProfileViewModel extends GetxController {
  final studentInfo = Rx<StudentInfo?>(null);
  final Rx<AppVersion?> appVersion = Rx<AppVersion?>(null);
  final isUpgradedUndergrad = false.obs;

  Future<StudentInfo> getStudentInfo() async {
    return StudentInfoRepository.get().getStudentInfo().then((value) {
      studentInfo.value = value;
      return value;
    });
  }

  Stream<AppUser?> getActiveUserStream() =>
      AppUserRepository.get().getActiveAppUserStream();

  Future<dynamic> logout() async {
    try {
      final resp = await AppUserRepository.get().logout();
      if (resp['code'] == 200) {
        toastSuccess(message: "成功");
      } else {
        toastFailure(message: "失败", error: resp['msg']);
      }
    } catch (e, st) {
      toastFailure(message: "失败", error: e);
    }
  }

  Future<void> share(BuildContext context) async {
    String text =
        '嘿朋友们，我发现了一个超棒的应用，赶紧来看看吧！\n\n这个应用叫 GUET校园圈 (GUET HUB)，支持 Android 和 IOS。\n\n它有几个非常实用的功能：\n1. 可以直接连接桂电的教务系统，查看课表和成绩。快去官网下载试试吧\n\n内测QQ群：482024244\n\n由于QQ的限制，在QQ里“直接点击”或者“点击后选择跳转浏览器”无法打开链接\n\n需要“长按文本”手动复制链接到浏览器打开！）: \n\nhttps://www.guethub.net\n';

    try {
      final textResponse = await AppNetwork.get()
          .appDio
          .get(AppNetwork.appOSSBaseUrl + "/guethub-assets/share.txt");
      String? t = textResponse.data as String?;
      if (t?.isNotBlank == true) {
        text = t!;
      }
    } catch (e) {
      logger.e(e);
    }

    // '嘿朋友们，我发现了一个超棒的应用，赶紧来看看吧！\n\n这个应用叫 GUET校园圈 (GUET HUB)，支持 Android 和 IOS。\n\n它有几个非常实用的功能：\n1. 可以直接连接桂电的教务系统，查看课表和成绩。\n2. 它是一个校园服务平台，可以帮你处理各种校园周边的服务项目。\n3. 还有一个叫“校园圈”的功能，类似一个论坛，可以在上面和大家交流。\n\n快去官网下载试试吧: https://www.guethub.net');
    final subject = "分享一个好用的课表App";

    final box = context.findRenderObject() as RenderBox?;
    await Share.share(
      text,
      subject: subject,
      sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
    );
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    if (!kIsWeb) {
      checkUpdate();
    }
    LoginRepository.get().onLoginEvent.listen((user) async {
      if (user.isUpgradedUndergrad == true) {
        this.isUpgradedUndergrad.value = true;
      }
      logger.d("登录成功，正在获取个人信息");
      try {
        await getStudentInfo();
      } catch (e) {
        logger.e(e);
      }
    });
    final user = await UserRepository.get().getActiveUser();
    if (user?.isUpgradedUndergrad == true) {
      this.isUpgradedUndergrad.value = true;
    }
    if(user!=null){
      try {
        getStudentInfo();
      } catch (e) {
        logger.e(e);
      }
    }

  }

  Future<void> checkUpdate() async {
    try {
      final appVersion = await AppRepository.get().getAppVersion();
      if (appVersion.code == 200) {
        this.appVersion.value = appVersion.data;
      }
    } catch (e) {
      logger.e(e);
    }
    return null;
  }
}
