import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class TokenDBService {
  late Box? token;

  Future<void> openBox() async {
    Directory appdocdir = await getApplicationDocumentsDirectory();
    Hive.init(appdocdir.path);
    token = await Hive.openBox("tokens");
  }

  Future<String> getToken() async {
    await openBox();
    return token!.get("token")["accessToken"].toString();
  }

  Future<void> writeToDB(String refreshToken, String accessToken) async {
    try {
      await openBox();
      await token!.clear();
      await token!.put(
          "token", {"refreshToken": refreshToken, "accessToken": accessToken});
      print(token!.length);
      print(token!.values);
      print("Succes write to db");
    } on HiveError catch (e) {
      print(e.message);
    }
  }

  Future<void> updateAccessToken(String accessToken) async {
    await openBox();
    // Get the token data
    var tokenData = token!.get("token");
    if (tokenData != null && tokenData is Map<dynamic, dynamic>) {
      // Check if the "refreshToken" key exists
      if (tokenData.containsKey("refreshToken")) {
        // Update the access token
        tokenData["accessToken"] = accessToken;
        await token!.put("token", tokenData);

        print(tokenData["accessToken"]);
        print("success update db");
      } else {
        print("Missing 'refreshToken' key in token data");
      }
    } else {
      print("Invalid token data format");
    }
    return;
  }

  // Future<bool> findsame(String value) async {
  //   await openBox();
  //   for (int i = 0; i < token!.length; i++) {
  //     var data = token!.getAt(i) as Map<String, dynamic>;
  //     if (data["refreshToken"] == value || data["accessToken"] == value) {
  //       return true;
  //     }
  //   }
  //   return false;
  // }
}
