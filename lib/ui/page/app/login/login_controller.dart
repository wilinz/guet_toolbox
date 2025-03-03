import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:dio/src/response.dart' as dio_response;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:guethub/data/model/app/user/app_user.dart';
import 'package:guethub/data/model/app/user/login_response/login_response.dart';
import 'package:guethub/data/network.dart';
import 'package:guethub/data/repository/app_user.dart';
import 'package:guethub/ui/route.dart';
import 'package:guethub/ui/util/toast.dart';
import 'package:guethub/util/md5.dart';
import 'package:kt_dart/kt.dart';
import 'package:guethub/logger.dart';

class AppLoginController extends GetxController {
  var isLoading = false.obs;
  final TextEditingController usernameController =
      TextEditingController(text: "");
  final TextEditingController passwordController =
      TextEditingController(text: "");
  GlobalKey formKey = GlobalKey<FormState>();
  var passwordVisible = false.obs;
  var isVerificationCodeLogin = false.obs;
  final captchaController = TextEditingController();
  var isGettingVerificationCode = false.obs;
  var remainingSeconds = 0.obs;

  Future<void> login(BuildContext context, FormState currentState,
      String username, String password) async {
    if (!currentState.validate()) {
      toastFailure(message: "请检查输入", gravity: ToastGravity.TOP);
      return;
    }
    final dio = await AppNetwork.get().appDio;

    try {
      dio_response.Response<dynamic>? resp;
      if (isVerificationCodeLogin.value) {
        resp = await dio.post("/account/login_with_code",
            options: Options(responseType: ResponseType.json),
            data: {"username": username, "code": captchaController.text});
      } else {
        resp = await dio.post("/account/login",
            options: Options(responseType: ResponseType.json),
            data: {"username": username, "password": sha256Text(password)});
      }

      final loginResponse = LoginResponse.fromJson(resp.data);
      if (loginResponse.code == 200) {
        toastSuccess(message: "登录成功", gravity: ToastGravity.TOP);
        Navigator.popUntil(
            context, (route) => AppRoute.mainPage == route.settings.name);
        AppUserRepository.get().login(username, loginResponse.data);
      } else {
        toastFailure(message: "登录失败", error: loginResponse.msg, gravity: ToastGravity.TOP);
      }
    } catch (e) {
      toastFailure(message: "登录失败", error: e, gravity: ToastGravity.TOP);
      logger.e(e);
    }
  }

  Future<AppUser?> getRecentUser() async =>
      AppUserRepository.get().getRecentAppUser();

  @override
  Future<void> onInit() async {
    super.onInit();
    final recentUser = await getRecentUser();
    recentUser?.let((it) {
      usernameController.text = it.username;
      passwordController.text = it.password;
    });
  }

  sendCode(String email) async {
    if (usernameController.text.trim().isEmpty) {
      toastFailure(message: "please_enter_your_email_address_first".tr, gravity: ToastGravity.TOP);
      return;
    }

    isGettingVerificationCode.value = true;

    final dio = await AppNetwork.get().appDio;
    final resp = await dio.post("/account/verify",
        data: {"codeType": "login", "graphicCode": "", "phoneOrEmail": email});
    final respBody = resp.data;
    if (respBody['code'] == 200) {
      toastSuccess(message: "verification_code_sent_successfully".tr, gravity: ToastGravity.TOP);
      // 启动倒计时
      const countdownDuration = 60; // 倒计时时长

      remainingSeconds.value = countdownDuration;
      Timer.periodic(Duration(seconds: 1), (timer) {
        remainingSeconds.value = countdownDuration - timer.tick;

        if (remainingSeconds.value == 0) {
          timer.cancel();
        }
      });
    } else {
      toastFailure(
          message: "${'verification_code_sent_failed'.tr}：${respBody['msg']}", gravity: ToastGravity.TOP);
    }

    isGettingVerificationCode.value = false;
  }
}
