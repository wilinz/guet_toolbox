import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guethub/data/model/app/forum/forum_posts_response/forum_posts_response.dart';
import 'package:guethub/ui/page/main/forum/post_card_detail.dart';
import 'package:guethub/ui/page/main/forum/post_detail_controller.dart';
import 'package:guethub/ui/page/main/forum/send_post_page.dart';
import 'package:guethub/ui/route.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../../../widget/appbar_bottom_widget.dart';
import 'post_card.dart';

class PostDetailPageArgs {
  const PostDetailPageArgs({required this.post});

  final ForumPost post;
}

class PostDetailPage extends StatelessWidget {
  PostDetailPage({super.key, required PostDetailPageArgs args})
      : this.post = args.post;

  final ForumPost post;

  onChangeLikePost(PostDetailController c, bool isLiked, ForumPost post) async {
    if (isLiked) {
      await c.unlike(post.id);
      return false;
    } else {
      await c.like(post.id);
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final c = Get.put(PostDetailController(post: post), tag: post.id);
    return Scaffold(
      appBar: AppBar(
        title: Text('帖子'),
        bottom: CustomAppBarBottom(
          widget: Container(
            width: double.infinity,
            height: 0.2,
            color: Colors.grey,
          ),
          height: 1,
        ),
      ),
      body: GestureDetector(
        onTap: () {
          if (c.focus.value.hasFocus) {
            c.focus.value.unfocus();
          }
        },
        child: Column(
          children: [
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  await c.refresh();
                },
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: PostCardDetail(
                        post: this.post,
                        viewsCount: c.viewsCount,
                        onChangeLikePost: (isLiked) async {
                          return await onChangeLikePost(c, isLiked, this.post);
                        },
                      ),
                    ),
                    PagedSliverList<int, ForumPost>(
                      pagingController: c.pagingController,
                      builderDelegate: PagedChildBuilderDelegate<ForumPost>(
                        itemBuilder: (context, post, index) {
                          return PostCard(
                            post: post,
                            onChangeLikePost: (isLiked) async {
                              return await onChangeLikePost(c, isLiked, post);
                            },
                          );
                        },
                        noItemsFoundIndicatorBuilder: (context) => Center(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(16,8,16,18),
                            child: Text('没有找到评论'),
                          ),
                        ),
                        firstPageErrorIndicatorBuilder: (context) => Center(
                          child: TextButton(
                            onPressed: () => c.pagingController.refresh(),
                            child: Text("加载失败，点击重试"),
                          ),
                        ),
                        newPageErrorIndicatorBuilder: (context) => Center(
                          child: TextButton(
                            onPressed: () =>
                                c.pagingController.retryLastFailedRequest(),
                            child: Text("加载失败，点击重试"),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1), // 阴影颜色
                    spreadRadius: 5, // 阴影扩散程度
                    offset: Offset(0, 10), // 阴影偏移量
                  ),
                ],
              ),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 8, 10, 0),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            focusNode: c.focus.value,
                            controller: c.replyController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 0),
                              icon: IconButton(
                                  onPressed: () {
                                    Get.toNamed(AppRoute.sendPostPage,
                                        arguments: SendPostPageArgs(
                                            text: c.replyController.text,
                                            parentPost: post));
                                  },
                                  icon: Icon(Icons.fullscreen)),
                              labelText: '发布你的回复',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Obx(
                          () => IconButton(
                              onPressed: c.isSending.isTrue || c.replyIsBlank.isTrue
                                  ? null
                                  : () {
                                      c.replyPost(
                                          post.id, c.replyController.text);
                                    },
                              icon: Icon(
                                Icons.send,
                                // color: Theme.of(context).primaryColor,
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
