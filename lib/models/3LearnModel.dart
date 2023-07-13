import 'package:cloud_firestore/cloud_firestore.dart';

class LearnModel {
  String? LearnId;
  String? CourseId;
  String? LearnName;
  String? LearnType;
  String? LearnLink;
  Timestamp? LearndataTime;

  LearnModel({
    required this.LearnId,
    required this.CourseId,
    required this.LearnName,
    required this.LearnType,
    required this.LearnLink,
    required this.LearndataTime,
  });

  LearnModel.fromJson(Map<String, dynamic> json) {
    LearnId = json["LearnId"];
    CourseId = json["CourseId"];
    LearnName = json["LearnName"];
    LearnType = json["LearnType"];
    LearnLink = json["LearnLink"];
    LearndataTime = json["LearndataTime"];
  }

  Map<String, dynamic> toMap() {
    return {
      'LearnId': LearnId,
      'CourseId': CourseId,
      'LearnName': LearnName,
      'LearnType': LearnType,
      'LearnLink': LearnLink,
      'LearndataTime': LearndataTime,
    };
  }
}
