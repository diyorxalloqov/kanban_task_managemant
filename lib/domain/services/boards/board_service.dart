

import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:kanban_task_app/domain/core/constants/base_options.dart';
import 'package:kanban_task_app/domain/core/constants/constant_app.dart';

import 'package:kanban_task_app/domain/db/token_db_service.dart';
import 'package:kanban_task_app/domain/model/boardModel/boards_list_model.dart';
import 'package:kanban_task_app/domain/model/boardModel/create_board_model.dart';

class  BoardService{


   Future<dynamic>  createService(String boardTitle)async{
          final  TokenDBService _tokenDBService=TokenDBService();
          await  _tokenDBService.openBox();


          var   accessToken = _tokenDBService.tokenBox!.get("token")['access'].toString();
          print(accessToken);

           try {
               Response   response=await  Dio(ClientOptions.baseOptions).post(AppConstants.boardsUrl,
                     data: { "title": boardTitle}, options: Options(
                    headers: {"Content-type":"application/json","Authorization":"Bearer $accessToken"}
               ));
                    print(response.statusCode);
                 if (response.statusCode==201) {
                       print("Success created Board");
                       return CreateBoardModel.fromJson(response.data);
                 }else{
                      return   response.statusMessage.toString();
                 }
           } on DioException catch (e) {
                 print(e.message.toString());
                 return  e.message.toString();
           }
   }


     Future<Either<String,List<BoardsListModel>>>  getBoardsList() async{
           final  TokenDBService _tokenDBService=TokenDBService();
            await  _tokenDBService.openBox();


          var   accessToken = _tokenDBService.tokenBox!.get("token")['access'].toString();

             try {
                Response response=await  Dio().get(AppConstants.boardsUrl,options: Options(
                  headers: {"Content-type":"application/json","Authorization":"Bearer $accessToken"}
                ));

                if(response.statusCode==200){
                  return right((response.data as List).map((e) => BoardsListModel.fromJson(e)).toList());
                }else{
                  print(response.statusMessage);
                  return  left(response.statusMessage.toString());
                }
             } on DioException catch (e) {
               print(e.error.toString());
               return  left(e.message.toString());
               
               
             }
     }


     Future<dynamic>   deleteBoard(int  id) async {
          final  TokenDBService _tokenDBService=TokenDBService();
            await  _tokenDBService.openBox();


          var   accessToken = _tokenDBService.tokenBox!.get("token")['access'].toString();
      try {
           Response   response=await  Dio().delete("${AppConstants.boardsUrl}details/$id/",
           options: Options(  headers: {"Content-type" : "application/json", "Authorization":"Bearer $accessToken"}
        ));

          print(response.data);
         if (response.statusCode==204){
             return  "Board Succefully deleted";
         }else{
             print(response.statusMessage);
              return  "Board not deleted";
         }
      }on DioException catch (e) {
            print(e.error.toString());
      }
     }
}