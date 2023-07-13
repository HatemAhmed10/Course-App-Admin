import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_admin/business_logic/4Learn_Cubit/learn_state.dart';
import 'package:learn_admin/models/3LearnModel.dart';

class Learn_Cubit extends Cubit<Learn_States> {
  Learn_Cubit() : super(LearnInitialState());

  static Learn_Cubit get(context) => BlocProvider.of(context);

  //_____________________________________
  String selectedType = "Video";
  void updateSelectedType(String newValue) {
    selectedType = newValue;
    emit(DropdownState());
  }
//______________________________________________

  void Add_Learn_Data_cubit({required LearnModel learnModel}) {
    emit(Add_Learn_Data_Loading());
    var uId = FirebaseFirestore.instance.collection("Learn").doc();
    // uploadFile();

    LearnModel courseModel = LearnModel(
      LearnId: uId.id,
      CourseId: learnModel.CourseId,
      LearnName: learnModel.LearnName,
      LearnLink: learnModel.LearnLink,
      LearndataTime: learnModel.LearndataTime,
      LearnType: learnModel.LearnType,
    );
    FirebaseFirestore.instance
        .collection('Learn')
        .doc(learnModel.CourseId.toString())
        .collection("lessons")
        .doc(uId.id)
        .set(courseModel.toMap())
        .then((value) async {
      emit(Add_Learn_Data_Suceccful());
    }).catchError((error) {
      emit(Add_Learn_Data_error());

      print(error.toString());
    });
  }
}
