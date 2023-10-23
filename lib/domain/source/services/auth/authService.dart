import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:kanban_task_managemant/domain/core/api/api.dart';
import 'package:kanban_task_managemant/domain/core/api/baseoption.dart';
import 'package:kanban_task_managemant/domain/model/auth/loginModel.dart';
import 'package:kanban_task_managemant/domain/model/auth/registerModel.dart';

class AuthService {
  Future<Either<String, RegisterModel>> register({
    required String password,
    required String phone,
  }) async {
    try {
      Response response = await Dio(BaseOption.dio).post(
        Api.register,
        data: {
          "password": password,
          "phone": phone,
        },
      );
      print(response.statusCode);
      if (response.statusCode == 201) {
        print(response.statusCode);
        return right(RegisterModel.fromJson(response.data));
      } else {
        print(response.statusMessage);
        return left(response.statusMessage.toString());
      }
    } on DioException catch (e) {
      print(e.message.toString());
      if (e.response?.statusCode == 400) {
        print("Bu foydalanuvchi mavjud");
        return left(e.message.toString());
      } else if (e.type == DioExceptionType.unknown) {
        print("he");
        return left("internetingizni tekshiring");
      } else {
        print("hi");
        return left(e.message.toString());
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
      return e.message.toString();
    }
  }
}
