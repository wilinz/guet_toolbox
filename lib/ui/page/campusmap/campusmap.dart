import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class CampusMapPage extends StatelessWidget {
  const CampusMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PhotoView(
        imageProvider: Image.asset("assets/images/campus-map.jpg").image,
          backgroundDecoration: BoxDecoration(
            color: Colors.transparent
          )
      ),
    );
  }
}
