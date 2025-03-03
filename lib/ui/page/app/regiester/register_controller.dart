import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guethub/data/network.dart';
import 'package:guethub/logger.dart';
import 'package:guethub/ui/util/toast.dart';


class RegisterController extends GetxController {
  final String username;
  final String password;

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  var isLoading = false.obs;
  GlobalKey formKey = GlobalKey<FormState>();
  var passwordVisible = false.obs;

  final captchaController = TextEditingController();
  var isGettingVerificationCode = false.obs;
  var remainingSeconds = 0.obs;

  RegisterController(this.username, this.password);

  @override
  void onInit() {
    super.onInit();
    usernameController.text = username;
    passwordController.text = password;
  }

  Future<void> register() async {
    final currentState = formKey.currentState as FormState;
    if (!currentState.validate()) {
      toastFailure(message: "please_check_the_input".tr);
      return;
    }
    final dio = await AppNetwork.get().appDio;

    try {
      final resp = await dio.post("/account/register",
          options: Options(responseType: ResponseType.json),
          data: {
            "code": captchaController.text,
            "password": passwordController.text,
            "username": usernameController.text,
          });
      final result = resp.data;
      if (result['code'] == 200) {
        toastSuccess(message:  "registration_successful".tr);
        Navigator.pop(Get.context!);
      } else {
        toastFailure(message: "${'registration_failed'.tr}: ${result['msg']}");
      }
    } catch (e) {
      toastFailure(message:  "${'registration_failed'.tr}: ${e}");
      logger.e(e);
    }
  }

  sendCode(String email) async {
    if (usernameController.text.trim().isEmpty) {
      toastFailure(message:  "please_enter_your_email_address_first".tr);
      return;
    }

    isGettingVerificationCode.value = true;

    final dio = await AppNetwork.get().appDio;
    final resp = await dio.post("/account/verify",
        data: {"codeType": "register", "graphicCode": "", "phoneOrEmail": email});
    final respBody = resp.data;
    if (respBody['code'] == 200) {
      toastSuccess(message:  "verification_code_sent_successfully".tr);
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
      toastFailure(message:  "${'verification_code_sent_failed'.tr}：${respBody['msg']}");
    }

    isGettingVerificationCode.value = false;
  }
}