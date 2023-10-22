import 'package:dio/dio.dart';

abstract class NetworkResponseConfig {
  NetworkResponseConfig();
}

// class NetworkSuccesResponse<Model> extends NetworkResponseConfig {
//   Model model;
//   NetworkSuccesResponse(this.model);
// }

class NetworkErrorResponse extends NetworkResponseConfig {
  String error = "";
  NetworkErrorResponse(this.error);
}

class NetworkExeptionResponse extends NetworkResponseConfig {
  DioException exeption;
  String messageForUser = '';
  NetworkExeptionResponse(this.exeption) {
    if (exeption.type == DioExceptionType.connectionTimeout ||
        exeption.type == DioExceptionType.receiveTimeout ||
        exeption.type == DioExceptionType.sendTimeout ||
        exeption.type == DioExceptionType.unknown) {
      messageForUser = 'Iltimos Internetingizni tekshiring';
    } else {
      messageForUser = exeption.message.toString();
    }
  }
}
