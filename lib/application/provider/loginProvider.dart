import 'package:flutter/material.dart';
import 'package:kanban_task_managemant/domain/db/auth/authDbService.dart';
import 'package:kanban_task_managemant/domain/db/auth/token/tokenDBservice.dart';
import 'package:kanban_task_managemant/domain/model/auth/loginModel.dart';
import 'package:kanban_task_managemant/domain/services/auth/authService.dart';
import 'package:kanban_task_managemant/presentition/ui/pages/homePage.dart';

class LoginProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();
  final AuthDBService _authDBService = AuthDBService();

  final TextEditingController loginphoneController = TextEditingController();
  final TextEditingController loginpassword1Controller =
      TextEditingController();

  void clearTextFields() {
    loginphoneController.clear();
    loginpassword1Controller.clear();
  }

  bool isLoading = false;
  String error = '';
  LoginModel? data;

  Future<void> logins(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    dynamic res = await _authService.login(
        phone: loginphoneController.text,
        password: loginpassword1Controller.text);
    if (res is LoginModel) {
      isLoading = false;
      data = res;
      print(res);
      _authDBService.writeToDB(data!);
      TokenDBService().writeToDB(data!.refresh, data!.access);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
          (route) => false);
      notifyListeners();
    } else {
      isLoading = false;
      error = res;
      notifyListeners();
    }
  }
}