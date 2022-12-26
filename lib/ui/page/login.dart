import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
              child: Column(
                children: [
                  const TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                        labelText: "用户名",
                        hintText: "用户名或邮箱",
                        prefixIcon: Icon(Icons.person)),
                  ),
                  const TextField(
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
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50)),
                    child: const Text("登录"),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
