import 'package:dio/dio.dart';
import 'package:kanban_task_managemant/domain/core/api/server.dart';

class BaseOption {
 static final BaseOptions dio = BaseOptions(
      baseUrl: Server.server,
      connectTimeout: const Duration(milliseconds: Server.connectionTimeout),
      receiveTimeout: const Duration(milliseconds: Server.receiveTimeout),
      responseType: ResponseType.json);
}
