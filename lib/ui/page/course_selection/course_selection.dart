import 'package:flutter/material.dart';

class CourseSelectionPage extends StatelessWidget {
  const CourseSelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _CourseSelectionPage();
  }
}

class _CourseSelectionPage extends StatefulWidget {
  const _CourseSelectionPage({Key? key}) : super(key: key);

  @override
  State<_CourseSelectionPage> createState() => _CourseSelectionPageState();
}

class _CourseSelectionPageState extends State<_CourseSelectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("选课"),
      ),
    );
  }
}

