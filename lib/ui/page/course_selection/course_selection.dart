
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CourseSelectionPage extends StatefulWidget {
  const CourseSelectionPage({Key? key}) : super(key: key);

  @override
  State<CourseSelectionPage> createState() => _CourseSelectionPageState();
}

class _CourseSelectionPageState extends State<CourseSelectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("选课"),),
      body: Column(
        children: [
          Text("选课")
        ],
      ),
    );
  }

}
