import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guethub/data/model/user/user.dart';
import 'package:guethub/ui/page/guet_login/guet_user_list_controller.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class UserListPage extends StatelessWidget {
  final UserListController userController = Get.put(UserListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('用户列表'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await userController.refreshUsers();
        },
        child: PagedListView<int, User>.separated(
          separatorBuilder: (context, i) => SizedBox(height: 16),
          pagingController: userController.pagingController,
          builderDelegate: PagedChildBuilderDelegate<User>(
            itemBuilder: (context, user, index) {
              return Dismissible(
                key: ValueKey(user.id),
                direction: DismissDirection.endToStart,
                confirmDismiss: (direction) => _showDeleteConfirmationDialog(context, user),
                onDismissed: (direction) {
                  userController.deleteUser(user);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${user.username} 已删除')),
                  );
                },
                background: Container(
                  color: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
                child: UserCard(user: user, controller: userController),
              );
            },
            firstPageErrorIndicatorBuilder: (context) => Center(
              child: TextButton(
                onPressed: () => userController.pagingController.refresh(),
                child: Text("加载失败，点击重试"),
              ),
            ),
            newPageErrorIndicatorBuilder: (context) => Center(
              child: TextButton(
                onPressed: () => userController.pagingController.retryLastFailedRequest(),
                child: Text("加载失败，点击重试"),
              ),
            ),
            noItemsFoundIndicatorBuilder: (context) => Center(
              child: Text("没有找到用户"),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool?> _showDeleteConfirmationDialog(BuildContext context, User user) {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('确认删除'),
          content: Text('确定要删除用户 ${user.username} 吗？'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('取消'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text('确定'),
            ),
          ],
        );
      },
    );
  }
}

class UserCard extends StatelessWidget {
  final User user;
  final UserListController controller;

  const UserCard({required this.user, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${user.username} ${user.name ?? '未登录'}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text('${user.isUpgradedUndergrad ? "专升本" : "本科"}'),
              ],
            ),
            Expanded(child: SizedBox()),
            if (user.isActive)
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: TextButton(
                  onPressed: () {
                    controller.switchUser(user);
                  },
                  child: Text(
                    '当前用户',
                    style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
                  ),
                ),
              )
            else
              IconButton(
                onPressed: () {
                  controller.switchUser(user);
                },
                icon: Icon(Icons.swap_horiz),
                color: Theme.of(context).primaryColor,
              )
          ],
        ),
      ),
    );
  }
}
