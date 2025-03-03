import 'dart:io';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guethub/check_update.dart';
import 'package:guethub/data/get_storage.dart';
import 'package:guethub/data/model/background_image/background_image.dart';
import 'package:guethub/data/repository/app_version.dart';
import 'package:guethub/data/repository/background_image.dart';
import 'package:guethub/package_info.dart';
import 'package:guethub/path.dart';
import 'package:guethub/ui/page/main/forum/forum_page.dart';
import 'package:guethub/ui/page/main/profile/profile.dart';
import 'package:guethub/ui/page/main/schedule/schedule.dart';
import 'package:guethub/ui/page/theme/theme_ext.dart';
import 'package:path/path.dart';import 'package:guethub/logger.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  static const String lastShowChangelogVersionCodeKey =
      'lastShowChangelogVersionCode';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selected = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<BackgroundImageInfo?>(
        stream: BackgroundImageRepository.get().backgroundImageInfoListener,
        builder: (context, backgroundImageInfo) {
          bool isMainPageHasBackgroundImage() =>
              backgroundImageInfo.data?.enable == true && selected == 0;

          final backgroundImageAbsolutePath = isMainPageHasBackgroundImage()
              ? join(applicationSupportDirectory.path,
                  backgroundImageInfo.data!.path)
              : null;
          Color backgroundColor() => Theme.of(context)
              .colorScheme
              .surface
              .adaptiveBackgroundColor(isMainPageHasBackgroundImage());

          final theme = Theme.of(context);
          final Color textColor = isMainPageHasBackgroundImage()
              ? Colors.white
              : theme.colorScheme.onSurface;

          return Theme(
            data: isMainPageHasBackgroundImage()
                ? buildTransparentTheme(theme, backgroundColor, textColor,
                    isMainPageHasBackgroundImage)
                : theme,
            child: Stack(
              children: [
                SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Container(
                      color: theme.colorScheme.surface,
                    )),
                if (isMainPageHasBackgroundImage())
                  SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: ExtendedImage.file(
                      imageCacheName: backgroundImageInfo.data!.path,
                      // cacheRawData: true,
                      File(backgroundImageAbsolutePath!),
                      fit: BoxFit.cover,
                    ),
                  ),
                Scaffold(
                    body: PageView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        /*HomePage(),*/
                        SchedulePage(globalTheme: theme),
                        ForumPage(),
                        ProfilePage()
                      ],
                      onPageChanged: (index) {
                        setState(() {
                          selected = index;
                        });
                      },
                      controller: pageController,
                    ),
                    bottomNavigationBar: NavigationBar(
                        destinations: [
                          // NavigationDestination(
                          //   tooltip: '主页',
                          //   icon: Icon(Icons.home_outlined),
                          //   label: '主页',
                          //   selectedIcon: Icon(Icons.home),
                          // ),
                          NavigationDestination(
                            tooltip: '课表',
                            icon: Icon(Icons.table_view_outlined),
                            label: '课表',
                            selectedIcon: Icon(Icons.table_view),
                          ),
                          NavigationDestination(
                            tooltip: 'GUETHUB',
                            icon: Icon(Icons.chat_outlined),
                            label: 'HUB',
                            selectedIcon: Icon(Icons.chat),
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
                        selectedIndex: selected)),
              ],
            ),
          );
        });
  }

  ThemeData buildTransparentTheme(ThemeData theme, Color backgroundColor(),
      Color textColor, bool isMainPageHasBackgroundImage()) {
    final shadow = <Shadow>[
      Shadow(
        offset: Offset(0.0, 0.0), // 阴影偏移量
        blurRadius: 8.0, // 阴影模糊半径
        color: Colors.grey.withOpacity(1), // 阴影颜色及透明度
      ),
    ];
    return theme.copyWith(
      scaffoldBackgroundColor: backgroundColor(),
      appBarTheme: theme.appBarTheme.copyWith(
        backgroundColor: backgroundColor(),
        titleTextStyle: theme.textTheme.titleLarge
            ?.copyWith(color: textColor, shadows: shadow),
        iconTheme: IconThemeData(
            color: Colors.white, // 将Icon颜色设置为白色
            shadows: shadow),
      ),
      colorScheme: theme.colorScheme.copyWith(
        onSurface: textColor,
        onBackground: textColor,
        onPrimary: textColor,
        onSecondary: textColor,
        onTertiary: textColor,
      ),
      iconTheme: IconThemeData(
          color: Colors.white, // 将Icon颜色设置为白色
          shadows: shadow),
      popupMenuTheme: PopupMenuThemeData(
        color: Color(0x55aaaaaa), // 设置为透明色
        textStyle: TextStyle(
          color: Colors.white, // 全局设置文字为白色
        ),
        iconColor: Colors.white,
      ),
      listTileTheme:
          ListTileThemeData(textColor: Colors.white, iconColor: Colors.white),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: backgroundColor(),
        indicatorColor:
            isMainPageHasBackgroundImage() ? Color(0x66aaaaaa) : null,
        labelTextStyle: MaterialStateProperty.all(
          theme.textTheme.bodySmall?.copyWith(
              color: Colors.white, // 设置文字颜色为白色
              shadows: shadow),
        ),
        iconTheme: MaterialStateProperty.all(
          IconThemeData(
              color: Colors.white, // 设置图标颜色为白色
              shadows: shadow),
        ),
      ),
      dialogTheme: DialogTheme(
          titleTextStyle: theme.textTheme.titleLarge?.copyWith(
        color: theme.colorScheme.onSurface,
      )),
      textTheme: TextTheme(
        displayLarge: TextStyle(color: textColor, shadows: shadow),
        displayMedium: TextStyle(color: textColor, shadows: shadow),
        displaySmall: TextStyle(color: textColor, shadows: shadow),
        headlineLarge: TextStyle(color: textColor, shadows: shadow),
        headlineMedium: TextStyle(color: textColor, shadows: shadow),
        headlineSmall: TextStyle(color: textColor, shadows: shadow),
        titleLarge: TextStyle(color: textColor, shadows: shadow),
        titleMedium: TextStyle(color: textColor, shadows: shadow),
        titleSmall: TextStyle(color: textColor, shadows: shadow),
        bodyLarge: TextStyle(color: textColor, shadows: shadow),
        bodyMedium: TextStyle(color: textColor, shadows: shadow),
        bodySmall: TextStyle(color: textColor, shadows: shadow),
        labelLarge: TextStyle(color: textColor, shadows: shadow),
        labelMedium: TextStyle(color: textColor, shadows: shadow),
        labelSmall: TextStyle(color: textColor, shadows: shadow),
      ),
    );
  }

  bool isHideVersion(int versionCode) {
    final int isHideVersion = getStorage.read('isHideVersion') ?? -1;
    return isHideVersion == versionCode;
  }

  Future<void> checkUpdate() async {
    BuildContext content = Get.context!;
    try {
      final appVersion = await AppRepository.get().getAppVersion();
      if (appVersion.code == 200) {
        final String currentVersionCode = packageInfo.buildNumber;
        final String? lastShowChangelogVersionCode =
            getStorage.read(MainPage.lastShowChangelogVersionCodeKey);

        if (appVersion.data.isHasNewVersion(packageInfo) &&
            !isHideVersion(appVersion.data.versionCode) &&
            appVersion.data.enabledSystem
                .contains(Platform.operatingSystem.toLowerCase())) {
          showDialog(
              context: content,
              barrierDismissible: !appVersion.data.isForce,
              builder: (context) => PopScope(
                  canPop: !appVersion.data.isForce,
                  child: UpdateDialog(appVersion: appVersion.data)));
        } else if (currentVersionCode != lastShowChangelogVersionCode) {
          // Show the update log if the version has changed
          showDialog(
              context: content,
              barrierDismissible: true,
              builder: (context) =>
                  VersionChangelogWidget(changelog: appVersion.data.changelog));
          // Save the current version code
          getStorage.write(
              MainPage.lastShowChangelogVersionCodeKey, currentVersionCode);
        }
      }
    } catch (e, st) {
      logger.e(e);
      print(st);
    }
  }

  @override
  void initState() {
    super.initState();
    migrateLastShowChangelogVersionCodeKey();
    if (!kIsWeb) {
      checkUpdate();
    }
  }

  void migrateLastShowChangelogVersionCodeKey() {
    try {
      final String? lastShowChangelogVersionCode =
          getStorage.read('lastVersionCode');
      if (lastShowChangelogVersionCode != null) {
        getStorage.remove('lastVersionCode');
        getStorage.write(MainPage.lastShowChangelogVersionCodeKey,
            lastShowChangelogVersionCode);
      }
    } catch (e) {
      logger.e(e);
    }
  }
}
