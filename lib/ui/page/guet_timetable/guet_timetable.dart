import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class TimetablePage extends StatelessWidget {
  const TimetablePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("作息时间表"),
      ),
      body: Center(
        child: PhotoView.customChild(
          child: SvgPicture.asset(
            "assets/images/guet_timetable.svg",
          ),
          minScale: PhotoViewComputedScale.contained * 0.8,
          maxScale: PhotoViewComputedScale.covered * 2.0,
          enableRotation: true,
          backgroundDecoration: BoxDecoration(
            color: Colors.white, // 背景颜色
          ),
        ),
      ),
    );
  }
}
