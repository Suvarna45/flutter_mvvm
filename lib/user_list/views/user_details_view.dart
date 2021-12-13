import 'package:flutter/material.dart';
import 'package:mvvm_example/user_list/component/app_title.dart';
import 'package:mvvm_example/user_list/view_models/user_view_model.dart';
import 'package:provider/src/provider.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserViewModel userViewModel = context.watch<UserViewModel>();
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Details'),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTitle(text: userViewModel.getUserModel()!.name),
              Text(
                userViewModel.getUserModel()!.email,
                style: TextStyle(color: Colors.black),
              ),
              Text(
                userViewModel.getUserModel()!.phone,
                style: TextStyle(color: Colors.black),
              ),
              Text(
                userViewModel.getUserModel()!.username,
                style: TextStyle(color: Colors.black),
              ),
              Text(
                userViewModel.getUserModel()!.website,
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ));
  }
}
