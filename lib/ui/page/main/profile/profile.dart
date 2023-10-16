import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guettoolbox/package_info.dart';
import 'package:guettoolbox/ui/page/main/profile/profile_vm.dart';
import 'package:guettoolbox/ui/route.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;
import 'package:url_launcher/url_launcher_string.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with AutomaticKeepAliveClientMixin {
  final c = Get.put(ProfileViewModel());

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("个人主页"),
        actions: [
          PopupMenuButton(
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                child: Text('settings'),
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
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 400),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(8, 8, 8, 0),
                child: Card(
                  child: InkWell(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(AppRoute.loginPage, arguments: true);
                    },
                    child: Container(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Image(
                            image: AssetImage("images/logo.png"),
                            width: 48,
                            height: 48,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Obx(() {
                            final info = c.studentInfo.value;
                            if (info != null) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text((info.studentId) + (info.name)),
                                  SizedBox(height: 4),
                                  Text(info.collegeName),
                                ],
                              );
                            }
                            return Text("请登录");
                          })
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(AppRoute.courseSelectionPage);
                        },
                        leading: Icon(Icons.school_outlined), // Icon for "选课"
                        title: Text("选课"),
                        trailing: Icon(Icons.arrow_forward_ios_outlined),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(AppRoute.pedagogicalEvaluationPage);
                        },
                        leading: Icon(Icons.rate_review_outlined),
                        // Icon for "评教"
                        title: Text("评教"),
                        trailing: Icon(Icons.arrow_forward_ios_outlined),
                      ),
                      ListTile(
                        onTap: () {
                          Get.toNamed(AppRoute.examScoresPage);
                        },
                        leading: Icon(Icons.assignment_outlined), // Icon for "关于"
                        title: Text("成绩单"),
                        trailing: Icon(Icons.arrow_forward_ios_outlined),
                      ),
                      ListTile(
                        onTap: () {
                          Get.toNamed(AppRoute.emptyClassroomPage);
                        },
                        leading: Icon(Icons.meeting_room_outlined), // Icon for "关于"
                        title: Text("空教室"),
                        trailing: Icon(Icons.arrow_forward_ios_outlined),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(AppRoute.campusNetworkPage);
                        },
                        leading: Icon(Icons.wifi_outlined), // Icon for "连接校园网"
                        title: Text("连接校园网"),
                        trailing: Icon(Icons.arrow_forward_ios_outlined),
                      ),
                      ListTile(
                        onTap: () {
                          // Add your functionality for the "关于" tile
                        },
                        leading: Icon(Icons.info_outlined), // Icon for "关于"
                        title: Text("关于"),
                        trailing: Icon(Icons.arrow_forward_ios_outlined),
                      ),
                      ListTile(
                        onTap: () {
                          // Add your functionality for the version tile
                        },
                        leading: Icon(Icons.info_outline),
                        // Icon for the version tile
                        title: Text("版本: ${packageInfo.version}"),
                        trailing: Icon(Icons.arrow_forward_ios_outlined),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(
                          child: Text.rich(
                            TextSpan(children: [
                              TextSpan(
                                  text:
                                      "一个使用 Flutter 开发的 GUET 工具箱，此项目正在开发中，更多信息请关注 "),
                              TextSpan(
                                  text: "https://github.com/wilinz/guet_toolbox",
                                  style: TextStyle(
                                    color: Colors.blue,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      launcher.launchUrl(
                                          Uri.parse(
                                              "https://github.com/wilinz/guet_toolbox"),
                                          mode: LaunchMode.externalApplication);
                                    })
                            ]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    try {
      c.getStudentInfo();
    } catch (e) {
      print(e);
    }
  }

  @override
  bool get wantKeepAlive => true;
}
