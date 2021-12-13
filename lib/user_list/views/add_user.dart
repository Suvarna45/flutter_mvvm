import 'package:flutter/material.dart';
import 'package:mvvm_example/user_list/view_models/user_view_model.dart';
import 'package:provider/src/provider.dart';

class AddUserScreen extends StatelessWidget {
  const AddUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserViewModel userViewModel = context.watch<UserViewModel>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Add User Info'),
        actions: [
          IconButton(
              onPressed: () async => {
                    if (await userViewModel.addUser() ?? true)
                      {Navigator.pop(context)}
                  },
              icon: Icon(Icons.save))
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'name',
                  filled: true,
                  border: InputBorder.none,
                  fillColor: Colors.grey,
                  focusColor: Colors.grey),
              onChanged: (val) async {
                userViewModel.addingUser.name = val;
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'email',
                  filled: true,
                  border: InputBorder.none,
                  fillColor: Colors.grey,
                  focusColor: Colors.grey),
              onChanged: (val) async {
                userViewModel.addingUser.email = val;
              },
            )
          ],
        ),
      ),
    );
  }
}
