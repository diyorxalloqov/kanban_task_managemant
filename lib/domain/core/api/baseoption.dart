import 'package:dio/dio.dart';
import 'package:kanban_task_managemant/domain/core/api/server.dart';

class BaseOption {
  static final BaseOptions dio = BaseOptions(
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
      
      responseType: ResponseType.json);
}
