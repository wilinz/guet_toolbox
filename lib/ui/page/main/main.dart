import 'package:flutter/material.dart';
import 'package:guettoolbox/ui/page/main/home/home.dart';
import 'package:guettoolbox/ui/page/main/profile/profile.dart';
import 'package:guettoolbox/ui/page/main/schedule/schedule.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _MainPage();
  }
}

class _MainPage extends StatefulWidget {
  const _MainPage({Key? key}) : super(key: key);

  @override
  State<_MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<_MainPage> {
  int selected = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [HomePage(), SchedulePage(), ProfilePage()],
        onPageChanged: (index) {
          setState(() {
            selected = index;
          });
        },
        controller: pageController,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "主页"),
          BottomNavigationBarItem(icon: Icon(Icons.table_view), label: "课表"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "我的")
        ],
        onTap: (index) {
          if (index != selected) {
            pageController.animateToPage(index,
                duration: Duration(milliseconds: 200), curve: Curves.linear);
          }
        },
        currentIndex: selected,
      ),
    );
  }
}
