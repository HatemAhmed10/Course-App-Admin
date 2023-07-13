import 'package:flutter/material.dart';
import 'package:learn_admin/presentation/widgets/2teacher_widget/1add_teacher/AddTeacherForm.dart';

class AddTeacher_View extends StatelessWidget {
  const AddTeacher_View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AddTeacher_View"),
      ),
      body: AddTeacherForm(),
    );
  }
}
