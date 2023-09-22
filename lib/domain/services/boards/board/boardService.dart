import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:kanban_task_managemant/domain/core/api/api.dart';
import 'package:kanban_task_managemant/domain/core/api/baseoption.dart';
import 'package:kanban_task_managemant/domain/db/auth/token/tokenDBservice.dart';
import 'package:kanban_task_managemant/domain/model/board/boardsListModel.dart';
import 'package:kanban_task_managemant/domain/model/board/createBoardModel.dart';

class BoardService {
  Future<Either<String, CreateBoardsModel>> createNewBoard(
      String boardName) async {
    final TokenDBService tokenDBService = TokenDBService();
    await tokenDBService.openBox();

    String accessToken =
        tokenDBService.token!.get("token")["accessToken"].toString();

    try {
      Response response = await Dio(BaseOption.dio).post(
        Api.createBoard,
        data: {"title": boardName},
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': "Bearer $accessToken"
        }),
      );
      print(response.statusCode);
      if (response.statusCode == 201) {
        print("success created board");
        return right(CreateBoardsModel.fromJson(response.data));
      } else {
        return left(response.statusMessage.toString());
      }
    } on DioException catch (e) {
      print(e.message.toString());
      return left(e.message.toString());
    }
  }

  Future<Either<String, List<BoardsListModel>>> boardsListGet() async {
    final TokenDBService tokenDBService = TokenDBService();
    await tokenDBService.openBox();

    String accessToken =
        tokenDBService.token!.get("token")["accessToken"].toString();
    try {
      Response response = await Dio(BaseOption.dio).get(
        Api.boards,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': "Bearer $accessToken"
        }),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.data);
        return right((response.data as List)
            .map((e) => BoardsListModel.fromJson(e))
            .toList());
      } else {
        return left(response.statusMessage.toString());
      }
    } on DioException catch (e) {
      return left(e.message.toString());
    }
  }

  Future<dynamic> deleteBoardDetails(int id) async {
    final TokenDBService tokenDBService = TokenDBService();
    await tokenDBService.openBox();

    String accessToken =
        tokenDBService.token!.get("token")["accessToken"].toString();
    try {
      Response response = await Dio(BaseOption.dio).delete(
        "${Api.deleteboards}$id/",
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': "Bearer $accessToken"
        }),
      );
      if (response.statusCode == 204) {
        print("Board Details successfully deleted");
        return "Board Successfully deleted";
      } else {
        print("Board Details not deleted fix");
        return "Board not deleted";
      }
    } on DioException catch (e) {
      print(e.message.toString());
      return e.message.toString();
    }
  }

  Future<dynamic> putBoardDetails(int id) async {
    final TokenDBService tokenDBService = TokenDBService();
    await tokenDBService.openBox();

    String accessToken =
        tokenDBService.token!.get("token")["accessToken"].toString();
    try {
      Response response = await Dio(BaseOption.dio).put(
        "${Api.deleteboards}/$id/",
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': "Bearer $accessToken"
          },
        ),
      );
      if (response.statusCode == 200) {
        print("Board Details successfully updated");
        return "Board Successfully updated";
      } else {
        print("Board Details not updated fix");
        return "Board not updated";
      }
    } on DioException catch (e) {
      print(e.message.toString());
      return e.message.toString();
    }
  }
}
