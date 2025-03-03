import 'dart:async';
import 'dart:io';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:guethub/data/model/app/forum/forum_categories_response/forum_categories_response.dart';
import 'package:guethub/data/model/app/forum/forum_posts_response/forum_posts_response.dart';
import 'package:guethub/ui/page/main/forum/send_post_controller.dart';
import 'package:guethub/ui/util/toast.dart';

class SendPostPageArgs {
  String? text;
  ForumPost? parentPost;

  SendPostPageArgs({required this.text, required this.parentPost});
}

class SendPostPage extends StatelessWidget {
  const SendPostPage({super.key, this.args});

  final SendPostPageArgs? args;

  ForumPost? get parentPost => args?.parentPost;

  @override
  Widget build(BuildContext context) {
    final c = Get.put(SendPostController(args: args));
    return Scaffold(
      appBar: AppBar(
        title: Text(parentPost == null ? '发帖' : '回复'),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.close),
        ),
        actions: [
          // _DraftButton(),
          _SendButton(parentPost: parentPost),
          SizedBox(width: 15),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  if (parentPost != null) _ReplyInfo(parentPost: parentPost),
                  _PostInputField(parentPost: parentPost),
                  _ImageGrid(),
                ],
              ),
            ),
          ),
          Obx(() => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (c.location.value != null)
                    Container(
                      width: double.infinity,
                      height: 0.2,
                      color: Colors.grey,
                    ),
                  if (c.location.value != null)
                    Row(
                      children: [
                        SizedBox(width: 16),
                        Flexible(
                            child:
                                Text("位置：${c.location.value?.address ?? ""}")),
                        // Expanded(child: SizedBox()),
                        IconButton(
                            onPressed: () {
                              c.location.value = null;
                            },
                            icon: Icon(
                              Icons.close,
                              color: Theme.of(context).primaryColor,
                            ))
                      ],
                    ),
                  if (parentPost == null)
                    Container(
                      width: double.infinity,
                      height: 0.2,
                      color: Colors.grey,
                    ),
                  if (parentPost == null) _VisibilityIndicator(),
                  Container(
                    width: double.infinity,
                    height: 0.2,
                    color: Colors.grey,
                  ),
                  _CategoryAndCounter(parentPost: parentPost),
                  _BottomToolbar(parentPost: parentPost),
                ],
              ))
        ],
      ),
    );
  }
}

class _DraftButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final c = Get.find<SendPostController>();
    return Obx(() => TextButton(
          onPressed: c.contentIsNotBlank.isTrue ? () {} : null,
          child: Text('草稿'),
        ));
  }
}

class _SendButton extends StatelessWidget {
  const _SendButton({required this.parentPost});

  final ForumPost? parentPost;

  @override
  Widget build(BuildContext context) {
    final c = Get.find<SendPostController>();
    return Obx(() => TextButton(
          onPressed: c.contentIsNotBlank.isTrue
              ? () {
                  c.uploadPost(context, parentPost?.id);
                }
              : null,
          child: Text('发送'),
        ));
  }
}

class _ReplyInfo extends StatelessWidget {
  const _ReplyInfo({required this.parentPost});

  final ForumPost? parentPost;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 74),
      child: Row(
        children: [
          Text("回复给 "),
          Text(
            "${parentPost!.userProfile.nickname}",
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        ],
      ),
    );
  }
}

class _PostInputField extends StatelessWidget {
  final ForumPost? parentPost;

