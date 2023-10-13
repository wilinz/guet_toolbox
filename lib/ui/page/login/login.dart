import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guettoolbox/data/service/login.dart';
import 'package:guettoolbox/ui/route.dart';
import 'package:kt_dart/kt.dart';

import 'login_viewmodel.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.popUpAfterSuccess})
      : super(key: key);
  final bool popUpAfterSuccess;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController =
      TextEditingController(text: "");
  final TextEditingController _passwordController =
      TextEditingController(text: "");
  final TextEditingController _vcodeController =
      TextEditingController(text: "");
  GlobalKey _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;

  final c = Get.put(LoginViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("登录"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 400, //宽度尽可能大
            ),
            child: Container(
              padding: const EdgeInsets.all(24),
              child: Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _usernameController,
                        autofocus: true,
                        decoration: InputDecoration(
                          labelText: "用户名",
                          hintText: "您的用户名",
                          prefixIcon: Icon(Icons.person),
                          // helperText: '用户名',
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                        ),
                        validator: (v) {
                          return v!.trim().length > 0 ? null : "账号不能为空";
                        },
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: !_passwordVisible,
                        decoration: InputDecoration(
                          labelText: "密码",
                          hintText: "您的登录密码",
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(
                              //根据passwordVisible状态显示不同的图标
                              _passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              //更新状态控制密码显示或隐藏
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                          ),
                          // helperText: '密码',
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                        ),
                        validator: (v) {
                          return v!.trim().length > 0 ? null : "密码不能为空";
                        },
                      ),
                      Container(
                        height: 16,
                      ),
                      StreamBuilder(
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Text(
                                  snapshot.data! ? "当前处于校园网" : "当前处于非校园网");
                            }
                            return Container();
                          },
                          stream: c.isCampusNetworkState,
                          initialData: null),
                      Container(
                        height: 16,
                      ),
                      Obx(() => ElevatedButton(
                            onPressed: c.isLoading.value
                                ? null
                                : () => _login(context,
                                    _formKey.currentState as FormState),
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(double.infinity, 50)),
                            child: c.isLoading.value
                                ? Text("正在登录...")
                                : Text("登录"),
                          )),
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCodeTextField(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Container(
        //   height: 32,
        // ),
        TextFormField(
            controller: _vcodeController,
            autofocus: true,
            decoration: InputDecoration(
              labelText: "验证码",
              hintText: "验证码",
              prefixIcon: Icon(Icons.code),
              suffixIcon: IconButton(
                  onPressed: () async {
                    final resp =
                        await c.getDynamicCode(_usernameController.text);
                    if (resp.result == "success") {
                      Get.snackbar("成功", "发送成功");
                    } else {
                      Get.snackbar("", resp.returnMessage);
                    }
                  },
                  icon: Icon(Icons.send)),
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16))),
            ),
            validator: (v) {
              return v!.trim().length > 0 ? null : "验证码不能为空";
            }),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    initAsync();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void initAsync() async {
    final recentUser = await c.getRecentUser();
    recentUser?.let((it) {
      _usernameController.text = it.username;
      _passwordController.text = it.password;
    });
  }

  bool isShowCodeEditor = false;

  Future<void> _login(BuildContext context, FormState currentState) async {
    if (!currentState.validate()) {
      Get.snackbar("失败", "请检查输入");
      return;
    }

    try {
      final resp =
          await c.login(_usernameController.text, _passwordController.text);
      Get.snackbar(resp ? "登录成功" : "登录失败", "");
      final navigator = Navigator.of(context);
      if (resp && widget.popUpAfterSuccess) {
        navigator.pop();
      } else {
        Navigator.pushReplacementNamed(context, AppRoute.mainPage);
      }
    } on RequireLoginVerificationCodeException catch (e) {
      final result = await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text("二次验证"),
            content: buildCodeTextField(context),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("取消")),
              TextButton(
                  onPressed: () async {
                    final result = await c.reAuthCheck(_vcodeController.text.trim());
                    if (result.code == "reAuth_success") {
                      Get.snackbar("验证成功", "");
                      Navigator.pop(context, true);
                    } else {
                      Get.snackbar("验证失败", "");
                    }
                  },
                  child: Text("确定")),
            ],
          );
        },
      );
      if (result == true) {
        _login(context, currentState);
        return;
      }
    } catch (e) {
      print(e);
      Get.snackbar("失败", e.toString());
    } finally {
      setState(() {
        c.isLoading.value = false;
        isShowCodeEditor = false;
      });
    }
  }
}
