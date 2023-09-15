import 'package:dio/dio.dart';
import 'package:kanban_task_app/domain/core/constants/constant_app.dart';
import 'package:kanban_task_app/domain/core/constants/server.dart';

class ClientOptions {
  static final BaseOptions baseOptions = BaseOptions(
    baseUrl:   AppConstants.boardsUrl,
    connectTimeout: Duration(milliseconds: Server.connectionTimeout),
    receiveTimeout: Duration(milliseconds: Server.receiveTimeout),
    responseType: ResponseType.json,
  );
}