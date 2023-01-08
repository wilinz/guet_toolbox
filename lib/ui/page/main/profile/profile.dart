import 'package:flutter/material.dart';
import 'package:guettoolbox/ui/route.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _ProfilePage();
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

    return Scaffold(
      appBar: AppBar(
        title: Text("个人主页"),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoute.loginPage);
              },
              child: Text("登录")),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoute.courseSelectionPage);
              },
              child: Text("选课")),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoute.pedagogicalEvaluationPage);
              },
              child: Text("评教"))
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
