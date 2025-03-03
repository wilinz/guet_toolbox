import 'dart:async';
import 'package:flutter/material.dart';
import 'package:guethub/data/model/dynamic_code/dynamic_code.dart';
import 'package:guethub/data/repository/login.dart';
import 'package:guethub/logger.dart';
import 'package:guethub/ui/util/toast.dart';

class VerificationCodeDialog extends StatefulWidget {
  const VerificationCodeDialog({super.key, required this.username});

  final String username;

  @override
  State<VerificationCodeDialog> createState() => _VerificationCodeDialogState();
}

class _VerificationCodeDialogState extends State<VerificationCodeDialog> {
  final TextEditingController _vcodeController =
  TextEditingController(text: "");

  DynamicCode? dynamicCode;
  int? codeTime;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("输入短信验证码"),
      content: buildCodeTextField(context, widget.username),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("取消")),
        TextButton(
            onPressed: () async {
              try {
                final code = _vcodeController.text.trim();
                final result = await LoginRepository.get()
                    .reAuthCheck(code);
                if (result.code == "reAuth_success") {
                  toastSuccess(message: "验证成功");
                  Navigator.pop(context, true);
                } else {
                  toastFailure(message: "验证失败，验证码：${code}", error: result.msg);
                }
              } catch (e) {
                logger.e(e);
                toastFailure(message: "验证失败", error: e);
              }
            },
            child: Text("确定")),
      ],
    );
  }

  Widget buildCodeTextField(BuildContext context, String username) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (dynamicCode?.mobile != null)
          Container(
              width: double.infinity,
              alignment: Alignment.centerLeft,
              child: Text("提示：验证码已发送到：${dynamicCode!.mobile}")),
        if (dynamicCode?.mobile == null)
          Container(
              width: double.infinity,
              alignment: Alignment.centerLeft,
              child: Text("提示：点击发送按钮获取短信验证码")),
        Container(
          height: 20,
        ),
        TextFormField(
            controller: _vcodeController,
            autofocus: true,
            decoration: InputDecoration(
              labelText: "验证码",
              hintText: "验证码",
              prefixIcon: Icon(Icons.code),
              suffixIcon: codeTime == null
                  ? IconButton(
                  onPressed: () async {
                    await _sendDynamicCode(username);
                  },
                  icon: Icon(Icons.send))
                  : TextButton(onPressed: null, child: Text("${codeTime}s")),
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16))),
            ),
            validator: (v) {
              return v!.trim().length > 0 ? null : "验证码不能为空";
            }),
      ],
    );
  }

  Future<void> _sendDynamicCode(String username) async {
    final resp = await LoginRepository.get().sendDynamicCode(username);
    setState(() {
      if (resp.result == 'success') {
        toastSuccess(message: resp.returnMessage);
        dynamicCode = resp;
      } else {
        toastFailure(message: resp.returnMessage);
      }
      codeTime = resp.codeTime;
    });
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (codeTime == null) {
        timer.cancel();
      } else {
        setState(() {
          codeTime = codeTime! - 1;
        });
        if (codeTime == 0) {
          timer.cancel();
          setState(() {
            codeTime = null;
          });
        }
      }
    });
  }
}
