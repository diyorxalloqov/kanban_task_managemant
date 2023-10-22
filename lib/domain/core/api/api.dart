import 'package:kanban_task_managemant/domain/core/api/server.dart';

class Api {
  /// auth
  static final String register = "${Server.server}/user/register/";
  static final String login = "${Server.server}/user/login/";
  static final String tokenRefresh = "${Server.server}/user/token/refresh/";

  /// boards
  static final String createBoard = "${Server.server}/board/";
  static final String boards = "${Server.server}/board/";
  static final String deleteboards = "${Server.server}/board/";
  static final String updateBoard = "${Server.server}/board/";

  ///task Conditions
  static final String createTaskCondition = "${Server.server}/task/";
  static final String putTaskCondition = "${Server.server}/task/details/";
}
