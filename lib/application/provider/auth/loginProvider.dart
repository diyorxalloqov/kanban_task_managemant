import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:kanban_task_managemant/domain/model/auth/loginModel.dart';
import 'package:kanban_task_managemant/domain/source/services/auth/authService.dart';
import 'package:kanban_task_managemant/presentition/ui/pages/homePage.dart';

class LoginProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();

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
    Either<String, LoginModel> res = await _authService.login(
        phone: loginphoneController.text,
        password: loginpassword1Controller.text);

    res.fold((l) {
      isLoading = false;
      error = l;
      notifyListeners();
    }, (r) {
      isLoading = false;
      data = r;
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
          (route) => false);
      notifyListeners();
    });
  }
}
