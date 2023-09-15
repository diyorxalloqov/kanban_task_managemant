

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kanban_task_app/application/provider/login_provider.dart';
import 'package:kanban_task_app/presenatation/ui/pages/register_page.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPAgeState();
}

GlobalKey<FormState> controllerKey=GlobalKey<FormState>();

class _LoginPAgeState extends State<LoginPage> {

    
 bool _remember=false;
  @override
  Widget build(BuildContext context) {
     LoginProvider  loginProvider=Provider.of<LoginProvider>(context);


    

    return ChangeNotifierProvider(create: (context)=>LoginProvider(),
       builder: (context,child) =>  Scaffold(

      
       body: SingleChildScrollView(
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const  SizedBox(height: 160,),
             Row(
               
               mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/Icon.png",width: 50,),
                Text(" Kanban ", style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w800),)
            ],),
           SizedBox(height: 20,),
           Form(
              key: controllerKey,
             child: Column(
               children: [
                 Padding(
                   padding: const EdgeInsets.only(left: 30,right: 30,top: 10,bottom: 15),
                   child: TextFormField(  
                    
                         keyboardType: TextInputType.number,
                         
                         controller:  loginProvider.phoneController,
                         validator: (value){
                             if(value==null){
                              return  "Iltimos Telefon nomer kiriting:";
                             }else if(value.length != 9){
                               return "Raqamni to'liq kiriting: ";
                              
                            }else{
                                return null;
                             }
                         },
                          decoration: InputDecoration(
                            labelText: "Phone number",
                            prefixText: "+998",
                            prefixStyle: const TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 16),
                            hintText: "_phone_number ",
                            hintStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
                          ),
                   ),
                 ),
              Padding(
               padding: const EdgeInsets.only(left: 30,right: 30,top: 10,bottom: 5),
               child: TextFormField(
                        
                       controller: loginProvider.passwordController,
                       validator: (value){
                          if( value== null ){
                            return   "Parol kiriting: ";
                          }
                          else if(value.isNotEmpty && value.length < 4){
                               return  "Parol 4 ta belgidan kam bo'lamsligi kerak : ";
                          }else if(value.length >= 16){
                               return  "Bu Parol yaroqsiz! Boshqa parol kiriting: ";
                          }else{
                               return   null;
                          }
                       },
                      decoration: const InputDecoration(
                        labelText: "Password",
                        hintText: " Password* ",
                        hintStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),
                        
                        border: OutlineInputBorder(),
                      ),
               ),
              ),
               ],
             ),
           ),
          
       
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: [
                   Checkbox(
                      value: _remember,
                         onChanged: (v) {
                         setState(() {
                                 _remember = v!;
                         });
                        },
                           activeColor: Color(0xFF635FC7), // Belgilangan CheckBox rangi
                           checkColor: Colors.white, // Belgilangan belgi rangi
                   ),
                   Text("Remember me ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 15),)
                  ],
               ),
            ),
       
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(double.maxFinite, 30),
                  backgroundColor:Color(0xFF635FC7),
                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
                ),
                
                onPressed: (){
                      if(controllerKey.currentState!.validate()){
                        loginProvider.login(context);
                      }
                },
                 child: Text("LOGIN",style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w700),)),
            ),
           
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: (){
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>RegisterPage()), (route) => false);
                  },
                  child: Text("Don't have an account?Register",style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),),
                ),
              )
       
           
          ],
         ),
       ),
    ),);
  }
}



