import 'package:flutter/material.dart';
import 'package:learn_admin/models/2Course_model.dart';
import 'package:learn_admin/presentation/widgets/4learn_widget/1add_learn/add_learn_view.dart';

class Add_Learn_View extends StatelessWidget {
  Add_Learn_View({super.key, required this.courseModel});
  final CourseModel courseModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add_Learn_View"),
      ),
      body: Add_Learn_Form(
        courseModel: courseModel,
      ),
    );
  }
}
