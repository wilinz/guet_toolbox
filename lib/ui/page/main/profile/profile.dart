import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guettoolbox/ui/page/main/profile/profile_vm.dart';
import 'package:guettoolbox/ui/route.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;
import 'package:url_launcher/url_launcher_string.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileViewModel(),
      child: _ProfilePage(),
    );
  }
}

class _ProfilePage extends StatefulWidget {
  const _ProfilePage({Key? key}) : super(key: key);

  @override
  State<_ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<_ProfilePage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Consumer<ProfileViewModel>(builder: (context, viewModel, child) {
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
                  margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
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
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text((viewModel.studentInfo?.studentId ?? "") +
                                    (viewModel.studentInfo?.name ?? "")),
                                SizedBox(height: 4),
                                Text(viewModel.studentInfo?.collegeName ?? ""),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(AppRoute.courseSelectionPage);
                            },
                            child: Text("选课")),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed(
                                  AppRoute.pedagogicalEvaluationPage);
                            },
                            child: Text("评教")),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed(
                                  AppRoute.campusNetworkPage);
                            },
                            child: Text("连接校园网")),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Center(
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
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    final vm = Provider.of<ProfileViewModel>(context, listen: false);
    vm.getStudentInfo();
  }

  @override
  bool get wantKeepAlive => true;
}
