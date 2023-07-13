import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_admin/business_logic/4Learn_Cubit/learn_cubit.dart';
import 'package:learn_admin/business_logic/4Learn_Cubit/learn_state.dart';
import 'package:learn_admin/models/2Course_model.dart';
import 'package:learn_admin/models/3LearnModel.dart';
import 'package:learn_admin/shared/constants.dart';

class Add_Learn_Form extends StatelessWidget {
  Add_Learn_Form({super.key, required this.courseModel});
  final CourseModel courseModel;

  TextEditingController LearnName_Controller = TextEditingController();
  TextEditingController LearnLink_Controller = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Learn_Cubit(),
      child: BlocConsumer<Learn_Cubit, Learn_States>(
        listener: (context, state) {
          if (state is Add_Learn_Data_Suceccful) {
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
          Learn_Cubit learn_cubit = Learn_Cubit.get(context);

          return Center(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: 350,
                    margin:
                        EdgeInsets.only(top: 6, bottom: 6, left: 28, right: 28),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: kPrimaryColor,
                      style: TextStyle(color: kPrimaryColor),
                      controller: LearnName_Controller,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: "Learn Name",
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 15, right: 10),
                          child: Icon(
                            Icons.text_decrease,
                            color: kPrimaryColor,
                          ),
                        ),
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 15),

                        fillColor: kPrimaryColor
                            .withOpacity(0.3), // Set the background color here
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
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 155,
                    height: 50,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: DropdownButton<String>(
                      underline: null,
                      dropdownColor: kPrimaryColor.withOpacity(0.8),
                      value: learn_cubit.selectedType,
                      onChanged: (newValue) {
                        learn_cubit.updateSelectedType(newValue.toString());
                      },
                      items: <String>["Video", "Pdf"]
                          .map<DropdownMenuItem<String>>((String value) {
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
                    height: 20,
                  ),
                  Container(
                    width: 350,
                    margin:
                        EdgeInsets.only(top: 6, bottom: 6, left: 28, right: 28),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: kPrimaryColor,
                      style: TextStyle(color: kPrimaryColor),
                      controller: LearnLink_Controller,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: "Learn Link",
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 15, right: 10),
                          child: Icon(
                            Icons.link,
                            color: kPrimaryColor,
                          ),
                        ),
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 15),

                        fillColor: kPrimaryColor
                            .withOpacity(0.3), // Set the background color here
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
                  SizedBox(
                    height: 20,
                  ),
                  ConditionalBuilder(
                    condition: state is Add_Learn_Data_Loading,
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
                            learn_cubit.Add_Learn_Data_cubit(
                                learnModel: LearnModel(
                              LearnId: "",
                              CourseId: courseModel.courseId,
                              LearnName: LearnName_Controller.text,
                              LearnType: learn_cubit.selectedType.toString(),
                              LearnLink: LearnLink_Controller.text,
                              LearndataTime: timestamp,
                            ));
                          }
                        },
                        child: Text(
                          "Add Learn".toUpperCase(),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
