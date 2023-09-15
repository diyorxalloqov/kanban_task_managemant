


import 'package:flutter/material.dart';
import 'package:kanban_task_app/application/provider/register_provider.dart';
import 'package:kanban_task_app/presenatation/ui/pages/login_page.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
     RegisterProvider  registerProvider =Provider.of<RegisterProvider>(context);
    return ChangeNotifierProvider(create: (context) => RegisterProvider(),
        builder:(context,child)=>  Scaffold(

       
       body: Center(
         child: SingleChildScrollView(
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const  SizedBox(height: 80,),
               Row(
                 
                 mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/Icon.png",width: 50,),
                  Text(" Kanban ", style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w800),)
              ],),
            const  SizedBox(height: 20,),
             Padding(
               padding: const EdgeInsets.all(20),
               child: TextFormField(
                       controller: registerProvider.nameController,
                      decoration: InputDecoration(
                        hintText: " Name* ",
                        hintStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.w400),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
                      ),
               ),
             ),
             SizedBox(height: 20,),
             Padding(
               padding: const EdgeInsets.all(20),
               child: TextFormField(
                       controller: registerProvider.lastNameController,
                      decoration: InputDecoration(
                        hintText: " Last Name* ",
                        hintStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
                      ),
               ),
             ),
            
             Padding(
               padding: const EdgeInsets.all(20),
               child: TextFormField(
                      controller: registerProvider.phoneController,
                      decoration: InputDecoration(
                        labelText: "Phone Number",
                        hintText: "_phone_number",
                        prefixText: "+998",
                        prefixStyle: const TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 16),
                        hintStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),
                        border: OutlineInputBorder(),
                      ),
               ),
              ),
            const   SizedBox(height: 5,),
               Padding(
               padding: const EdgeInsets.all(20),
               child: TextFormField(
                      controller: registerProvider.password1Controller,
                      decoration: InputDecoration(
                        labelText: "Password",
                        hintText: " Password* ",
                        hintStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),
                        border: OutlineInputBorder(),
                      ),
               ),
              ),
             const  SizedBox(height: 5,),
               Padding(
               padding: const EdgeInsets.all(20),
               child: TextFormField(
                       controller: registerProvider.password2Controller,
                      decoration: InputDecoration(
                        hintText: " Confirm Password* ",
                        hintStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),
                        border: OutlineInputBorder(),
                      ),
               ),
              ),
         
              Padding(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(double.maxFinite, 30),
                    backgroundColor:Color(0xFF635FC7),
                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
                  ),
                  
                  onPressed: (){
                     registerProvider.register(context);
                  },
                   child: Text("Register",style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w600),)),
              ),
             
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: (){
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginPage()), (route) => false);
                    },
                    child:const  Text("Already have an account? Log In",style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w400,
                          fontSize: 15),),
                  ),
                )
         
             
            ],
           ),
         ),
       ),
    ));
  }
}