import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guethub/data/model/app/forum/forum_posts_response/forum_posts_response.dart';
import 'package:guethub/data/network.dart';
import 'package:guethub/ui/page/main/forum/post_detail_page.dart';
import 'package:guethub/ui/route.dart';
import 'package:guethub/ui/widget/image_view.dart';
import 'package:intl/intl.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:shimmer/shimmer.dart';
import 'package:guethub/logger.dart';
typedef OnChangeLikePost = Future<bool> Function(bool isLiked);

final imageBaseUrl = AppNetwork.appOSSBaseUrl;

class PostCard extends StatefulWidget {
  final ForumPost post;
  final OnChangeLikePost onChangeLikePost;

  PostCard({Key? key, required this.post, required this.onChangeLikePost})
      : super(key: key);

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  final datetimeFormat = DateFormat("yyyy-MM-dd HH:mm:ss");

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoute.postDetailPage,
            preventDuplicates: false,
            arguments: PostDetailPageArgs(post: widget.post));
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: ClipOval(
                child: ExtendedImage.network(
                  imageBaseUrl + widget.post.userProfile.avatar,
                  width: 36,
                  height: 36,
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
                          color: Colors.white,
                        ),
                      );
                    }
                    return null;
                  },
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              widget.post.userProfile.nickname,
                              style: Theme.of(context).textTheme.titleMedium,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          if (widget.post.userProfile.verified) // 判断是否已认证
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Icon(
                                Icons.verified, // 你也可以选择其他图标或使用自定义的蓝V图标
                                color: Colors.blue,
                                size: 16.0, // 根据需要调整图标大小
                              ),
                            ),
                        ],
                      ),
                      Text(
                        datetimeFormat.format(
                            DateTime.parse(widget.post.createdAt).toLocal()),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  if (widget.post.text.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        widget.post.text,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                        maxLines: 10,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  if (widget.post.images.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxHeight: 200, maxWidth: double.infinity),
                        child: LayoutBuilder(
                          builder: (context, con) {
                            return Stack(
                              children: [
                                Hero(
                                  tag: widget.post.images.first,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: ExtendedImage.network(
                                      widget.post.images.first,
                                      height: con.maxHeight,
                                      width: con.maxWidth,
                                      fit: BoxFit.cover,
                                      loadStateChanged: (ExtendedImageState state) {
                                        if (state.extendedImageLoadState == LoadState.failed) {
                                          return Center(child: Icon(Icons.error));
                                        } else if (state.extendedImageLoadState == LoadState.loading) {
                                          return Shimmer.fromColors(
                                            baseColor: Colors.grey[300]!,
                                            highlightColor: Colors.grey[100]!,
                                            child: Container(
                                              color: Colors.white,
                                            ),
                                          );
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                                // Check if there are more than one image
                                if (widget.post.images.length > 1)
                                  Positioned(
                                    right: 8,
                                    top: 8,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Text(
                                        '+${widget.post.images.length - 1}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),

                  if ((widget.post.ipCountry != null &&
                          widget.post.ipCity != null) ||
                      widget.post.category != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        children: [
                          if (widget.post.ipCountry != null &&
                              widget.post.ipCity != null)
                            Flexible(
                              child: Text(
                                  "ip: ${widget.post.ipCountry!}-${widget.post.ipCity!}",
                                  style: TextStyle(color: Colors.grey)),
                            ),
                          if (widget.post.category != null)
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text("类别: ${widget.post.category!.name}",
                                    style: TextStyle(color: Colors.grey)),
                              ),
                            ),
                        ],
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.toNamed(AppRoute.postDetailPage,
                                preventDuplicates: false,
                                arguments:
                                    PostDetailPageArgs(post: widget.post));
                          },
                          icon: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.messenger_outline_rounded,
                                  size: 18,
                                ),
                                SizedBox(width: 6),
                                Text(widget.post.repliesCount.toString()),
                              ],
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () async {
                            try {
                              final result = await widget
                                  .onChangeLikePost(widget.post.isLiked);
                              setState(() {
                                widget.post.isLiked = result;
                                widget.post.likesCount =
                                    widget.post.likesCount + (result ? 1 : -1);
                              });
                            } catch (e) {
                              logger.e(e);
                            }
                          },
                          icon: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              children: [
                                Icon(
                                  widget.post.isLiked
                                      ? Icons.favorite
                                      : Icons.favorite_border_outlined,
                                  size: 18,
                                ),
                                SizedBox(width: 6),
                                Text(widget.post.likesCount.toString()),
                              ],
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.equalizer_outlined,
                                  size: 18,
                                ),
                                SizedBox(width: 6),
                                Text(widget.post.viewsCount.toString()),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
