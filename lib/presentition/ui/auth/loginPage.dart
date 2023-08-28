import 'package:flutter/material.dart';
import 'package:kanban_task_managemant/application/provider/loginProvider.dart';
import 'package:kanban_task_managemant/domain/core/constant/context/size.dart';
import 'package:kanban_task_managemant/presentition/ui/auth/registerPage.dart';
import 'package:kanban_task_managemant/presentition/ui/widgets/addSpace.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _check = false;
  @override
  Widget build(BuildContext context) {
    LoginProvider loginProvider = Provider.of<LoginProvider>(context);
    return ChangeNotifierProvider(
        create: (context) => LoginProvider(),
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
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      addHeigth(context.height * 0.03),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextFormField(
                          controller: loginProvider.loginphoneController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Telephone number"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextFormField(
                          controller: loginProvider.loginpassword1Controller,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Password"),
                        ),
                      ),
                      Row(
                        children: [
                          Checkbox(
                              value: _check,
                              onChanged: (v) {
                                setState(() {
                                  _check = v!;
                                });
                              }),
                          const Text(
                            "Remember me",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      addHeigth(context.height * 0.03),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: ElevatedButton(
                            onPressed: () {
                              loginProvider.logins(context);
                            },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                backgroundColor: Colors.deepPurple),
                            child: const Center(
                                child: Text(
                              "Login",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ))),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const RegisterPage()),
                                (route) => false);
                          },
                          child: const Text(
                            "Don't have an accaunt? Register",
                            style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline),
                          ))
                    ],
                  )),
                ),
              ),
            ));
  }
}
