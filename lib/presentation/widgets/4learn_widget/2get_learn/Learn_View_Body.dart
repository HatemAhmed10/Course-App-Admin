import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:learn_admin/models/2Course_model.dart';

class Learn_View_Body extends StatelessWidget {
  Learn_View_Body({super.key, required this.courseModel});
  final CourseModel courseModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(courseModel.courseName.toString()),
        ],
      ),
    );
  }
}
