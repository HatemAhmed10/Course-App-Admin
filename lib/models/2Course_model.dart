import 'package:cloud_firestore/cloud_firestore.dart';

class CourseModel {
  String? courseId;
  String? courseName;
  Timestamp? courseDate;
  String? courseImage;
  String? courseType;

  CourseModel({
    required this.courseId,
    required this.courseName,
    required this.courseDate,
    required this.courseImage,
    required this.courseType,
  });

  CourseModel.fromJson(Map<String, dynamic> json) {
    courseId = json["courseId"];
    courseName = json["courseName"];
    courseDate = json["courseDate"];
    courseImage = json["courseImage"];
    courseType = json["courseType"];
  }

  Map<String, dynamic> toMap() {
    return {
      'courseId': courseId,
      'courseName': courseName,
      'courseDate': courseDate,
      'courseImage': courseImage,
      'courseType': courseType,
    };
  }
}
