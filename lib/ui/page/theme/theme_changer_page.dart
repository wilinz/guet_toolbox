import 'dart:io';
import 'dart:ui';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:guethub/ui/page/theme/theme_ext.dart';
import 'package:guethub/ui/util/toast.dart';
import 'theme_changer_controller.dart';

class ThemeChangerPage extends StatefulWidget {
  @override
  State<ThemeChangerPage> createState() => _ThemeChangerPageState();
}

class _ThemeChangerPageState extends State<ThemeChangerPage> {
  bool _isResetButtonPressed = false;
  bool _isApplyButtonPressed = false;

  @override
  void initState() {
    super.initState();
    final c = Get.find<ThemeController>();
    c.initializeTheme();
  }

  @override
  void dispose() {
    final c = Get.find<ThemeController>();
    c.clearCacheFile();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final c = Get.put(ThemeController());
    final globalContent = context;

    return Obx(() => PopScope(
          canPop: c.lastBackgroundImage.value?.path ==
                  c.backgroundImage.value?.path ||
              c.backgroundImage.value?.path == null,
          onPopInvoked: (shouldPop) async {
            if (!shouldPop) {
              bool? shouldApply = await showApplyChangesDialog(context);
              if (shouldApply == true) {
                await c.changeThemeToImageBackground();
              }
              if (shouldApply != null) {
                Navigator.of(context).pop();
              }
              return;
            }
          },
          child: Obx(() {
            bool isHasBackgroundImage() => c.backgroundImage.value != null;

            final theme = Theme.of(context);
            final Color textColor = isHasBackgroundImage()
                ? Colors.white
                : theme.colorScheme.onSurface;

            Color backgroundColor() => Theme.of(context)
                .colorScheme
                .surface
                .adaptiveBackgroundColor(c.backgroundImage.value != null);
            return Theme(
              data: isHasBackgroundImage()
                  ? buildTransparentTheme(
                      theme, backgroundColor, textColor, isHasBackgroundImage)
                  : theme,
              child: Builder(builder: (context) {
                return Stack(
                  children: [
                    SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: Container(
                          color: theme.colorScheme.surface,
                        )),
                    if (isHasBackgroundImage())
                      SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: ExtendedImage.file(
                          imageCacheName: c.backgroundImage.value!.path,
                          // cacheRawData: true,
                          File(c.backgroundImage.value!.path),
                          fit: BoxFit.cover,
                        ),
                      ),
                    Scaffold(
                      appBar: AppBar(
                        title: Text('主题管理'),
                      ),
                      body: Column(
                        children: [
                          Obx(() => ListTile(
                                title: Text('主题模式'),
                                trailing: DropdownButton2<ThemeMode>(
                                  buttonStyleData: ButtonStyleData(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8))),
                                  dropdownStyleData: DropdownStyleData(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8))),
                                  value: c.themeMode.value,
                                  iconStyleData: IconStyleData(
                                    icon: Icon(
                                      Icons.arrow_drop_down,
                                      color: Theme.of(context).iconTheme.color,
                                    ),
                                  ),
                                  items: [
                                    DropdownMenuItem(
                                      value: ThemeMode.system,
                                      child: Text('跟随系统'),
                                    ),
                                    DropdownMenuItem(
                                      value: ThemeMode.light,
                                      child: Text('浅色模式'),
                                    ),
                                    DropdownMenuItem(
                                      value: ThemeMode.dark,
                                      child: Text('深色模式'),
                                    ),
                                  ],
                                  onChanged: (value) {
                                    if (value != null) {
                                      c.changeThemeMode(value);
                                    }
                                  },
                                ),
                              )),
                          ListTile(
                            title: Text('浅色模式主色调'),
                            trailing: Obx(() => ColorIndicator(
                                  color: c.lightPrimaryColor.value,
                                  onSelect: () async {
                                    final Color newColor =
                                        await showColorPickerDialog(
                                      globalContent,
                                      c.lightPrimaryColor.value,
                                      title: Text('选择浅色模式主色调'),
                                    );
                                    c.changeLightPrimaryColor(newColor);
                                  },
                                )),
                          ),
                          ListTile(
                            title: Text('深色模式主色调'),
                            trailing: Obx(() => ColorIndicator(
                                  color: c.darkPrimaryColor.value,
                                  onSelect: () async {
                                    final Color newColor =
                                        await showColorPickerDialog(
                                      globalContent,
                                      c.darkPrimaryColor.value,
                                      title: Text('选择深色模式主色调'),
                                    );
                                    c.changeDarkPrimaryColor(newColor);
                                  },
                                )),
                          ),
                          Container(
                            margin: EdgeInsets.all(16),
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: () {
                                  c.pickBackgroundImage();
                                },
                                child: Text("选择自定义背景图片")),
                          ),
                          if (c.backgroundImage.value != null)
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 16),
                              width: double.infinity,
                              child: ElevatedButton(
                                  onPressed: () {
                                    if (_isResetButtonPressed) {
                                      // Clear the background image
                                      c.cancelBackgroundImageToNull();
                                      setState(() {
                                        _isResetButtonPressed =
                                            false; // Reset the flag
                                      });
                                    } else {
                                      // Show a toast and wait for a second press
                                      _isResetButtonPressed = true;
                                      toast("再按一次清除背景图片");
                                      // Automatically reset the flag after a delay
                                      Future.delayed(Duration(seconds: 2), () {
                                        setState(() {
                                          _isResetButtonPressed = false;
                                        });
                                      });
                                    }
                                  },
                                  child: Text("重置背景图片为空")),
                            ),
                          if (c.backgroundImage.value != null &&
                              c.backgroundImage.value !=
                                  c.lastBackgroundImage.value)
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 16),
                              width: double.infinity,
                              child: ElevatedButton(
                                  onPressed: () {
                                    if (_isApplyButtonPressed) {
                                      // Apply the background image
                                      c.changeThemeToImageBackground();
                                      setState(() {
                                        _isApplyButtonPressed =
                                            false; // Reset the flag
                                      });
                                    } else {
                                      // Show a toast and wait for a second press
                                      _isApplyButtonPressed = true;
                                      toast("再按一次应用背景图片");
                                      // Automatically reset the flag after a delay
                                      Future.delayed(Duration(seconds: 2), () {
                                        setState(() {
                                          _isApplyButtonPressed = false;
                                        });
                                      });
                                    }
                                  },
                                  child: Text("应用")),
                            ),
                        ],
                      ),
                    ),
                  ],
                );
              }),
            );
          }),
        ));
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
      canvasColor: Color(0x55aaaaaa),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(backgroundColor())),
      ),
      colorScheme: theme.colorScheme
          .copyWith(onSurface: textColor, onBackground: textColor),
      popupMenuTheme: PopupMenuThemeData(
          color: Color(0x55aaaaaa), // 设置为透明色
          textStyle: TextStyle(
              color: Colors.white, // 全局设置文字为白色
              shadows: shadow),
          iconColor: Colors.white),
      listTileTheme:
          ListTileThemeData(textColor: Colors.white, iconColor: Colors.white),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: backgroundColor(),
        indicatorColor:
            isMainPageHasBackgroundImage() ? Color(0x66aaaaaa) : null,
        labelTextStyle: WidgetStateProperty.all(
          TextStyle(
              color: Colors.white, // 设置文字颜色为白色
              shadows: shadow),
        ),
        iconTheme: WidgetStateProperty.all(
          IconThemeData(
              color: Colors.white, // 设置图标颜色为白色
              shadows: shadow),
        ),
      ),
      iconTheme: theme.iconTheme.copyWith(color: textColor, shadows: shadow),
      dialogTheme: DialogTheme(
        titleTextStyle: theme.textTheme.titleLarge
            ?.copyWith(color: theme.colorScheme.onSurface, shadows: shadow),
        contentTextStyle: theme.textTheme.bodyMedium
            ?.copyWith(color: theme.colorScheme.onSurface, shadows: shadow),
        surfaceTintColor: theme.colorScheme.onSurface,
      ),
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
}

Future<bool?> showApplyChangesDialog(BuildContext context) async {
  return await showDialog<bool?>(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return AlertDialog(
        title: Text('应用更改'),
        content: Text('您想要应用更改还是退出而不保存？'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false); // Exit without saving
            },
            child: Text('退出'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true); // Apply changes and exit
            },
            child: Text('应用'),
          ),
        ],
      );
    },
  ); // Return false if dialog is dismissed without any selection
}
