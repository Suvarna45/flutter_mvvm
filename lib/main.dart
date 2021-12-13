import 'package:flutter/material.dart';
import 'package:mvvm_example/user_list/views/home_screen.dart';
import 'package:mvvm_example/user_list/view_models/user_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => UserViewModel())],
        child: MaterialApp(
          title: 'MVVM',
          debugShowCheckedModeBanner: false,
          home: HomeScreen(),
          theme: ThemeData(
              primarySwatch: Colors.blue,
              brightness: Brightness.dark,
              visualDensity: VisualDensity.adaptivePlatformDensity),
        ));
  }
}
