import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:kanban_task_managemant/domain/model/auth/loginModel.dart';
import 'package:path_provider/path_provider.dart';

class AuthDBService {
  Box<LoginModel>? box;

  Future<void> openBox() async {
    Directory appDocdir = await getApplicationDocumentsDirectory();
    Hive.init(appDocdir.path);
    box = await Hive.openBox<LoginModel>("data");
  }

  Future<void> closeBox() async {
    await box!.close();
  }

  Future<void> writeToDB(LoginModel data) async {
    try {
      await openBox();
      await box!.clear();
      await box!.put("login", data);
      print("Data written successfully.");
      print(box!.get("login")!.refresh);
    } catch (error) {
      print("Error writing data: $error");
    } finally {
      await closeBox();
    }
  }

  Future<dynamic> getData() async {
    await openBox();
    print(box!.get("login")!.refresh);
    return box!.get("login");

  }

  static void registerAdapter() async {
    Hive.registerAdapter(LoginModelAdapter());
    Hive.registerAdapter(DataAdapter());
    Hive.registerAdapter(ItemAdapter());
    Hive.registerAdapter(BoardsAdapter());
  }
}