  const _PostInputField({super.key, required this.parentPost});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<SendPostController>();
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            child: Image.asset(
              "assets/images/logo.png",
              width: 50,
              height: 50,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Container(
              width: double.infinity,
              child: TextField(
                controller: c.contentController,
                maxLines: null,
                maxLength: 500,
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(
                  border: InputBorder.none, // 去掉默认的底部边框线
                  hintText: parentPost != null ? '发布你的回复' : '快来分享今天的趣事吧！',
                  hintStyle: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CategoryAndCounter extends StatelessWidget {
  final ForumPost? parentPost;

  const _CategoryAndCounter({super.key, required this.parentPost});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<SendPostController>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        children: [
          if (parentPost == null)
            // 类别选择器
            Expanded(
              child: Obx(() {
                return DropdownButton<ForumCategory>(
                  isExpanded: true,
                  borderRadius: BorderRadius.circular(8),
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  value: c.selectedCategory.value,
                  items: c.categories.map((category) {
                    return DropdownMenuItem<ForumCategory>(
                      value: category,
                      child: Text(category.name),
                    );
                  }).toList(),
                  onChanged: (value) {
                    c.selectedCategory.value = value;
                  },
                );
              }),
            ),
          SizedBox(width: 4),
          // 字数计数器
          Obx(() => Text(
                '已输入 ${c.textNum.value} / 500',
                style:
                    TextStyle(color: Theme.of(context).colorScheme.onSurface),
              )),
        ],
      ),
    );
  }
}

class _ImageGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final c = Get.find<SendPostController>();
    return Obx(
      () => Padding(
        padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
        child: GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          itemCount: c.images.length,
          itemBuilder: (context, index) {
            final image = c.images[index];
            return ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Stack(
                children: [
                  Image.file(
                    File(image.path),
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    right: 0,
                    child: IconButton(
                      onPressed: () => c.images.remove(image),
                      icon: Icon(Icons.close,
                          color: Theme.of(context).primaryColor),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _BottomToolbar extends StatefulWidget {
  final ForumPost? parentPost;

  const _BottomToolbar({super.key, required this.parentPost});

  @override
  State<_BottomToolbar> createState() => _BottomToolbarState();
}

class _BottomToolbarState extends State<_BottomToolbar> {
  bool _confirmClear = false;

  @override
  Widget build(BuildContext context) {
    final c = Get.find<SendPostController>();
    return SafeArea(
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Obx(() => Row(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  c.pickImage();
                                  toast('添加图片');
                                },
                                icon: Icon(
                                  Icons.image_outlined,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                              SizedBox(width: 4),
                              IconButton(
                                onPressed: () {
                                  c.toggleEmojiPicker();
                                },
                                icon: Icon(
                                  Icons.emoji_emotions_outlined,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                              if (widget.parentPost == null) SizedBox(width: 4),
                              if (widget.parentPost == null)
                                IconButton(
                                  onPressed: () {
                                    _showVisibilityBottomSheet(context, c);
                                  },
                                  icon: Icon(
                                    Icons.visibility,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              if (widget.parentPost == null) SizedBox(width: 4),
                              if (widget.parentPost == null)
                                IconButton(
                                  onPressed: () {
                                    c.getLocation();
                                  },
                                  icon: Icon(
                                    Icons.location_on_outlined,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              SizedBox(width: 4),
                              IconButton(
                                onPressed: () {
                                  if (_confirmClear) {
                                    c.contentController.clear();
                                    _confirmClear = false; // Reset confirmation
                                  } else {
                                    toast("再按一次清空文本");
                                    setState(() {
                                      _confirmClear = true;
                                    });
                                    // Reset the confirmation after a delay (optional)
                                    Future.delayed(Duration(seconds: 2), () {
                                      if (mounted) {
                                        setState(() {
                                          _confirmClear = false;
                                        });
                                      }
                                    });
                                  }
                                },
                                icon: Icon(
                                  Icons.close,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (c.isEmojiVisible.isTrue) SizedBox(width: 4),
                      if (c.isEmojiVisible.isTrue)
                        IconButton(
                          onPressed: () {
                            c.toggleEmojiPicker();
                          },
                          icon: Icon(
                            Icons.keyboard_hide,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                    ],
                  ))),
          Obx(() => PopScope(
                canPop: c.isEmojiVisible.isFalse, // 允许用户通过返回键关闭页面
                onPopInvoked: (bool didPop) {
                  c.toggleEmojiPicker(); // 关闭emoji面板
                },
                child: Offstage(
                  offstage: !c.isEmojiVisible.value,
                  child: SizedBox(
                      height: 250,
                      child: EmojiPicker(
                        onEmojiSelected: (category, emoji) {
                          // Do something when emoji is tapped (optional)
                        },
                        onBackspacePressed: () {
                          // Do something when the user taps the backspace button (optional)
                          // Set it to null to hide the Backspace-Button
                        },
                        textEditingController: c.contentController,
                        // pass here the same [TextEditingController] that is connected to your input field, usually a [TextFormField]
                        config: Config(
                          height: 256,
                          checkPlatformCompatibility: true,
                          emojiViewConfig: EmojiViewConfig(
                            // Issue: https://github.com/flutter/flutter/issues/28894
                            emojiSizeMax: 28 *
                                (defaultTargetPlatform == TargetPlatform.iOS
                                    ? 1.20
                                    : 1.0),
                          ),
                          // swapCategoryAndBottomBar: false,
                          skinToneConfig: const SkinToneConfig(),
                          categoryViewConfig: const CategoryViewConfig(),
                          bottomActionBarConfig: const BottomActionBarConfig(),
                          searchViewConfig: const SearchViewConfig(),
                        ),
                      )),
                ),
              )),
        ],
      ),
    );
  }

  late StreamSubscription<bool> keyboardSubscription;

  @override
  void initState() {
    super.initState();
    var keyboardVisibilityController = KeyboardVisibilityController();
    // Query
    // logger.d('Keyboard visibility direct query: ${keyboardVisibilityController.isVisible}');

    final c = Get.find<SendPostController>();
    // Subscribe
    keyboardSubscription = keyboardVisibilityController.onChange.listen((bool visible) {
      if(c.isEmojiVisible.isTrue) {
        c.isEmojiVisible.value = !visible;
      }
    });
  }

  @override
  void dispose() {
    keyboardSubscription.cancel();
    super.dispose();
  }

}

void _showVisibilityBottomSheet(BuildContext context, SendPostController c) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
    ),
    builder: (context) {
      return SafeArea(
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    c.changeVisibility('public');
                    Navigator.pop(context);
                  },
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(16.0)),
                  child: ListTile(
                    leading: Icon(Icons.public),
                    title: Text('公开可见'),
                  ),
                ),
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    c.changeVisibility('private');
                    Navigator.pop(context);
                  },
                  child: ListTile(
                    leading: Icon(Icons.lock),
                    title: Text('仅私密可见'),
                  ),
                ),
              ),
              // Material(
              //   color: Colors.transparent,
              //   child: InkWell(
              //     onTap: () {
              //       c.changeVisibility('friends');
              //       Navigator.pop(context);
              //     },
              //     borderRadius:
              //         BorderRadius.vertical(bottom: Radius.circular(16.0)),
              //     child: ListTile(
              //       leading: Icon(Icons.group),
              //       title: Text('仅好友可见'),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      );
    },
  );
}

class _VisibilityIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final c = Get.find<SendPostController>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Obx(() {
        String visibilityText;
        IconData visibilityIcon;

        switch (c.selectedVisibility.value) {
          case 'private':
            visibilityText = '仅私密可见';
            visibilityIcon = Icons.lock;
            break;
          case 'friends':
            visibilityText = '仅好友可见';
            visibilityIcon = Icons.group;
            break;
          case 'public':
          default:
            visibilityText = '公开可见';
            visibilityIcon = Icons.public;
            break;
        }

        return Row(
          children: [
            Icon(
              visibilityIcon,
              color: Theme.of(context).colorScheme.primary,
            ),
            SizedBox(width: 4),
            Text(
              visibilityText,
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            Expanded(child: SizedBox()), // 使用Expanded占据剩余空间
            Text(
              '允许评论',
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            Checkbox(
              value: c.allowReplies.value,
              onChanged: (bool? value) {
                if (value != null) {
                  c.allowReplies.value = value;
                }
              },
            ),
          ],
        );
      }),
    );
  }
}
