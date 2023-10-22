import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:kanban_task_managemant/domain/core/api/api.dart';
import 'package:kanban_task_managemant/domain/core/api/baseoption.dart';
import 'package:kanban_task_managemant/domain/core/config/network_config.dart';
import 'package:kanban_task_managemant/domain/source/db/auth/token/tokenDBservice.dart';
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
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': "Bearer $accessToken"
          },
        ),
      );
      print(response.statusCode);
      if (response.statusCode == 201) {
        print("success created board");
        return right(CreateBoardsModel.fromJson(response.data));
      } else {
        return left("Board not created");
      }
    } on DioException catch (e) {
      print(e.message.toString());
      return left(NetworkExeptionResponse(e).messageForUser);
    }
  }

  Future<Either<String, List<BoardsListModel>>> boardsListGet(String accessToken) async {
    // final TokenDBService tokenDBService = TokenDBService();
    // await tokenDBService.openBox();

    // String accessToken =
    //   tokenDBService.token!.get("token")["accessToken"].toString();
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
        return left(
            NetworkErrorResponse(response.statusMessage.toString()).error);
      }
    } on DioException catch (e) {
      return left(NetworkExeptionResponse(e).messageForUser);
    }
  }

  Future<Either<String, String>> deleteBoardDetails(int id) async {
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
        return right("Board Successfully deleted");
      } else {
        print("Board Details not deleted fix");
        return left("Board Details not deleted fix");
      }
    } on DioException catch (e) {
      print(e.message.toString());
      return left(NetworkExeptionResponse(e).messageForUser);
    }
  }

  Future<Either<String, String>> putBoardDetails(
      int id, String newTitle) async {
    final TokenDBService tokenDBService = TokenDBService();
    await tokenDBService.openBox();

    String accessToken =
        tokenDBService.token!.get("token")["accessToken"].toString();
    try {
      Response response = await Dio(BaseOption.dio).put(
        data: {"title": newTitle},
        "${Api.updateBoard}$id/",
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': "Bearer $accessToken"
          },
        ),
      );
      if (response.statusCode == 200) {
        print("Board name is successfully updated");
        return right("Board name is Successfully updated");
      } else {
        print("Board name is not updated fix");
        return left("Board name is not updated fix");
      }
    } on DioException catch (e) {
      print(e.message.toString());
      return left(NetworkExeptionResponse(e).messageForUser);
    }
  }
}
