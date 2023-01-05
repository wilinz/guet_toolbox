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
    return Column(
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
            child: Text("选课"))
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
