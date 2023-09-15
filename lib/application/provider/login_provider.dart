

import 'package:flutter/material.dart';

import 'package:kanban_task_app/domain/db/auth_db_service.dart';
import 'package:kanban_task_app/domain/db/token_db_service.dart';
import 'package:kanban_task_app/domain/model/login_response.dart';
import 'package:kanban_task_app/domain/services/auth/login_service.dart';

import 'package:kanban_task_app/presenatation/home_page.dart';

class LoginProvider extends ChangeNotifier{
      LoginService _loginService = LoginService();
      AuthDBService   authDB = AuthDBService();
       //Bu LoginResponse Model bo'yicha hivega saqlash
     

     TextEditingController  phoneController=TextEditingController();
     TextEditingController  passwordController=TextEditingController();

      bool isLoading=false;
      LoginResponse? data;
      String errorMessage=" ";
      
      
    Future<void>   login(BuildContext context)async{
        isLoading=true;
        notifyListeners();
        
         print(phoneController.text);
        dynamic  response=await _loginService.login(phone: phoneController.text, password: passwordController.text);
        if(response is LoginResponse){
             isLoading=false;
             data=response;
            print("Login Provider Page");
            print(response.data);
             TokenDBService().writeToDB(data!.access, data!.refresh);
             Navigator.pushAndRemoveUntil(
             context,
              MaterialPageRoute(builder: (context) => HomePage(data: data,)),
              (route) => false,
            );
           
            notifyListeners();
        }else{
           ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response)));
          isLoading=false;
          errorMessage=response.toString();
          notifyListeners();
        }
    }
}