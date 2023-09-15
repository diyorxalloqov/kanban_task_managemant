



import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:kanban_task_app/domain/core/constants/constant_app.dart';
import 'package:kanban_task_app/domain/core/constants/server.dart';
import 'package:kanban_task_app/domain/model/login_response.dart';
import 'package:kanban_task_app/domain/model/register_model.dart';



class LoginService {
  

  final BaseOptions _dio = BaseOptions(
    baseUrl: Server.server,
    connectTimeout: const Duration(milliseconds: Server.connectionTimeout),
    receiveTimeout: const Duration(milliseconds: Server.receiveTimeout),
    responseType: ResponseType.json,
  );

  void _addToken(String access, String refresh) {
    _dio.headers["Authorization"] = "Bearer $access";
  }

/// Login Function ///
/// 
  Future<dynamic> login({required String password, required String phone}) async {
    try {
      Response response = await Dio(_dio).post(
        AppConstants.userLogin,
        data: {'phone': phone, 'password': password},
      );

      if (response.statusCode == 200) {
        print(response.data);
        LoginResponse loginResponse =
                LoginResponse.fromJson(response.data);
            // LoginResponse.fromJson(jsonEncode(response.data));
        print(loginResponse);

         
          // _loginDBService.writeToDB(loginResponse.access.toString(),
          //     loginResponse.refresh.toString());
          // print(loginResponse.access.toString());
          // print(loginResponse.refresh.toString());

            
            
          // //BU Alohida TokenBox uchun edi
          // _addToken(_loginDBService.tokenBox!.get("access"),
          //      _loginDBService.tokenBox!.get("refresh"));

          // print(_dio.headers);

          
        

            return     loginResponse;
      } else {
        throw Exception("Login failed");
      }
    } on DioException catch (e) {
      // Handle DioError here if needed
      rethrow;
    }
  }


  Future<dynamic> register( {required String password1,
            required String password2, required String phone,
           String? first_name, String? last_name }
     ) async  {
        try {
                final   response= await   Dio(_dio,).post(AppConstants.userRegisterUrl,data: {
                          "password1":password1,
                          "password2":password2,
                          "phone":phone,
                          "first_name":first_name,
                          "last_name":last_name   
           },     options: Options(headers: {'Content-Type':'application/json'})
              );

              print(response.statusCode);
              print(response.statusMessage.toString());
            if(response.statusCode==201){
              print(response.data);
               return RegisterModel.fromJson(jsonEncode(response.data));
            }else {
               print(response.statusCode);
               return  response.data;
            }
        } on DioException catch (e) {
           print(e.error.toString());
              rethrow;   
              }

  }



    /////GET  Method/////
  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await Dio(_dio).get(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      // Handle DioError here if needed
      rethrow;
    }
  }
}

