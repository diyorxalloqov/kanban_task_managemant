import 'package:dio/dio.dart';
import 'package:kanban_task_managemant/domain/core/api/api.dart';
import 'package:kanban_task_managemant/domain/core/api/baseoption.dart';
import 'package:kanban_task_managemant/domain/source/db/hive/auth/token/tokenDBservice.dart';
import 'package:kanban_task_managemant/domain/model/auth/accessTokenModel.dart';

class UpdateAccessTokenService {
  Future<dynamic> updateAccessToken() async {
    final TokenDBService tokenDBService = TokenDBService();
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

// import 'package:dio/dio.dart';
// import 'package:kanban_task_managemant/domain/db/token/tokenDBservice.dart';

// class TokenInterceptor extends Interceptor {
//   final Dio _dio;
//   final TokenDBService _tokenDBService;

//   TokenInterceptor(this._dio, this._tokenDBService);

//   @override
//   void onRequest(
//       RequestOptions options, RequestInterceptorHandler handler) async {
//     // Check if the access token is still valid
//     if (isTokenExpired()) {
//       // Access token is expired, refresh it using your UpdateAccessToken service
//       final newAccessToken = await updateAccessToken();
//       options.headers['Authorization'] = 'Bearer $newAccessToken';
//     } else {
//       // Access token is still valid, use it
//       final accessToken = getAccessToken();
//       options.headers['Authorization'] = 'Bearer $accessToken';
//     }
//     handler.next(options);
//   }

//   bool isTokenExpired() {
//     // Implement your logic to check if the access token is expired
//     // Compare the current timestamp with the stored expiration timestamp
//     // Return true if it's expired, false otherwise
//     return false; // Replace with your logic
//   }

//   String getAccessToken() {
//     // Retrieve the access token from your token storage
//     final accessToken = _tokenDBService.getAccessToken(); // Replace with your storage logic
//     return accessToken;
//   }

//   Future<String?> updateAccessToken() async {
//     // Call your UpdateAccessToken service to refresh the access token
//     final updateService = UpdateAccessToken();
//     final newAccessToken = await updateService.updateAccessToken();
//     return newAccessToken;
//   }
// }

