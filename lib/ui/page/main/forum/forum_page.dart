import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guethub/logger.dart';
import 'package:guethub/ui/route.dart';
import 'package:guethub/ui/widget/keep_alive_wrapper.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:guethub/data/model/app/forum/forum_posts_response/forum_posts_response.dart';
import 'forum_controller.dart';
import 'post_card.dart';

class PostPage extends StatelessWidget {
  final String categoryId;

  PostPage({required this.categoryId});

  @override
  Widget build(BuildContext context) {
    final PostPageController postController =
    Get.put(PostPageController(categoryId), tag: categoryId);

    return RefreshIndicator(
      onRefresh: () async {
        await postController.refresh();
      },
      child: PagedListView<int, ForumPost>(
        pagingController: postController.pagingController,
        builderDelegate: PagedChildBuilderDelegate<ForumPost>(
          itemBuilder: (context, post, index) {
            return PostCard(
              post: post,
              onChangeLikePost: (bool isLiked) async {
                if (isLiked) {
                  await postController.unlike(post.id);
                  return false;
                } else {
                  await postController.like(post.id);
                  return true;
                }
              },
            );
          },
          firstPageErrorIndicatorBuilder: (context) => Center(
            child: TextButton(
              onPressed: () => postController.pagingController.refresh(),
              child: Text(
                "加载失败，点击重试",
                style: GoogleFonts.longCang(
                  textStyle: TextStyle(fontSize: 25),
                ),
              ),
            ),
          ),
          newPageErrorIndicatorBuilder: (context) => Center(
            child: TextButton(
              onPressed: () =>
                  postController.pagingController.retryLastFailedRequest(),
              child: Text(
                "加载失败，点击重试",
                style: GoogleFonts.longCang(
                  textStyle: TextStyle(fontSize: 25),
                ),
              ),
            ),
          ),
          noItemsFoundIndicatorBuilder: (context) => Center(
            child: Text("没有找到帖子"),
          ),
        ),
      ),
    );
  }
}

class ForumPage extends StatelessWidget {
  final CategoryPageController categoryController =
  Get.put(CategoryPageController());

  ForumPage() {
    // We no longer need a ScrollController
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GUET HUB')),
      floatingActionButton: Obx(
            () => AnimatedSlide(
          duration: const Duration(milliseconds: 200),
          offset: categoryController.isFabVisible.value ? Offset(0, 0) : Offset(0, 2), // Slide down when hidden
          child: FloatingActionButton(
            onPressed: () {
              Get.toNamed(AppRoute.sendPostPage);
            },
            child: Icon(Icons.add),
          ),
        ),
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          if (notification is ScrollUpdateNotification) {
            if (notification.scrollDelta! > 0) {
              categoryController.isFabVisible.value = false; // User is scrolling down
            } else if (notification.scrollDelta! < 0) {
              categoryController.isFabVisible.value = true; // User is scrolling up
            }
          }
          return true;
        },
        child: Obx(() {
          if (categoryController.isLoadFailed.isTrue) {
            return Center(
              child: TextButton(
                onPressed: () {
                  categoryController.loadCategories();
                },
                child: Text(
                  "加载失败，点击重试",
                  style: GoogleFonts.longCang(
                    textStyle: TextStyle(
                      fontSize: 25,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ),
            );
          } else if (categoryController.categories.isEmpty) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(8,0,8,8),
                  child: Wrap(
                    spacing: 8.0, // 设置每个类别之间的间距
                    runSpacing: 4.0, // 设置换行后行间距
                    children: categoryController.categories.map((category) {
                      return Obx(() {
                        final isSelected = category ==
                            categoryController.selectedCategory.value;
                        return InkWell(
                          borderRadius: BorderRadius.circular(8),
                          onTap: () {
                            categoryController.changeCategory(
                                categoryController.categories.indexOf(category));
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 8),
                            child: Text(
                              category.name,
                              style: TextStyle(
                                color: isSelected
                                    ? Theme.of(context).colorScheme.primary
                                    : Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                          ),
                        );
                      });
                    }).toList(),
                  ),
                ),
                Expanded(
                  child: KeepAliveWrapper(
                    child: PageView.builder(
                      controller: categoryController.pageController,
                      itemCount: categoryController.categories.length,
                      onPageChanged: (index) {
                        categoryController.changeCategory(index);
                      },
                      itemBuilder: (context, index) {
                        final category = categoryController.categories[index];
                        return PostPage(categoryId: category.id);
                      },
                    ),
                  ),
                ),
              ],
            );
          }
        }),
      ),
    );
  }
}
