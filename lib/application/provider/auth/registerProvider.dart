import 'package:flutter/material.dart';
import 'package:kanban_task_managemant/domain/model/auth/registerModel.dart';
import 'package:kanban_task_managemant/domain/source/services/auth/authService.dart';
import 'package:kanban_task_managemant/presentition/ui/auth/loginPage.dart';

class RegisterProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void clearTextFields() {
    phoneController.clear();
    passwordController.clear();
  }

  bool isLoading = false;
  String error = '';

  Future<void> registers(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    dynamic res = await _authService.register(
        password: passwordController.text, phone: phoneController.text);
    if (res is RegisterModel) {
      isLoading = false;
      Future.delayed(Duration.zero).then((value) =>
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
              (route) => false));
      notifyListeners();
    } else {
      isLoading = false;
      error = res;
      print("$res xato");
      notifyListeners();
    }
  }
}
