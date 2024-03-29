import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dart_extensions/dart_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:guettoolbox/data/database/database.dart';
import 'package:guettoolbox/data/get_storage.dart';
import 'package:guettoolbox/data/network.dart';
import 'package:guettoolbox/data/repository/campus_network.dart';
import 'package:guettoolbox/data/repository/network_detection.dart';
import 'package:guettoolbox/package_info.dart';
import 'package:guettoolbox/path.dart';
import 'package:guettoolbox/ui/color_schemes.g.dart';
import 'package:guettoolbox/ui/route.dart';
import 'package:guettoolbox/ui/settings/settings_controller.dart';
import 'package:guettoolbox/util/platform.dart';
import 'package:window_manager/window_manager.dart';
import 'package:window_size/window_size.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {

  //确保组件树初始化
  WidgetsFlutterBinding.ensureInitialized();
  final t1=DateTime.now();
  await Future.wait([
    initGetStorage(),
    initPackageInfo(),
    initFilePath(),
    () async {
      await initAppDatabase();
      await AppNetwork.init();
    }(),
  ]);
  final t2=DateTime.now();
  print(t2.millisecondsSinceEpoch-t1.millisecondsSinceEpoch);
  if (PlatformUtil.isDesktop()) {
    final padding = 50;
    final screen = await getCurrentScreen();
    print(screen?.visibleFrame.width);
    print(screen?.visibleFrame.height);
    final height =
        (screen?.visibleFrame.height ?? 450 + padding * 2) - padding * 2;
    // 必须加上这一行。
    await windowManager.ensureInitialized();
    WindowOptions windowOptions =
        WindowOptions(size: Size(height * (0.48), height));

    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.setTitleBarStyle(TitleBarStyle.hidden);
      await windowManager.setMinimizable(true);
      await windowManager.setAlignment(Alignment.centerRight);
      await windowManager.setMaximizable(false);
      await windowManager.setResizable(true);
      final position = await windowManager.getPosition();
      await windowManager
          .setPosition(Offset(position.dx - padding, position.dy));
      // await windowManager.setTitleBarStyle(TitleBarStyle.normal,windowButtonVisibility: true);
      await windowManager.show();
      await windowManager.focus();
    });
  }
  NetworkDetectionRepository.get().refresh();
  CampusNetworkRepository.get().refresh();

  runApp(const MyApp());
}

showSnackBar(BuildContext context, String msg, int milliseconds) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
      // action: SnackBarAction(label: '撤销', onPressed: Null),
      duration: Duration(milliseconds: milliseconds)));
}

class MyApp extends StatefulWidget with WindowListener {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WindowListener {
  final settings = Get.put(SettingsController(getStorage));

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    }
    return GetMaterialApp(
        title: 'Guet Toolbox',
        defaultTransition: Transition.cupertino,
        localizationsDelegates: GlobalMaterialLocalizations.delegates,
        supportedLocales: [
          settings.locale.value ?? Get.deviceLocale ?? Locale("zh", "CN"),
        ],
        locale: settings.locale.value ?? Get.deviceLocale,
        theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
        darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
        themeMode: settings.themeMode.value,
        debugShowCheckedModeBanner: false,
        navigatorKey: AppRoute.navigatorKey,
        getPages: AppRoute.routes);
  }

  @override
  void onWindowFocus() {
    // Make sure to call once.
    setState(() {});
    // do something
  }

  StreamSubscription<ConnectivityResult>? subscription;

  @override
  void initState() {
    windowManager.addListener(this);
    super.initState();
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      NetworkDetectionRepository.get().refresh();
      CampusNetworkRepository.get().refresh();
    });
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    subscription?.cancel();
    super.dispose();
  }
}

ScrollBehavior myScrollBehavior(BuildContext context) =>
    ScrollConfiguration.of(context).copyWith(
      dragDevices: PointerDeviceKind.values.toSet(),
    );
