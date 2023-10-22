// import 'dart:io';

// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:path_provider/path_provider.dart';

// class IDDBService {
//   Box? idBox;

//   Future<void> openBox() async {
//     Directory appDocdir = await getApplicationDocumentsDirectory();
//     Hive.init(appDocdir.path);
//     idBox = await Hive.openBox("idBox");
//     print(idBox!.length);
//   }

//   Future<void> writeToDB(int id) async {
//     await openBox();
//     await idBox!.add({"id": id});
//     print(idBox!.length);
//     print("SAVED id");
//   }

//   Future<void> deleteIndexId(int index) async {
//     await openBox();
//     await idBox!.deleteAt(index);
//     return;
//   }

//   // index ni requierd qilib index bilan ochirib tashlash kerak
// }
