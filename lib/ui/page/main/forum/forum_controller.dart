import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guethub/data/model/app/forum/forum_categories_response/forum_categories_response.dart';
import 'package:guethub/data/model/app/forum/forum_posts_response/forum_posts_response.dart';
import 'package:guethub/data/repository/forum_repository.dart';
import 'package:guethub/logger.dart';
import 'package:guethub/ui/util/toast.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class CategoryPageController extends GetxController {
  final categories = <ForumCategory>[].obs;
  final selectedCategory = Rxn<ForumCategory>();
  final PageController pageController = PageController();
  final isLoadFailed = false.obs;
  final RxBool isFabVisible = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadCategories();
  }

  Future<void> loadCategories() async {
    try {
      isLoadFailed.value = false;
      final categoriesResp = await ForumRepository.get().getCategories();
      categories.value = categoriesResp.data;
      if (categories.isNotEmpty) {
        selectedCategory.value = categories.first;
      }
    } catch (e) {
      logger.e(e);
      toastFailure0("加载帖子失败");
      isLoadFailed.value = true;
    }
  }

  void changeCategory(int index) {
    selectedCategory.value = categories[index];
    pageController.jumpToPage(index);
  }
}

// import 'package:get/get.dart';
// import 'package:guethub/data/model/app/forum/forum_posts_response/forum_posts_response.dart';
// import 'package:guethub/data/repository/forum_repository.dart';
// import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class PostPageController extends GetxController {
  final String categoryId;
  final PagingController<int, ForumPost> pagingController =
      PagingController(firstPageKey: 1);
  static const int pageSize = 20;
  final isLoadFailed = false.obs;

  PostPageController(this.categoryId);

  @override
  void onInit() {
    super.onInit();
    pagingController.addPageRequestListener((pageKey) {
      fetchPosts(pageKey);
    });
  }

  Future<void> fetchPosts(int pageKey) async {
    try {
      final postsResp = await ForumRepository.get().getPosts(
        page: pageKey,
        pageSize: pageSize,
        categoryId: categoryId,
      );
      final isLastPage = postsResp.data.length < pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(postsResp.data);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(postsResp.data, nextPageKey);
      }
      isLoadFailed.value = false;
    } catch (e) {
      logger.e(e);
      pagingController.error = e;
      isLoadFailed.value = true;
    }
  }

  Future<void> refresh() async {
    pagingController.refresh();
  }

  Future<void> like(String postId) async {
    final resp = await ForumRepository.get().like(postId);
    if (!resp.success) {
      toastFailure0("点赞失败", error: resp.msg);
      throw Exception("点赞失败");
    }
  }

  Future<void> unlike(String postId) async {
    final resp = await ForumRepository.get().unlike(postId);
    if (!resp.success) {
      toastFailure0("取消点赞失败", error: resp.msg);
      throw Exception("点赞失败");
    }
  }
}
