import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:learn_admin/business_logic/3Users/users_cubit.dart';
import 'package:learn_admin/business_logic/3Users/users_state.dart';
import 'package:learn_admin/presentation/widgets/3user_widget/1Users_body.dart';
import 'package:learn_admin/presentation/widgets/3user_widget/2SearchBox.dart';
import 'package:learn_admin/shared/Tooles/8custom_feding.dart';

class UserView extends StatelessWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => User_Cubit()..fetchAllUsers(),
      child: BlocConsumer<User_Cubit, Users_States>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          User_Cubit cubit = User_Cubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xff669E76),
              title: Text("Users"),
            ),
            body: ConditionalBuilder(
              condition: state is! UsersLoadingSuccess,
              fallback: (context) => LoadingListPage(),
              builder: (context) => Center(
                  child: Column(
                children: [
                  SearchBox(),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Users_Bosy(
                          Users: cubit.FUsers![index],
                          index: index,
                        );
                      },
                      itemCount: cubit.FUsers!.length,
                    ),
                  ),
                ],
              )),
            ),
          );
        },
      ),
    );
  }
}
