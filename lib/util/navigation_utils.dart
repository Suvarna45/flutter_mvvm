import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_example/user_list/views/add_user.dart';
import 'package:mvvm_example/user_list/views/user_details_view.dart';

void OpenUserDetails(BuildContext context) async {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UserDetailsScreen(),
      ));
}

void addUserDetails(BuildContext context) async {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddUserScreen(),
      ));
}
