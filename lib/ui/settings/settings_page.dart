import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/get_storage.dart';
import 'settings_controller.dart';

class SettingsPage extends StatelessWidget {
  final SettingsController _settingsController =
      Get.put(SettingsController(getStorage));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('settings'.tr),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('theme'.tr),
            trailing: Obx(
              () => DropdownButton(
                padding: EdgeInsets.only(left: 12, right: 12),
                value: _settingsController.themeMode.value,
                focusColor: Colors.transparent,
                // 设置焦点颜色为透明
                items: [
                  DropdownMenuItem(
                    value: ThemeMode.system,
                    child: Text('follow_system'.tr),
                  ),
                  DropdownMenuItem(
                    value: ThemeMode.light,
                    child: Text('light'.tr),
                  ),
                  DropdownMenuItem(
                    value: ThemeMode.dark,
                    child: Text('dark'.tr),
                  ),
                ],
                onChanged: (value) => _settingsController.setThemeMode(value!),
              ),
            ),
          ),
          ListTile(
            title: Text('language'.tr),
            trailing: DropdownButton(
              padding: EdgeInsets.only(left: 12, right: 12),
              value: _settingsController.locale.value?.toLocaleCode(),
              focusColor: Colors.transparent,
              // 设置焦点颜色为透明
              items: <DropdownMenuItem<String?>>[
                DropdownMenuItem(
                  value: null,
                  child: Text('follow_system'.tr),
                ),
                DropdownMenuItem(
                  value: "en_US",
                  child: Text('English'),
                ),
                DropdownMenuItem(
                  value: "zh_CN",
                  child: Text('中文'),
                ),
              ],
              onChanged: (value) => _settingsController.changeLanguage(value),
            ),
          ),
        ],
      ),
    );
  }
}
