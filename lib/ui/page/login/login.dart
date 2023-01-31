import 'package:flutter/material.dart';
import 'package:guettoolbox/common/key.dart';
import 'package:guettoolbox/ui/route.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_viewmodel.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginViewModel>(
        create: (context) => LoginViewModel(), child: _LoginPage());
  }
}

class _LoginPage extends StatefulWidget {
  const _LoginPage({Key? key}) : super(key: key);

  @override
  State<_LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<_LoginPage> {
  final TextEditingController _usernameController =
      TextEditingController(text: "");
  final TextEditingController _passwordController =
      TextEditingController(text: "");
  final TextEditingController _vcodeController =
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
    return Consumer<LoginViewModel>(builder: (context, vm, child) {
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
                            border: const OutlineInputBorder(),
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
                                color: Theme.of(context).primaryColorDark,
                              ),
                              onPressed: () {
                                //更新状态控制密码显示或隐藏
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                            ),
                            // helperText: '密码',
                            border: const OutlineInputBorder(),
                          ),
                          validator: (v) {
                            return v!.trim().length > 0 ? null : "密码不能为空";
                          },
                        ),
                        // if (vm.vcode != null)
                        //   Container(
                        //     height: 32,
                        //   ),
                        //   InkWell(
                        //     onTap: (){
                        //       vm.getVcode();
                        //     },
                        //       child: Image.memory(vm.vcode!["content"])),
                        // Container(
                        //   height: 8,
                        // ),
                        // TextFormField(
                        //   controller: _vcodeController,
                        //   autofocus: true,
                        //   decoration: InputDecoration(
                        //       labelText: "验证码",
                        //       hintText: "验证码",
                        //       prefixIcon: Icon(Icons.code)),
                        //   validator: (v) {
                        //     return v!.trim().length > 0 ? null : "验证码不能为空";
                        //   },
                        // ),
                        Container(
                          height: 16,
                        ),
                        Consumer<LoginViewModel>(
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
    SharedPreferences.getInstance().then((sp) {
      _usernameController.text = sp.getString(AppKey.username) ?? "";
      _passwordController.text = sp.getString(AppKey.password) ?? "";
    });
    // LoginViewModel vm = Provider.of(context,listen: false);
    // vm.getVcode();
  }

  Future<void> _login(LoginViewModel loginViewModel, BuildContext context,
      FormState currentState) async {
    if (!currentState.validate()) {
      _loginMessage(context, "请检查输入");
      return;
    }

    SharedPreferences.getInstance().then((sp) {
      sp.setString(AppKey.username, _usernameController.text);
      sp.setString(AppKey.password, _passwordController.text);
    });

    // await loginViewModel.setVcode(_vcodeController.text.trim());
    loginViewModel
        .login(_usernameController.text, _passwordController.text)
        .then((value) {
      _loginMessage(context, value ? "登录成功" : "登录失败");
      final navigator = Navigator.of(context);
      if (navigator.canPop()) {
        navigator.pop();
      } else {
        Navigator.pushReplacementNamed(context, AppRoute.mainPage);
      }
      return value;
    }).onError((error, stackTrace) {
      _loginMessage(context, error.toString());
      return false;
    });
  }
}
