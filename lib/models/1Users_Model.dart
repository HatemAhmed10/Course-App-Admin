import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? userId;
  String? userName;
  String? userEmail;
  String? userPassword;
  String? userYear;
  Timestamp? dataTime;
  String? phoneNumber;
  String? userimage;
  bool? State;

  UserModel({
    required this.userId,
    required this.userName,
    required this.userEmail,
    required this.userPassword,
    required this.userYear,
    required this.dataTime,
    required this.phoneNumber,
    required this.userimage,
    required this.State,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    userId = json["userId"];
    userName = json["userName"];
    userEmail = json["userEmail"];
    userPassword = json["userPassword"];
    userYear = json["userYear"];
    dataTime = json["dataTime"];
    phoneNumber = json["phoneNumber"];
    userimage = json["userimage"];
    State = json["State"];
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'userName': userName,
      'userEmail': userEmail,
      'userPassword': userPassword,
      'userYear': userYear,
      'dataTime': dataTime,
      'phoneNumber': phoneNumber,
      'userimage': userimage,
      'State': State,
    };
  }
}
