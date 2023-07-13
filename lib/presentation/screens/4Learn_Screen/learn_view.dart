import 'package:flutter/material.dart';
import 'package:learn_admin/models/2Course_model.dart';
import 'package:learn_admin/presentation/screens/4Learn_Screen/Add_Learn.dart';
import 'package:learn_admin/presentation/widgets/4learn_widget/2get_learn/Learn_View_Body.dart';
import 'package:learn_admin/shared/routes.dart';

class Learn_View extends StatelessWidget {
  Learn_View({super.key, required this.courseModel});
  final CourseModel courseModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Learn_Cubit"),
      ),
      body: Learn_View_Body(courseModel: courseModel),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            navigateTo(
              context,
              Add_Learn_View(courseModel: courseModel),
            );
          },
          child: Icon(Icons.add)),
    );
  }
}
