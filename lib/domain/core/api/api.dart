
import 'package:kanban_task_managemant/domain/core/api/server.dart';

class Api {
  /// auth
  static final String register = "${Server.server}/api/regis/";
  static final String login = "${Server.server}/api/login/";
  static final String tokenRefresh = "${Server.server1}/user/token/refresh/";

  /// boards
  static final String createBoard = "${Server.server1}/board/";
  static final String boards = "${Server.server1}/board/";
  static final String deleteboards = "${Server.server1}/board/";
  static final String updateBoard = "${Server.server1}/board/";

  ///task Conditions
  static final String createTaskCondition = "${Server.server1}/task/";
  static final String putTaskCondition = "${Server.server1}/task/details/";
}
