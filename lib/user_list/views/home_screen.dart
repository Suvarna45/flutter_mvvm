import 'package:flutter/material.dart';
import 'package:mvvm_example/user_list/component/app_loading.dart';
import 'package:mvvm_example/user_list/component/app_title.dart';
import 'package:mvvm_example/user_list/component/user_list_row.dart';
import 'package:mvvm_example/user_list/models/user_list_model.dart';
import 'package:mvvm_example/user_list/view_models/user_view_model.dart';
import 'package:mvvm_example/util/navigation_utils.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserViewModel userViewModel = context.watch<UserViewModel>();

    return Scaffold(
        appBar: AppBar(
          title: Text('Users'),
          actions: [
            IconButton(
                onPressed: () async => {addUserDetails(context)},
                icon: Icon(Icons.add))
          ],
        ),
        backgroundColor: Colors.white,
        body: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [_ui(userViewModel)],
            )));
  }

  _ui(UserViewModel userViewModel) {
    if (userViewModel.getLoading()) {
      return AppLoading();
    }
    if (userViewModel.getUserError() != null) {
      return Container();
    }
    return Expanded(
      child: ListView.separated(
          itemBuilder: (context, index) {
            UserModel userModel = userViewModel.userListModel[index];
            return UserListRow(
              userModel: userModel,
              onTap: () async {
                userViewModel.setUserModel(userModel);
                OpenUserDetails(context);
              },
            );
          },
          separatorBuilder: (context, index) => Divider(),
          itemCount: userViewModel.userListModel.length),
    );
  }
}
