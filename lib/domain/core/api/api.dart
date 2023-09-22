import 'package:kanban_task_managemant/domain/core/api/server.dart';

class Api {
  static final String register = "${Server.server}/user/register/";
  static final String login = "${Server.server}/user/login/";
  static final String tokenRefresh = "${Server.server}/user/token/refresh/";
  static final String createBoard = "${Server.server}/board/";
  static final String boards = "${Server.server}/board/";
  static final String deleteboards = "${Server.server}/board/";
  static final String createTask = "${Server.server}//";
}
