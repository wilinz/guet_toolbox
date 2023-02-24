import 'dart:io';

class PlatformUtil {
  static bool isDesktop() =>
      Platform.isMacOS || Platform.isLinux || Platform.isWindows;

  static bool isMobile() => !isDesktop();
}
