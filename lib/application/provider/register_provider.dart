



import 'package:flutter/material.dart';
import 'package:kanban_task_app/domain/db/auth_db_service.dart';
import 'package:kanban_task_app/domain/model/register_model.dart';
import 'package:kanban_task_app/domain/services/auth/login_service.dart';

import 'package:kanban_task_app/presenatation/ui/pages/login_page.dart';
import 'package:provider/provider.dart';

class  RegisterProvider   extends ChangeNotifier{
   LoginService registerService=LoginService();
   

   TextEditingController  nameController=TextEditingController();
   TextEditingController  lastNameController=TextEditingController();
   TextEditingController  password1Controller=TextEditingController();
   TextEditingController  password2Controller=TextEditingController();
   TextEditingController  phoneController=TextEditingController();

   bool isLoading=false;
   String error=" ";

   Future<void>  register(BuildContext context)async{
     
      isLoading=true;
      notifyListeners();
      dynamic  response=await  registerService.register(password1: password1Controller.text, password2: password2Controller.text,
                      phone: phoneController.text,first_name: nameController.text,last_name: lastNameController.text);
      if( response is RegisterModel ){
        
        isLoading=false;
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginPage()), (route) => false);
         notifyListeners();
      }else {
        isLoading=false;
        error=response;
        notifyListeners();
      }

   }

}