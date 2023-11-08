import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:kanban_task_managemant/domain/core/api/api.dart';
import 'package:kanban_task_managemant/domain/core/api/baseoption.dart';
import 'package:kanban_task_managemant/domain/model/auth/loginModel.dart';
import 'package:kanban_task_managemant/domain/model/auth/registerModel.dart';

class AuthService {
  Future<Either<String, RegisterModel>> register(
      {required String phone, required String password}) async {
    try {
      Response response = await Dio(BaseOption.dio).post(
        Api.register,
        data: {"phone": phone, "password": password},
      );
      if (response.statusCode == 200) {
        print(response.statusCode);
        return right(RegisterModel.fromJson(response.data));
      } else if (response.statusCode == 406) {
        print("password");
        return left("Parolda kamida bitta harf qatnashishi kerak");
      } else if (response.statusCode == 400) {
        print("Bu foydalanuvchi mavjud");
        return left('Bu Foydalanuvchi mavjud');
      } else {
        return left(response.statusMessage.toString());
      }
    } on DioException catch (e) {
      print(e.message.toString());
      if (e.type == DioExceptionType.unknown) {
        print("hello");
        return left("internetingizni tekshiring");
      } else {
        print("hi");
        return left(e.message.toString());
      }
    }
  }

  Future<Either<String, LoginModel>> login(
      {required String password, required String phone}) async {
    try {
      Response response = await Dio(BaseOption.dio).post(
        Api.login,
        data: {"phone": phone, "password": password},
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.data);
        return right(LoginModel.fromJson(response.data));
      } else {
        return left(response.statusMessage.toString());
      }
    } on DioException catch (e) {
      print("hello");
      return left(e.message.toString());
    }
  }
}
