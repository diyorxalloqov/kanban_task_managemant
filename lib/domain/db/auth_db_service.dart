



import 'dart:io';

import 'package:hive/hive.dart';
import 'package:kanban_task_app/domain/model/login_response.dart';
import 'package:path_provider/path_provider.dart';

class AuthDBService{
   Box<LoginResponse>? authBox;

  Future<void> openBox()async{
     Directory  appDocDir=await  getApplicationDocumentsDirectory();
     Hive.init(appDocDir.path);
     authBox=await  Hive.openBox<LoginResponse>("Auth");
     
  }

  Future<void>  closeBox()async{
      await authBox!.close();
  }

  Future<void>  writeToDB(LoginResponse model) async{
      try {
            await openBox();
            await  authBox!.clear();
            await  authBox!.put("login",model);
            print("Bazaga LoginResponse model yozildi ");
            print(authBox!.get("login")!.refresh);
      } catch (error) {
        print("Error WriteTo AuthBox");
      
    } finally  {
         await closeBox();
    }

  }

  Future<dynamic>  getAuthModel()async{
    await  openBox();
    print(authBox!.get("login"));
    return authBox!.get("login");
  }

  Future<void>  deleteAuth() async{
       await  openBox();
       await  authBox!.deleteFromDisk();
  }

  static  void   registerAdapter(){
      Hive.registerAdapter(LoginResponseAdapter());
      Hive.registerAdapter(DataAdapter());
      Hive.registerAdapter(ItemAdapter());
      Hive.registerAdapter(BoardsAdapter());
  }
  
}