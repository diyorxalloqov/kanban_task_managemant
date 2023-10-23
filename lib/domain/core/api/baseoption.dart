import 'package:dio/dio.dart';
import 'package:kanban_task_managemant/domain/core/api/server.dart';
import 'package:kanban_task_managemant/domain/source/db/hive/auth/token/tokenDBservice.dart';

class BaseOption {
  static final BaseOptions _dioOptions = BaseOptions(
    baseUrl: Server.server,
    sendTimeout: const Duration(seconds: Server.sendTimeout),
    connectTimeout: const Duration(seconds: Server.connectionTimeout),
    receiveTimeout: const Duration(seconds: Server.receiveTimeout),
    validateStatus: (status) {
      if (status! >= 100 && status <= 599) {
        return true;
      } else {
        return false;
      }
    },
    responseType: ResponseType.json,
  );

  static Dio getDio() {
    final Dio dio = Dio(_dioOptions);
    print("salomlar ");

    dio.interceptors.add(
      InterceptorsWrapper(
        onResponse: (response, handler) async {
          final TokenDBService tokenDBService = TokenDBService();
          await tokenDBService.openBox();

          String refreshToken =
              tokenDBService.token!.get("token")["refreshToken"].toString();
          print(refreshToken);
          print('interceptor OnResponse');
          if (response.statusCode == 401) {
            print('refresh Token');
            var responseRefresh = await Dio()
                .post('url', data: {"Authorization": "Bearer $refreshToken}"});

            if (responseRefresh.statusCode! >= 200 &&
                responseRefresh.statusCode! < 300) {
              handler.next(responseRefresh);
            } else {
              handler.next(response);
            }
          } else {
            handler.next(response);
          }
        },
        onRequest: (request, handler) {
          print('interceptor OnRequest');
          request.headers.addAll({});
          handler.next(request);
        },
        onError: (request, errorHandler) async {
          errorHandler.next(request);
          print('interceptorOnError');
        },
      ),
    );

    return dio;
  }

  static BaseOptions get dio => _dioOptions;
}
