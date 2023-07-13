import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:learn_admin/business_logic/2course_Cubit/course_cubit.dart';
import 'package:learn_admin/business_logic/2course_Cubit/course_state.dart';
import 'package:learn_admin/presentation/screens/4Learn_Screen/learn_view.dart';
import 'package:learn_admin/shared/constants.dart';
import 'package:learn_admin/shared/routes.dart';
import 'package:learn_admin/shared/styles/assets_manager.dart';

class Course_View extends StatelessWidget {
  Course_View({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          courseCubit()..fetchAllcourseModel(StudentYear: 'اولي ثانوي'),
      child: BlocConsumer<courseCubit, courseState>(
        listener: (context, state) {},
        builder: (context, state) {
          courseCubit FcourseCubit = courseCubit.get(context);

          return Container(
            child: Padding(
              padding: EdgeInsets.only(left: 20, top: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
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
                      value: FcourseCubit.selectedValue,
                      onChanged: (newValue) {
                        FcourseCubit.updateSelectedValue(newValue.toString());

                        FcourseCubit.fetchAllcourseModel(
                            StudentYear: FcourseCubit.selectedValue.toString());
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
                  FcourseCubit.courseModel.isEmpty
                      ? Center(
                          child: Text(
                          "لا يوجد كورسات",
                          style: TextStyle(fontSize: 30, color: kPrimaryColor),
                        ))
                      : Expanded(
                          child: StaggeredGridView.countBuilder(
                            padding: EdgeInsets.all(0),
                            crossAxisCount: 2,
                            itemCount: FcourseCubit.courseModel.length,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  navigateTo(
                                      context,
                                      Learn_View(
                                        courseModel:
                                            FcourseCubit.courseModel[index],
                                      ));
                                },
                                child: Container(
                                  padding: EdgeInsets.all(20),
                                  height: index.isEven ? 200 : 240,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    image: FcourseCubit
                                                .courseModel[index].courseImage
                                                .toString() ==
                                            ""
                                        ? DecorationImage(
                                            image:
                                                AssetImage(ImageAssets.person),
                                            fit: BoxFit.fill,
                                          )
                                        : DecorationImage(
                                            image: NetworkImage(FcourseCubit
                                                .courseModel[index].courseImage
                                                .toString()),
                                            fit: BoxFit.fill,
                                          ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        FcourseCubit
                                            .courseModel[index].courseName
                                            .toString(),
                                        style: kTitleTextStyle,
                                      ),
                                      Text(
                                        '${FcourseCubit.courseModel[index].courseType} Courses',
                                        style: TextStyle(
                                          color: kTextColor.withOpacity(.5),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                            staggeredTileBuilder: (index) =>
                                StaggeredTile.fit(1),
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
