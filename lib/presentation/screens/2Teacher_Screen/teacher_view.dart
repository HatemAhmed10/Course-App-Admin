import 'package:flutter/material.dart';
import 'package:learn_admin/presentation/screens/2Teacher_Screen/add_teacher_view.dart';
import 'package:learn_admin/presentation/screens/3User_Screen/user_view.dart';
import 'package:learn_admin/presentation/widgets/2teacher_widget/2get_teacher/1Course_View.dart';
import 'package:learn_admin/shared/routes.dart';

class teacher_view extends StatelessWidget {
  const teacher_view({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "teacher_view",
        ),
        actions: [
          IconButton(
              onPressed: () {
                navigateTo(context, UserView());
              },
              icon: Icon(Icons.people))
        ],
      ),
      body: Course_View(),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            navigateTo(context, AddTeacher_View());
          },
          child: Icon(Icons.add)),
    );
  }
}
