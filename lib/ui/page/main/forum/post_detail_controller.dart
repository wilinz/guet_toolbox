import 'package:dart_extensions/dart_extensions.dart';
import 'package:get/get.dart';
import 'package:guethub/data/model/app/forum/forum_posts_response/forum_posts_response.dart';
import 'package:guethub/data/model/common/common_response.dart';
import 'package:guethub/data/network.dart';
import 'package:guethub/data/repository/forum_repository.dart';
import 'package:guethub/ui/util/toast.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:flutter/material.dart';
import 'package:guethub/logger.dart';
class PostDetailController extends GetxController {
  final ForumPost post;
  final TextEditingController replyController = TextEditingController();
  final focus = FocusNode().obs;
  final PagingController<int, ForumPost> pagingController =
      PagingController(firstPageKey: 1);
  static const int pageSize = 20;
  final Rx<int> viewsCount;
  final isSending = false.obs;
  final replyIsBlank = true.obs;

  PostDetailController({required this.post})
      : this.viewsCount = post.viewsCount.obs;

  Future<void> fetchReplies(int pageKey) async {
    try {
      final postsResp = await ForumRepository.get().getPosts(
        parentId: post.id,
        page: pageKey,
        pageSize: pageSize,
      );
      final isLastPage = postsResp.data.length < pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(postsResp.data);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(postsResp.data, nextPageKey);
      }
    } catch (e) {
      logger.e(e);
      pagingController.error = e;
    }
  }

  Future<void> refresh() async {
    try {
      pagingController.refresh();
    } catch (e) {
      logger.e(e);
    }
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

  Future<void> viewPost(String postId) async {
    final resp = await ForumRepository.get().view(postId);
    if (resp.success) {
      viewsCount.value += 1;
    }
  }

  Future<void> replyPost(String? parentId, String text) async {
    try {
      isSending.value = true;
      final dio = AppNetwork.get().appDio;

      Map<String, dynamic> data = {
        "parent_id": parentId,
        "text": text,
      };
      final resp = await dio.post('/forum/post', data: data);
      final response = CommonResponse.fromJson(resp.data);
      if (response.success) {
        toastSuccess0("评论成功");
        refresh();
      } else {
        toastFailure0('评论失败', error: response.msg);
      }
    } on Exception catch (e) {
      logger.e(e);
      toastFailure0('评论失败：', error: e);
    } finally {
      isSending.value = false;
      replyController.clear();
    }
  }

  @override
  void onInit() {
    super.onInit();
    replyController.addListener((){
      replyIsBlank.value = !replyController.text.isNotBlank;
    });
    pagingController.addPageRequestListener((pageKey) {
      fetchReplies(pageKey);
    });
    try {
      viewPost(post.id);
    } catch (e) {
      logger.e(e);
    }
  }
}
