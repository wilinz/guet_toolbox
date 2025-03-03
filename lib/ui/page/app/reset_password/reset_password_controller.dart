import 'dart:async';
import 'package:guethub/logger.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guethub/data/network.dart';
import 'package:guethub/ui/util/toast.dart';

class ResetPasswordController extends GetxController {
  final String username;

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final captchaController = TextEditingController();

  var isLoading = false.obs;
  GlobalKey formKey = GlobalKey<FormState>();
  var passwordVisible = false.obs;

  var isGettingVerificationCode = false.obs;
  var remainingSeconds = 0.obs;

  ResetPasswordController(this.username);

  @override
  void onInit() {
    super.onInit();
    usernameController.text = username;
  }

  Future<void> resetPassword() async {
    final currentState = formKey.currentState as FormState;
    if (!currentState.validate()) {
      toastFailure(message: "please_check_the_input".tr);
      return;
    }
    final dio = await AppNetwork.get().appDio;

    try {
      final resp = await dio.put("/account/password/reset",
          options: Options(responseType: ResponseType.json),
          data: {
            "code": captchaController.text,
            "newPassword": passwordController.text,
            "username": usernameController.text,
          });
      final result = resp.data;
      if (result['code'] == 200) {
        toastSuccess(message: "successful".tr);
        Navigator.pop(Get.context!);
      } else {
        toastFailure(message: "${'failed'.tr}: ${result['msg']}");
      }
    } catch (e) {
      toastFailure(message: "${'failed'.tr}: ${e}");
      logger.e(e);
    }
  }

  sendCode(String email) async {
    if (usernameController.text.trim().isEmpty) {
      toastFailure(message: "please_enter_your_email_address_first".tr);
      return;
    }

    isGettingVerificationCode.value = true;

    final dio = await AppNetwork.get().appDio;
    final resp = await dio.post("/account/verify", data: {
      "codeType": "reset_password",
      "graphicCode": "",
      "phoneOrEmail": email
    });
    final respBody = resp.data;
    if (respBody['code'] == 200) {
      toastSuccess(message: "verification_code_sent_successfully".tr);
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
          message: "${'verification_code_sent_failed'.tr}：${respBody['msg']}");
    }

    isGettingVerificationCode.value = false;
  }
}
