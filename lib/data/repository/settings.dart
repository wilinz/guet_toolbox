import 'package:get_storage/get_storage.dart';
import 'package:path_provider/path_provider.dart';

class SettingsRepository {
  late GetStorage settingsStorage;

  Future<void> initGetStorage() async {
    final path = await getApplicationSupportDirectory();
    settingsStorage = GetStorage('SettingsStorage', path.path);
    await settingsStorage.initStorage;
  }

  SettingsRepository._();

  static SettingsRepository? _instance = null;

  static Future<SettingsRepository> get() async {
    final instance = SettingsRepository._();
    await instance.initGetStorage();
    return _instance ??= instance;
  }
}
