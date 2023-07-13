import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_admin/business_logic/3Users/users_cubit.dart';
import 'package:learn_admin/shared/constants.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(kDefaultPadding),
      padding: EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding / 4, // 5 top and bottom
      ),
      decoration: BoxDecoration(
        // color: Colors.white.withOpacity(0.4),
        color: kBackGrounBlackdAny.withOpacity(0.4),
        borderRadius: BorderRadius.circular(17),
      ),
      child: TextField(
        cursorColor: kColorPrimrywite,
        onChanged: (query) => BlocProvider.of<User_Cubit>(context).searchList(
            items: BlocProvider.of<User_Cubit>(context).Users, query: query),
        style: TextStyle(color: kColorPrimrywite),
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          // icon: SvgPicture.asset("assets/icons/search.svg"),
          icon: Icon(
            Icons.search,
            color: kColorPrimrywite,
          ),
          hintText: 'Search',
          hintStyle: TextStyle(color: kColorPrimrywite),
        ),
      ),
    );
  }
}
