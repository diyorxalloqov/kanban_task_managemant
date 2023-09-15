




import 'dart:io';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';


class TokenDBService{
  Box?  tokenBox;
  
  Future<void>  openBox() async{
    Directory  appDocDir=await  getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);

    tokenBox=await Hive.openBox("Tokens");

  }

  Future<void>  closeBox()async{
    await  tokenBox!.close();
  }

 Future<void> writeToDB(String access, String refresh) async {
        try {
             await openBox();
             await tokenBox!.clear();
             await tokenBox!.put(
                       "token",{"access": access, "refresh": refresh});

            print(tokenBox!.length);
           // print(tokenBox!.values);
            print(tokenBox!.get("token")); 
            print("Token DB ISHLADI DBga Yozdi");
            print(tokenBox!.get("token")["refresh"]);

        
            
        } on HiveError catch (e) {
          print(e.message);
        }
       
  }


  Future<dynamic> getAuthModel() async {
       await openBox();
       return tokenBox;
   }

  Future<void> deleteAuth() async {
       await openBox();
       await tokenBox!.deleteFromDisk();
  }

  Future<void> updateAccessToken(String access) async {
    
    await openBox();
    var alldata = tokenBox!.get("token") as Map<String, dynamic>;
    await tokenBox!.put("token", {
      "refresh": alldata["refresh"],
      "access": access,
    });
    print(tokenBox!.get("token")["access"]);
    print("Refresh Token orqali olingan Access Token yozildi");
           return;
  }

  Future<bool> findsame(String value) async {
    await openBox();
    for (int i = 0; i < tokenBox!.length; i++) {
      var data = tokenBox!.getAt(i) as Map<String, dynamic>;
      if (data["refresh"] == value || data["access"] == value) {
        return true;
      }
    }
    return false;
  }


}
