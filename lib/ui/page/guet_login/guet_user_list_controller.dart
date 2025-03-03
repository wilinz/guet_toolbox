import 'package:get/get.dart';
import 'package:guethub/data/model/user/user.dart';
import 'package:guethub/data/repository/user.dart';
import 'package:guethub/logger.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class UserListController extends GetxController {
  static const int pageSize = 20;
  final PagingController<int, User> pagingController =
      PagingController(firstPageKey: 0);

  UserListController();

  @override
  void onInit() {
    super.onInit();
    pagingController.addPageRequestListener((pageKey) {
      fetchUsers(pageKey);
    });
  }

  Future<void> fetchUsers(int pageKey) async {
    try {
      final newUsers =
          await UserRepository.get().getUsersPaginated(pageSize, pageKey);
      final isLastPage = newUsers.length < pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(newUsers);
      } else {
        final nextPageKey = pageKey + newUsers.length;
        pagingController.appendPage(newUsers, nextPageKey);
      }
    } catch (error) {
      logger.d(error);
      pagingController.error = error;
    }
  }

  Future<void> refreshUsers() async {
    pagingController.refresh();
  }

  @override
  void dispose() {
    pagingController.dispose();
    super.dispose();
  }

  // 切换用户逻辑
  void switchUser(User user) async {
    // await userDao.offlineOtherUser(user.username);
    // user.isActive = true;
    // await userDao.insertOrUpdateUser(user);
    // refreshUsers();
    Get.back(result: user);
  }

  void deleteUser(User user) async => await UserRepository.get().deleteUser(user);
}
