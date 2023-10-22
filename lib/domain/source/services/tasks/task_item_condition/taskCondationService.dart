import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:kanban_task_managemant/domain/core/api/api.dart';
import 'package:kanban_task_managemant/domain/core/api/baseoption.dart';
import 'package:kanban_task_managemant/domain/source/db/auth/token/tokenDBservice.dart';
// import 'package:kanban_task_managemant/domain/model/board/boardsListModel.dart';

class TaskCondationService {
  //TaskCondition Model
  /// create
  Future<Either<String, String>> taskItemCreate(
      String title, int boardId) async {
    final TokenDBService tokenDBService = TokenDBService();
    await tokenDBService.openBox();

    String accessToken =
        tokenDBService.token!.get("token")["accessToken"].toString();

    try {
      Response response = await Dio(BaseOption.dio).post(
        Api.createTaskCondition,
        data: {"title": title, "board": boardId},
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': "Bearer $accessToken"
          },
        ),
      );
      if (response.statusCode == 201) {
        print("TaskCondition succesfully created");
        return right("TaskCondition succesfully created");
        // right(TaskCondition.fromJson(response.data));
      } else {
        print("TaskCondition not created");
        return left("TaskCondition not created");
      }
    } on DioException catch (e) {
      print(e.error.toString());
      return left(e.message.toString());
    }
  }

  // put task condition

  Future<Either<String, String>> taskItemPut(String title, int boardId) async {
    final TokenDBService tokenDBService = TokenDBService();
    await tokenDBService.openBox();

    String accessToken =
        tokenDBService.token!.get("token")["accessToken"].toString();

    try {
      Response response = await Dio(BaseOption.dio).put(
        Api.putTaskCondition,
        data: {"title": title, "board": boardId},
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': "Bearer $accessToken"
          },
        ),
      );
      if (response.statusCode == 200) {
        print("TaskCondition succesfully updated");
        return right("TaskCondition succesfully updated");
        // right(TaskCondition.fromJson(response.data));
      } else {
        print("TaskCondition not updated");
        return left("TaskCondition not updated");
      }
    } on DioException catch (e) {
      print(e.error.toString());
      return left(e.message.toString());
    }
  }
}
