import 'package:flutter/material.dart';

class CustomAppBarBottom extends StatelessWidget implements PreferredSizeWidget {

  CustomAppBarBottom({required this.widget,required this.height});

  final StatelessWidget widget;
  final double height; //组件占据的高度

  @override
  Widget build(BuildContext context) {
    return widget;
  }
  @override
  Size get preferredSize => Size.fromHeight(height);
}