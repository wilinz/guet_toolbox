import 'package:flutter/material.dart';
import 'package:guettoolbox/ui/page/main/profile/profile_vm.dart';
import 'package:guettoolbox/ui/route.dart';
import 'package:provider/provider.dart';

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
                        Navigator.of(context).pushNamed(AppRoute.loginPage, arguments: true);
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
                                Text((viewModel.studentInfo?.stid ?? "") +
                                    (viewModel.studentInfo?.name ?? "")),
                                SizedBox(height: 4),
                                Text(viewModel.studentInfo?.dptname ?? ""),
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
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(AppRoute.courseSelectionPage);
                          },
                          child: Text("选课")),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(AppRoute.pedagogicalEvaluationPage);
                          },
                          child: Text("评教"))
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
