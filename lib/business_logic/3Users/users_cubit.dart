import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_admin/business_logic/3Users/users_state.dart';
import 'package:learn_admin/models/1Users_Model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class User_Cubit extends Cubit<Users_States> {
  User_Cubit() : super(UserInitialState());

  static User_Cubit get(context) => BlocProvider.of(context);

  List<UserModel> Users = [];
  List<UserModel>? FUsers = [];

  fetchAllUsers() {
    emit(UsersLoadingSuccess());
    Users.clear();
    FirebaseFirestore.instance.collection('users').snapshots().listen((event) {
      Users.clear();
      event.docs.forEach((element) {
        Users.add(UserModel.fromJson(element.data()));
      });
      FUsers = Users;
      emit(UsersSuccess());
    });

    // emit(SubjectsSuccess());
  }

  //-----------------------------------------------
  bool isChecked = false;

  void ChangeSwitch(bool value, UserModel usersModel) async {
    usersModel.State = value;

    UserModel usersModel2 = UserModel(
        userId: usersModel.userId,
        userName: usersModel.userName,
        userEmail: usersModel.userEmail,
        dataTime: usersModel.dataTime,
        phoneNumber: usersModel.phoneNumber,
        userYear: usersModel.userYear,
        userPassword: usersModel.userPassword,
        userimage: usersModel.userimage,
        State: value);
    await FirebaseFirestore.instance
        .collection('users')
        .doc(usersModel.userId)
        .update(usersModel2.toMap());
    emit(ChangeSwitchState());
  }
  //-------------------------------------------------------------

  void deleteItem({required UserModel usersModel}) async {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: usersModel.userEmail.toString(),
            password: usersModel.userPassword.toString())
        .then((userCredential) {
      userCredential.user!.delete();
    }).catchError((error) {
      print('Error getting token: $error');
    });
    await FirebaseFirestore.instance
        .collection('users')
        .doc(usersModel.userId)
        .delete();
    emit(deleteItemState());
  }

  //____________________________________________________________

  void searchList({required List<UserModel> items, required String query}) {
    FUsers = items
        .where((item) =>
            item.userName!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    emit(TeachersSearcheSuccess());
  }
}
