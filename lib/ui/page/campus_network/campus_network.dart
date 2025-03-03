import 'dart:convert';
import 'package:guethub/logger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guethub/data/model/campus_network/campus_network_auth_response_fail.dart';
import 'package:guethub/data/model/campus_network/campus_network_auth_response_success.dart';
import 'package:guethub/data/repository/campus_network.dart';
import 'package:guethub/data/service/campus_network_auth.dart';
import 'package:guethub/main.dart';
import 'package:guethub/ui/page/campus_network/online_user_info.dart';
import 'package:guethub/ui/util/toast.dart';
import 'package:kt_dart/standard.dart';

import 'campus_network_vm.dart';

class CampusNetworkPage extends StatefulWidget {
  const CampusNetworkPage({Key? key}) : super(key: key);

  @override
  State<CampusNetworkPage> createState() => _CampusNetworkPageState();
}

class _CampusNetworkPageState extends State<CampusNetworkPage> {
  final TextEditingController _usernameController =
  TextEditingController(text: "");
  final TextEditingController _passwordController =
  TextEditingController(text: "");
  GlobalKey _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;
  ISP isp = ISP.campus;

  final c = Get.put(CampusNetworkViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("登录校园网"),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          c.refreshData();
        },
        child: ScrollConfiguration(
          behavior: myScrollBehavior(context),
          child: SingleChildScrollView(
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
                            autofocus: false,
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
                            autofocus: false,
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
                          SizedBox(height: 16),
                          SizedBox(
                            width: double.infinity,
                            child: DropdownButton<ISP>(
                              borderRadius: BorderRadius.circular(16),
                              autofocus: false,
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              value: isp,
                              onChanged: (ISP? newValue) {
                                setState(() {
                                  isp = newValue!;
                                });
                              },
                              items: ISP.values.map((isp) {
                                return DropdownMenuItem(
                                  value: isp,
                                  child: Text(isp.displayName()),
                                );
                              }).toList(),
                            ),
                          ),
                          Container(
                            height: 16,
                          ),
                          Obx(() =>
                              ElevatedButton(
                                onPressed: c.isLoading.value
                                    ? null
                                    : () =>
                                    _login(context,
                                        _formKey.currentState as FormState),
                                style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(double.infinity, 50)),
                                child: c.isLoading.value
                                    ? Text("正在登录...")
                                    : Text("登录"),
                              )),
                          SizedBox(
                            height: 16,
                          ),
                          StreamBuilder(
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Text(
                                      snapshot.data == true
                                          ? "当前处于校园网"
                                          : "当前处于非校园网");
                                }
                                return Container();
                              },
                              stream: c.isCampusNetworkState,
                              initialData: null),
                          StreamBuilder(
                              builder: (context, snapshot) {
                                final data = snapshot.data;
                                return Column(
                                  children: [
                                    Text(data != null
                                        ? "已登录校园网"
                                        : "未登录校园网"),
                                    SizedBox(height: 16),
                                    if (data?.onlineList.firstOrNull != null)
                                      Builder(
                                        builder: (context) {
                                          final info = data!.onlineList.first;
                                          return Column(
                                            children: [
                                              OnlineUserInfoView(
                                                  userInfo: info),
                                              SizedBox(height: 16),
                                              SizedBox(
                                                width: double.infinity,
                                                child: ElevatedButton(onPressed: () {
                                                  c.exitAccount(info);
                                                }, child: Text("退出当前账户")),
                                              )
                                            ],
                                          );
                                        }
                                      )
                                  ],
                                );
                              },
                              stream: c.campusNetworkAuthState,
                              initialData: null),
                          Container(
                            height: 16,
                          ),
                        ],
                      )),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    initAsync();
    CampusNetworkRepository.get().refresh();
  }

  void initAsync() async {
    final recentUser = await c.getRecentUser();
    recentUser?.let((it) {
      setState(() {
        _usernameController.text = it.username;
        _passwordController.text = it.password;
        isp = ISP.valueOf(it.isp);
      });
    });
  }

  Future<void> _login(BuildContext context,
      FormState currentState) async {
    if (!currentState.validate()) {
      toastFailure(message: '失败', error: "请检查输入");
      return;
    }

    try {
      final data = await c.login(
          _usernameController.text, _passwordController.text, isp);
      if (data is CampusNetworkAuthResponseSuccess) {
        toastSuccess(message: '成功');
      } else if (data is CampusNetworkAuthResponseFail) {
        toastFailure(message: '失败', error: data.msga);
      }
    } catch (e) {
      logger.e(e);
      toastFailure(message: '失败', error: e);
    } finally {
      setState(() {
        c.isLoading.value = false;
      });
    }
  }
}
