import 'package:flutter/material.dart';
import 'package:kanban_task_managemant/application/provider/auth/loginProvider.dart';
import 'package:kanban_task_managemant/domain/core/constant/extensions/size.dart';
import 'package:kanban_task_managemant/domain/core/constant/extensions/theme_extension.dart';
import 'package:kanban_task_managemant/domain/source/db/auth/token/tokenDBservice.dart';
import 'package:kanban_task_managemant/presentition/ui/auth/registerPage.dart';
import 'package:kanban_task_managemant/presentition/ui/widgets/addSpace.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> loginControllerKey = GlobalKey<FormState>();

  bool _check = false;
  bool textformfieldPrefix = false;
  bool visible = true;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        textformfieldPrefix = true;
      } else {
        textformfieldPrefix = false;
      }
      setState(() {});
    });
  }

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
                      Form(
                        key: loginControllerKey,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: TextFormField(
                                focusNode: _focusNode,
                                style: TextStyle(
                                    color: context.brightness
                                        ? Colors.white
                                        : Colors.black),
                                keyboardType: TextInputType.number,
                                controller: loginProvider.loginphoneController,
                                inputFormatters: [
                                  MaskTextInputFormatter(
                                    mask: ' 00 000 00 00',
                                    filter: {'0': RegExp(r'[0-9]')},
                                  )
                                ],
                                decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    isDense: true,
                                    prefix: textformfieldPrefix
                                        ? Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Image.asset(
                                                "assets/flag.jpg",
                                                fit: BoxFit.cover,
                                                width: 30,
                                              ),
                                              addWidth(context.width * 0.03),
                                              const Text(
                                                "+998  ",
                                                style: TextStyle(),
                                              )
                                            ],
                                          )
                                        : null,
                                    hintText: "Telephone number"),
                                validator: (value) {
                                  if (value == null) {
                                    return "Iltimos bo'sh qoldirmang";
                                  } else if (value.length != 13) {
                                    return "Raqamni to'liq kiriting";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: TextFormField(
                                obscureText: visible,
                                obscuringCharacter: "*",
                                controller:
                                    loginProvider.loginpassword1Controller,
                                decoration: InputDecoration(
                                    suffixIcon: Visibility(
                                        child: IconButton(
                                            onPressed: () {
                                              visible = !visible;
                                              setState(() {});
                                            },
                                            icon: visible
                                                ? const Icon(
                                                    Icons.visibility_off)
                                                : const Icon(
                                                    Icons.visibility))),
                                    border: const OutlineInputBorder(),
                                    hintText: "Password"),
                                validator: (value) {
                                  if (value == null) {
                                    return "Iltimos bo'sh qoldirmang";
                                  } else if (value.length < 4) {
                                    return "Parol 4 ta belgidan kam bo'lmasligi kerak";
                                  } else if (value.length > 16) {
                                    return "Parol yaroqsiz";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ],
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
                              if (loginControllerKey.currentState!.validate()) {
                                loginProvider.logins(context).then(
                                    (value) => loginProvider.clearTextFields());
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                backgroundColor: Colors.deepPurple),
                            child: Center(
                                child: loginProvider.isLoading
                                    ? const CircularProgressIndicator.adaptive(
                                        backgroundColor: Colors.white)
                                    : const Text(
                                        "Login",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ))),
                      ),
                      TextButton(
                          onPressed: () async {
                            await TokenDBService().getToken();
                            Future.delayed(const Duration(seconds: 1)).then(
                                (value) => Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const RegisterPage()),
                                    (route) => false));
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
