import 'package:flutter/material.dart';
import 'package:guettoolbox/ui/page/login_viewmodel.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController =
      TextEditingController(text: "");
  final TextEditingController _passwordController =
      TextEditingController(text: "");

  _loginSuccessful(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(msg),
        // action: SnackBarAction(label: '撤销', onPressed: Null),
        duration: Duration(milliseconds: 2000)));
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginViewModel>(
      create: (context) => LoginViewModel(),
      child: Scaffold(
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
                child: Column(
                  children: [
                    TextField(
                      controller: _usernameController,
                      autofocus: true,
                      decoration: InputDecoration(
                          labelText: "用户名",
                          hintText: "用户名或邮箱",
                          prefixIcon: Icon(Icons.person)),
                    ),
                    TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                          labelText: "密码",
                          hintText: "您的登录密码",
                          prefixIcon: Icon(Icons.lock)),
                      obscureText: true,
                    ),
                    const SizedBox(
                      width: 0,
                      height: 32,
                      child: Spacer(),
                    ),
                    Consumer<LoginViewModel>(
                      builder: (context, loginViewModel, child) {
                        return ElevatedButton(
                          onPressed: loginViewModel.isLoading
                              ? null
                              : () => _login(loginViewModel, context),
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size(double.infinity, 50)),
                          child: loginViewModel.isLoading
                              ? Text("正在登录...")
                              : Text("登录"),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _login(LoginViewModel loginViewModel, BuildContext context) {
    loginViewModel
        .login(_usernameController.text, _passwordController.text)
        .then((value) => {_loginSuccessful(context, value ? "登录成功" : "登录失败")});
  }
}
