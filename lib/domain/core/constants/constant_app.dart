



import 'dart:core';

import 'package:kanban_task_app/domain/core/constants/server.dart';



class  AppConstants{


  
  /////Register ///
  static  const String  userRegisterUrl="${Server.server}/user/register/";

  /// user Login///
  static const  String  userLogin="${Server.server}/user/login/";

  // Created Board Url//
  static const  String  boardsUrl="${Server.server}/board/" ;

  


  static const  String  refreshTokenUrl="${Server.server}/user/token/refresh/";


}