import 'package:dio/dio.dart';
import 'package:kanban_task_managemant/domain/core/api/api.dart';
import 'package:kanban_task_managemant/domain/core/api/baseoption.dart';
import 'package:kanban_task_managemant/domain/db/tokenDBservice.dart';
import 'package:kanban_task_managemant/domain/model/auth/accessTokenModel.dart';

class UpdateAccessToken {
  Future<dynamic> updateAccessToken() async {
    TokenDBService tokenDBService = TokenDBService();
    await tokenDBService.openBox();

    var refreshToken =
        tokenDBService.token!.get("token")["refreshToken"].toString();

    try {
      Response response = await Dio(BaseOption.dio).post(Api.tokenRefresh,
          data: {"refresh": refreshToken},
          options: Options(headers: {'Content-Type': 'application/json'}));
      print(response.data);
      print("success updateToken service");

      if (response.statusCode == 200) {
        String accessToken = response.data['access'];
        await tokenDBService.updateAccessToken(accessToken);
        return AccessModel.fromJson(response.data);
      } else {
        return response.statusMessage.toString();
      }
    } on DioException catch (e) {
      print(e.message);
      print("error");
      return e.message.toString();
    }
  }
}


