import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

import '../../data/repository/login.dart';

class LoginViewModel extends ChangeNotifier {
  var isLoading = false;

  Future<bool> login(String username, String password) {
    isLoading = true;
    notifyListeners();
    return LoginRepository()
        .loginAcademicAffairsSystem(username, password)
        .then((value) {
      isLoading = false;
      notifyListeners();
      return value;
    }).onError((error, stackTrace) {

      Logger().d(error);
      Logger().d(stackTrace);
      isLoading = false;
      notifyListeners();
      return false;
    });
  }

}
