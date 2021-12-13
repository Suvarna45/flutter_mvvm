import 'package:flutter/cupertino.dart';
import 'package:mvvm_example/user_list/models/user_error.dart';
import 'package:mvvm_example/user_list/models/user_list_model.dart';
import 'package:mvvm_example/user_list/repo/api_status.dart';
import 'package:mvvm_example/user_list/repo/user_services.dart';

class UserViewModel extends ChangeNotifier {
  bool _loading = false;
  List<UserModel> _userListModel = [];
  UserModel? _selectedUser;
  UserError? _userError;
  UserModel _addingUser = new UserModel(
      id: 0,
      name: "",
      username: "",
      email: "",
      address: Address(
          street: "",
          suite: "",
          city: "",
          zipcode: "",
          geo: Geo(lat: "", lng: "")),
      phone: "",
      website: "",
      company: Company(name: "", catchPhrase: "", bs: ""));

  bool getLoading() => _loading;
  List<UserModel> get userListModel => _userListModel;
  UserError? getUserError() => _userError;
  UserModel? getUserModel() => _selectedUser;
  UserModel get addingUser => _addingUser;
  UserViewModel() {
    getUsers();
  }

  addUser() async {
    _userListModel.add(addingUser);
    notifyListeners();
  }

  setUserModel(UserModel userModel) {
    _selectedUser = userModel;
  }

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setUserListModel(List<UserModel> userListModel) {
    _userListModel = userListModel;
  }

  setUserError(UserError userError) {
    _userError = userError;
  }

  getUsers() async {
    setLoading(true);
    var response = await UserServices.getUsers();
    if (response is Success) {
      setUserListModel(response.response as List<UserModel>);
    }
    if (response is Failure) {
      UserError userError =
          UserError(code: response.code, errorMessage: response.errorResponse);
      setUserError(userError);
    }
    setLoading(false);
  }
}
