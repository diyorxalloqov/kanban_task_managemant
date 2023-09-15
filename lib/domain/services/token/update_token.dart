


import 'package:dio/dio.dart';
import 'package:kanban_task_app/domain/core/constants/constant_app.dart';
import 'package:kanban_task_app/domain/db/token_db_service.dart';
import 'package:kanban_task_app/domain/model/access_token.dart';

class   UpdateAccessToken{


  
  


  Future<dynamic>   updateAccessToken()async{

      try {
           var tokenDBService = TokenDBService();
           await tokenDBService.openBox();
           var   refresh = tokenDBService.tokenBox!.get("token")['refresh'];
      

            print("Refresh Token bu ExpireTime 1 kun $refresh");
              Response   response=await Dio().post(AppConstants.refreshTokenUrl,data: {
                "refresh": refresh
        });
         
         print("Update AcessToken ");
         print(response.data);
         print(response.statusCode);
         

        if( response.statusCode == 200){
          String accessToken=response.data['access'];
            await  tokenDBService.updateAccessToken(accessToken);
            return  AccessModel.fromJson(response.data);
        }else{
             return   response.statusMessage.toString();
        }
      }on DioException catch (e) {
        print("Xato Update AccessTokenda ");
        print(e.message);
        
      }
  }
}