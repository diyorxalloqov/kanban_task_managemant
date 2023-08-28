import 'package:flutter/material.dart';
import 'package:kanban_task_managemant/application/provider/registerProvider.dart';
import 'package:kanban_task_managemant/domain/core/constant/context/size.dart';
import 'package:kanban_task_managemant/presentition/ui/auth/loginPage.dart';
import 'package:kanban_task_managemant/presentition/ui/widgets/addSpace.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    RegisterProvider registerProvider = Provider.of<RegisterProvider>(context);
    return ChangeNotifierProvider(
      create: (context) => RegisterProvider(),
      builder: (context, child) => Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: SafeArea(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/group.png"),
                    addWidth(context.width * 0.03),
                    const Text(
                      "Kanban",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                addHeigth(context.height * 0.03),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    controller: registerProvider.nameController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: "Name"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    controller: registerProvider.lastNameController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: "Last name"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    controller: registerProvider.phoneController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Telephone number"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    controller: registerProvider.password1Controller,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: "Password"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    controller: registerProvider.password2Controller,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Confirm password"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ElevatedButton(
                      onPressed: () {
                        registerProvider.registers(context);
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          backgroundColor: Colors.deepPurple),
                      child: const Center(
                          child: Text(
                        "Register",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ))),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                          (route) => false);
                    },
                    child: const Text(
                      "Already have an accaunt? Log In",
                      style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline),
                    ))
              ],
            )),
          ),
        ),
      ),
    );
  }
}
