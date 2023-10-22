import 'package:dio/dio.dart';
import 'package:kanban_task_managemant/domain/core/api/api.dart';
import 'package:kanban_task_managemant/domain/core/api/baseoption.dart';
import 'package:kanban_task_managemant/domain/model/auth/loginModel.dart';
import 'package:kanban_task_managemant/domain/model/auth/registerModel.dart';

class AuthService {
  Future<dynamic> register(
      {required String password1,
      required String password2,
      required String phone,
      String? first_name,
      String? last_name}) async {
    try {
      Response response = await Dio(BaseOption.dio).post(
        Api.register,
        data: {
          "password1": password1,
          "password2": password2,
          "phone": phone,
          "first_name": first_name,
          "last_name": last_name
        },
      );
      print(response.statusCode);
      if (response.statusCode == 201) {
        return RegisterModel.fromJson(response.data);
      } else {
        return response.statusMessage.toString();
      }
    } on DioException catch (e) {
      print(e.message.toString());
      if (e.response?.statusCode == 400) {
        print("Bu foydalanuvchi mavjud");
        return "Bu foydalanuvchi mavjud";
      } else if (e.type == DioExceptionType.unknown) {
        print("he");
        return "internetingizni tekshiring";
      } else {
        print("hi");
        return e.message.toString();
      }
    }
  }

  Future<dynamic> login(
      {required String password, required String phone}) async {
    try {
      Response response = await Dio(BaseOption.dio).post(
        Api.login,
        data: {
          "password": password,
          "phone": phone,
        },
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.data);
        return LoginModel.fromJson(response.data);
      } else {
        return response.statusMessage.toString();
      }
    } on DioException catch (e) {
      print("hello");
      if (e.type == DioExceptionType.unknown) {
        return "internetingizni tekshiring";
      } else {
        return e.message.toString();
      }
    }
  }
}
