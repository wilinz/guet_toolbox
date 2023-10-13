import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guettoolbox/ui/route.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Guet Toolbox"),
        actions: [
          PopupMenuButton(
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                child: Text('settings'.tr),
                value: 'settings',
              ),
            ],
            onSelected: (value) {
              if (value == 'settings') {
                // 导航到设置页面
                Get.toNamed(AppRoute.settingsPage);
              }
            },
          ),
        ],
      ),
      body: Center(
        child: Text("欢迎使用 Guet Toolbox", style: TextStyle(fontSize: 25)),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
