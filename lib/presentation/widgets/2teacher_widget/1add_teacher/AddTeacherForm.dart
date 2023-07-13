import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_admin/business_logic/2course_Cubit/course_cubit.dart';
import 'package:learn_admin/business_logic/2course_Cubit/course_state.dart';
import 'package:learn_admin/models/2Course_model.dart';
import 'package:learn_admin/presentation/widgets/2teacher_widget/2get_teacher/1Course_View.dart';
import 'package:learn_admin/shared/constants.dart';
import 'package:learn_admin/shared/routes.dart';
import 'package:learn_admin/shared/styles/assets_manager.dart';

// ignore: must_be_immutable
class AddTeacherForm extends StatelessWidget {
  AddTeacherForm({super.key});
  TextEditingController courseName_Controller = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => courseCubit(),
      child: BlocConsumer<courseCubit, courseState>(
        listener: (context, state) {
          if (state is Add_Teacher_Data_Suceccful) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Suceccful Add'),
                duration: Duration(seconds: 3),
                backgroundColor: Colors
                    .blue, // Set the background color of the snackbar here
              ),
            );
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          courseCubit coursecubit = courseCubit.get(context);

          return Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      width: 350,
                      margin: EdgeInsets.only(
                          top: 6, bottom: 6, left: 28, right: 28),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: kPrimaryColor,
                        style: TextStyle(color: kPrimaryColor),
                        controller: courseName_Controller,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: "Course Name",
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(left: 15, right: 10),
                            child: Icon(
                              Icons.text_decrease,
                              color: kPrimaryColor,
                            ),
                          ),
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 15),

                          fillColor: kPrimaryColor.withOpacity(
                              0.3), // Set the background color here
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0),
                            borderSide: BorderSide(
                              color: kPrimaryColor.withOpacity(
                                  0.3), // Set the normal border color here
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0),
                            borderSide: BorderSide(
                              color:
                                  kPrimaryColor, // Set the focused border color here
                              width: 2.0,
                            ),
                          ),

                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0),
                            borderSide: BorderSide(
                              color:
                                  Colors.red, // Set the error border color here
                              width: 2.0,
                            ),
                          ),
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Text';
                          }
                          return null;
                        },
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 115,
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(22),
                          ),
                          child: DropdownButton<String>(
                            underline: null,
                            dropdownColor: kPrimaryColor.withOpacity(0.8),
                            value: coursecubit.selectedValue,
                            onChanged: (newValue) {
                              coursecubit
                                  .updateSelectedValue(newValue.toString());
                            },
                            items: <String>[
                              'اولي ثانوي',
                              'تانيه ثانوي',
                              'ثالثه ثانوي'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Column(
                                  children: [
                                    Text(
                                      value,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Container(
                                      color: Colors.grey,
                                      height: 1,
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        coursecubit.photo == null
                            ? InkWell(
                                onTap: () {
                                  coursecubit.imgFromGallery();
                                },
                                child: Container(
                                  width: 200,
                                  height: 200,
                                  child: CircleAvatar(
                                    child: ClipOval(
                                      child: Image.asset(
                                        ImageAssets.person,
                                        fit: BoxFit.cover,
                                        // width: 200,
                                        // height: 200,
                                      ),
                                    ),
                                    backgroundColor: Colors.white,
                                  ),
                                ),
                                // child: AspectRatio(
                                //   aspectRatio: 3.6 / 2,
                                //   child: ClipRRect(
                                //     // borderRadius: BorderRadius.circular(32),
                                //     child: Image.asset(
                                //       ImageAssets.person,
                                //       fit: BoxFit.cover,
                                //       // width: 200,
                                //       // height: 200,
                                //     ),
                                //   ),
                                // ),
                              )
                            : InkWell(
                                onTap: () {
                                  coursecubit.imgFromGallery();
                                },
                                child: CircleAvatar(
                                  radius: 100, // set the radius of the avatar
                                  backgroundImage: AssetImage(
                                    ImageAssets.person,
                                  ), // set the image for the avatar
                                  backgroundColor: Color.fromARGB(0, 54, 46,
                                      46), // make the background of the avatar transparent
                                  child: ClipOval(
                                    child: Image.file(
                                      coursecubit.photo!,
                                      fit: BoxFit.cover,
                                      width: 200,
                                      height: 200,
                                    ),
                                  ),
                                ),
                              ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ConditionalBuilder(
                      condition: state is Add_Teacher_Data_Loading,
                      builder: (context) => CircularProgressIndicator(
                        color: kPrimaryColor,
                      ),
                      fallback: (context) => Container(
                        width: 350,
                        margin: EdgeInsets.only(
                            top: 6, bottom: 6, left: 28, right: 28),
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: MaterialButton(
                          // minWidth: 150,
                          height: 60,
                          onPressed: () {
                            Timestamp timestamp = Timestamp.now();

                            if (formKey.currentState!.validate()) {
                              coursecubit.uploadFile(
                                  FcourseModel: CourseModel(
                                courseId: "",
                                courseDate: timestamp,
                                courseName: courseName_Controller.text,
                                courseImage: "",
                                courseType:
                                    coursecubit.selectedValue.toString(),
                              ));
                            }
                          },
                          child: Text(
                            "Add Course".toUpperCase(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
