


import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class  IdDBService{
 Box?  idBox;
 


 Future<void>  openBox() async{
    Directory  appDocDir=await  getApplicationCacheDirectory();
    Hive.init(appDocDir.path);
    idBox=await  Hive.openBox("idBox");

 }

 Future<void>  writeToDB(int id)async{
       await openBox();
       await idBox!.length;
       print("DB Save Id!!");
 }


 Future<void>  deleteIndex(int index)async{
     await  openBox();
     await idBox!.deleteAt(index);
     return;
 }

}