import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_admin/models/1Users_Model.dart';
import 'package:learn_admin/models/2Course_model.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

import 'course_state.dart';

class courseCubit extends Cubit<courseState> {
  courseCubit() : super(CourseInitialState());

  static courseCubit get(context) => BlocProvider.of(context);

  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  File? photo;
  final ImagePicker _picker = ImagePicker();
  var FinaUrl = "";

  List<CourseModel> ListcourseModel = [];
  void FetchAllCourses() {
    emit(FetchAllCoursesLoading());
    emit(FetchAllCoursesSuceccful());
    emit(FetchAllCourseserror());
  }

  //____________________________________________________________

  Future imgFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      photo = File(pickedFile.path);
      // uploadFile();
    } else {
      print('No image selected.');
    }

    emit(UploadImageState());
  }

  void Add_Teacher_Data_cubit({required CourseModel FcourseModel}) {
    // emit(Add_Teacher_Data_Loading());

    var uId = FirebaseFirestore.instance.collection("Courses").doc();
    // uploadFile();

    CourseModel courseModel = CourseModel(
      courseId: uId.id,
      courseName: FcourseModel.courseName,
      courseDate: FcourseModel.courseDate,
      courseImage: FinaUrl,
      courseType: FcourseModel.courseType,
    );
    FirebaseFirestore.instance
        .collection('Courses')
        .doc(uId.id)
        .set(courseModel.toMap())
        .then((value) async {
      // emit(Add_Teacher_Data_Suceccful());
    }).catchError((error) {
      // emit(Add_Teacher_Data_error());

      print(error.toString());
    });
  }

  Future uploadFile({required CourseModel FcourseModel}) async {
    emit(Add_Teacher_Data_Loading());

    if (photo == null) return;
    // ignore: unused_local_variable
    final fileName = basename(photo!.path);
    final destination = 'files/UserFoto/';

    try {
      final ref = firebase_storage.FirebaseStorage.instance
          .ref(destination)
          .child('${fileName}/');
      await ref.putFile(photo!);
      FinaUrl = (await ref.getDownloadURL()).toString();
      Add_Teacher_Data_cubit(FcourseModel: FcourseModel);
      emit(Add_Teacher_Data_Suceccful());

      // emit(UploadImageState());
    } catch (e) {
      emit(Add_Teacher_Data_error());

      print('error occured');
    }
  }

  //_____________________________________
  String selectedValue = "اولي ثانوي";
  void updateSelectedValue(String newValue) {
    selectedValue = newValue;
    emit(DropdownState());
  }
//______________________________________________

//_____________________________________________________________

  List<CourseModel> courseModel = [];
  fetchAllcourseModel({required String StudentYear}) {
    emit(courseModelLoadingSuccess());
    try {
      courseModel.clear();
      FirebaseFirestore.instance
          .collection("Courses")
          .where("courseType", isEqualTo: StudentYear.toString())
          .snapshots()
          .listen((event) {
        courseModel.clear();
        event.docs.forEach((element) {
          courseModel.add(CourseModel.fromJson(element.data()));
        });
        emit(courseModelSuccess());
      });
    } catch (e) {
      emit(courseModelError());
    }

    // emit(SubjectsSuccess());
  }

  //-----------------------------------------------
}
