import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guethub/ui/page/userprofile/user_profile_controller.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:shimmer/shimmer.dart';

class UserProfile extends StatelessWidget {
  UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(UserProfileController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("用户资料"),
      ),
      body: Obx(() {
        if (c.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (c.isLoadFailed.isTrue) {
          return Center(
            child: TextButton(
              onPressed: () {
                c.loadUserProfile();
              },
              child: Text(
                "加载失败，点击重试",
                style: GoogleFonts.longCang(
                  textStyle: TextStyle(fontSize: 25, color: Theme.of(context).colorScheme.primary),
                ),
              ),
            ),
          );
        }
        final user = c.userProfile.value;
        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const SizedBox(height: 24),
            Center(
              child: GestureDetector(
                onTap: () => c.pickNewAvatar(),
                child: ClipOval(
                  child: ExtendedImage.network(
                    c.imageBaseUrl + c.userProfile.value!.avatar,
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                    loadStateChanged: (ExtendedImageState state) {
                      if (state.extendedImageLoadState == LoadState.failed) {
                        return RandomAvatar(
                          DateTime.now().toIso8601String(),
                          height: 50,
                          width: 52,
                        );
                      }else if (state.extendedImageLoadState == LoadState.loading){
                        return Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            height: 36,
                            width: 36,
                            color: Colors.white,
                          ),
                        );
                      }
                      return null;
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 48),
            _buildEditableField(
              context,
              title: '昵称',
              value: user!.nickname,
              onSave: (value) => c.updateNickname(value),
            ),
            const SizedBox(height: 16),
            _buildEditableField(
              context,
              title: '创建时间',
              value: c.reformatDateTime(user.createdAt) ?? "",
              onSave: null, // 不允许编辑
            ),
            const SizedBox(height: 16),
            _buildEditableField(
              context,
              title: '用户ID',
              value: user.userId,
              onSave: null, // 不允许编辑
            ),
          ],
        );
      }),
    );
  }

  Widget _buildEditableField(BuildContext context,
      {required String title,
      required String value,
      Function(String)? onSave}) {
    return GestureDetector(
      onTap: onSave != null
          ? () => _showEditDialog(context, title, value, onSave)
          : null,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('$title: $value'),
            if (onSave != null) const Icon(Icons.edit, color: Colors.blue),
          ],
        ),
      ),
    );
  }

  Future<void> _showEditDialog(BuildContext context, String title, String value,
      Function(String) onSave) async {
    final TextEditingController controller = TextEditingController(text: value);

    final result = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('编辑 $title'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius. circular(8))
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('取消'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: const Text('保存'),
              onPressed: () {
                Navigator.of(context).pop(controller.text);
              },
            ),
          ],
        );
      },
    );

    if (result != null && result != value) {
      onSave(result);
    }
  }
}
