import 'package:flutter/material.dart';
import 'package:guettoolbox/data/model/campus_network/campus_network_auth_response_fail.dart';
import 'package:guettoolbox/data/model/campus_network/campus_network_auth_response_success.dart';
import 'package:guettoolbox/data/service/campus_network_auth.dart';
import 'package:kt_dart/standard.dart';
import 'package:provider/provider.dart';

import 'campus_network_vm.dart';

class CampusNetworkPage extends StatelessWidget {
  const CampusNetworkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CampusNetworkViewModel>(
      create: (context) => CampusNetworkViewModel(),
      child: _CampusNetworkPage(),
    );
  }
}

class _CampusNetworkPage extends StatefulWidget {
  const _CampusNetworkPage({Key? key}) : super(key: key);

  @override
  State<_CampusNetworkPage> createState() => _CampusNetworkPageState();
}

class _CampusNetworkPageState extends State<_CampusNetworkPage> {
  final TextEditingController _usernameController =
      TextEditingController(text: "");
  final TextEditingController _passwordController =
      TextEditingController(text: "");
  GlobalKey _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;

  _loginMessage(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(msg),
        // action: SnackBarAction(label: '撤销', onPressed: Null),
        duration: Duration(milliseconds: 2000)));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CampusNetworkViewModel>(builder: (context, vm, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("登录校园网"),
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
                                color: Theme.of(context).primaryColor,
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
                        FutureBuilder(
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Text(
                                    snapshot.data! ? "当前处于校园网" : "当前处于非校园网");
                              }
                              return Container();
                            },
                            future: vm.isCampusNetwork,
                            initialData: null),
                        Container(
                          height: 16,
                        ),
                        Consumer<CampusNetworkViewModel>(
                          builder: (context, loginViewModel, child) {
                            return ElevatedButton(
                              onPressed: loginViewModel.isLoading
                                  ? null
                                  : () => _login(loginViewModel, context,
                                      _formKey.currentState as FormState),
                              style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(double.infinity, 50)),
                              child: loginViewModel.isLoading
                                  ? Text("正在登录...")
                                  : Text("登录"),
                            );
                          },
                        )
                      ],
                    )),
              ),
            ),
          ),
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    initAsync();
  }

  void initAsync() async {
    CampusNetworkViewModel vm = Provider.of(context, listen: false);
    final recentUser = await vm.getRecentUser();
    recentUser?.let((it) {
      _usernameController.text = it.username;
      _passwordController.text = it.password;
    });
  }

  Future<void> _login(CampusNetworkViewModel vm, BuildContext context,
      FormState currentState) async {
    if (!currentState.validate()) {
      _loginMessage(context, "请检查输入");
      return;
    }

    final data = await vm.login(
        _usernameController.text, _passwordController.text, ISP.campus);
    if (data is CampusNetworkAuthResponseSuccess) {
      _loginMessage(context, "登录成功");
    } else if (data is CampusNetworkAuthResponseFail) {
      _loginMessage(context, "登录失败: ${data.msga}");
    }
    setState(() {
      vm.isLoading = false;
    });
  }
}
