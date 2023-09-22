import 'package:flutter/material.dart';
import 'package:kanban_task_managemant/domain/model/auth/registerModel.dart';
import 'package:kanban_task_managemant/domain/services/auth/authService.dart';
import 'package:kanban_task_managemant/presentition/ui/auth/loginPage.dart';

class RegisterProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController password1Controller = TextEditingController();
  final TextEditingController password2Controller = TextEditingController();

  void clearTextFields() {
    nameController.clear();
    lastNameController.clear();
    phoneController.clear();
    password1Controller.clear();
    password2Controller.clear();
  }

  bool isLoading = false;
  String error = '';

  Future<void> registers(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    dynamic res = await _authService.register(
        password1: password1Controller.text,
        password2: password2Controller.text,
        phone: phoneController.text,
        first_name: nameController.text,
        last_name: lastNameController.text);
    if (res is RegisterModel) {
      isLoading = false;
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
          (route) => false);
      notifyListeners();
    } else {
      isLoading = false;
      error = res;
      print("$res xato");
      notifyListeners();
    }
  }
}
