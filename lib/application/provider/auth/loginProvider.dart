import 'package:flutter/material.dart';
import 'package:kanban_task_managemant/domain/source/db/hive/auth/authDbService.dart';
import 'package:kanban_task_managemant/domain/source/db/hive/auth/token/tokenDBservice.dart';
import 'package:kanban_task_managemant/domain/model/auth/loginModel.dart';
import 'package:kanban_task_managemant/domain/source/services/auth/authService.dart';
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
      await _authDBService.writeToDB(data!);
      await TokenDBService().writeToDB(data!.refresh, data!.access);
      Future.delayed(Duration.zero).then((value) =>
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
              (route) => false));
      notifyListeners();
    } else {
      isLoading = false;
      error = res;
      notifyListeners();
    }
  }
}
