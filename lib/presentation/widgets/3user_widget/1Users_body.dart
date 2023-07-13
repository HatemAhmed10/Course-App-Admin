import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_admin/models/1Users_Model.dart';
import 'package:learn_admin/shared/constants.dart';
import 'package:learn_admin/shared/styles/assets_manager.dart';

import '../../../business_logic/3Users/users_cubit.dart';
import '../../../business_logic/3Users/users_state.dart';

class Users_Bosy extends StatelessWidget {
  final UserModel Users;
  final int index;

  Users_Bosy({
    super.key,
    required this.Users,
    required this.index,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<User_Cubit, Users_States>(
      builder: (context, state) {
        User_Cubit cubit = User_Cubit.get(context);

        return ListTile(
          leading: Container(
            width: 60,
            height: 60,
            child: Users.userimage == ""
                ? CircleAvatar(
                    child: ClipOval(
                      child: Image.asset(
                        ImageAssets.person,
                        fit: BoxFit.cover,
                        // width: 200,
                        // height: 200,
                      ),
                    ),
                    backgroundColor: Colors.white,
                  )
                : CircleAvatar(
                    child: ClipOval(
                      child: Image.network(
                        Users.userimage.toString(),
                        fit: BoxFit.cover,
                        width: 200,
                        height: 200,
                      ),
                    ),
                    backgroundColor: Color(0xff669E76),
                  ),
          ),
          title: Text(
            Users.userName.toString(),
            style: TextStyle(fontSize: 20, color: kPrimaryColor),
          ),
          subtitle: Row(
            children: [
              Container(
                width: 110,
                child: Text(
                  Users.userEmail.toString(),
                  style: TextStyle(fontSize: 13),
                ),
              ),
            ],
          ),
          trailing: Container(
            width: 120,
            child: Row(
              children: [
                Spacer(),
                Switch(
                  activeColor: Color(0xff669E76),
                  value: Users.State as bool,
                  onChanged: (val) {
                    cubit.ChangeSwitch(val, Users);
                  },
                ),
                Spacer(),
                IconButton(
                    onPressed: () {
                      cubit.deleteItem(usersModel: Users);
                    },
                    icon: Icon(Icons.delete)),
                Spacer(),
              ],
            ),
          ),
        );
      },
    );
  }
}
