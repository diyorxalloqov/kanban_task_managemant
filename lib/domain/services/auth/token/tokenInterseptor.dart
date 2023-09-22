// import 'package:dio/dio.dart';

// class TokenInterceptor extends InterceptorsWrapper {
//   final Dio _dio;

//   TokenInterceptor(this._dio);

//   @override
//   Future onRequest(RequestOptions options) async {
//     // Check if the access token is still valid
//     if (isTokenExpired()) {
//       // Access token is expired, refresh it
//       final newAccessToken = await refreshToken();
//       options.headers['Authorization'] = 'Bearer $newAccessToken';
//     } else {
//       // Access token is still valid, use it
//       final accessToken = getAccessToken();
//       options.headers['Authorization'] = 'Bearer $accessToken';
//     }
//     return super.onRequest(options);
//   }

//   // Add functions to check token expiration, refresh token, and get the current access token
// }
