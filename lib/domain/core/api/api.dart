import 'package:kanban_task_managemant/domain/core/api/server.dart';

class Api {
  static const String register = "${Server.server}/user/register/";
  static const String login = "${Server.server}/user/login/";
  static const String tokenRefresh = "${Server.server}/user/token/refresh/";
}
