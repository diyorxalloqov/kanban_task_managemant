import 'package:dartz/dartz.dart';
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
    
    print(passwordController.text);
    print(phoneController.text);
    print(passwordController.text.trim());
    print(phoneController.text.trim());

    final Either<String, RegisterModel> res = await _authService.register(
        password: passwordController.text, phone: phoneController.text);

    res.fold(
      (left) {
        isLoading = false;
        error = left;
        print("$left xato");
        notifyListeners();
      },
      (right) {
        isLoading = false;
        Future.delayed(Duration.zero).then((value) =>
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
                (route) => false));
        notifyListeners();
      },
    );
  }
}
