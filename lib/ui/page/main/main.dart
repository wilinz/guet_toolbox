import 'package:flutter/material.dart';
import 'package:guettoolbox/ui/page/main/home/home.dart';
import 'package:guettoolbox/ui/page/main/profile/profile.dart';
import 'package:guettoolbox/ui/page/main/schedule/schedule.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selected = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          children: [HomePage(), SchedulePage(), ProfilePage()],
          onPageChanged: (index) {
            setState(() {
              selected = index;
            });
          },
          controller: pageController,
        ),
        bottomNavigationBar: NavigationBar(
            destinations: [
              NavigationDestination(
                tooltip: '主页',
                icon: Icon(Icons.home_outlined),
                label: '主页',
                selectedIcon: Icon(Icons.home),
              ),
              NavigationDestination(
                tooltip: '课表',
                icon: Icon(Icons.table_view_outlined),
                label: '课表',
                selectedIcon: Icon(Icons.table_view),
              ),
              NavigationDestination(
                tooltip: '我的',
                icon: Icon(Icons.person_outlined),
                label: '我的',
                selectedIcon: Icon(Icons.person),
              )
            ],
            onDestinationSelected: (index) {
              pageController.jumpToPage(
                index, /*duration: Duration(milliseconds: 200), curve: Curves.linear*/
              );
            },
            selectedIndex: selected));
  }
}
