import 'package:flutter/material.dart';
import 'package:kanban_task_managemant/application/provider/auth/registerProvider.dart';
import 'package:kanban_task_managemant/domain/core/constant/extensions/size.dart';
import 'package:kanban_task_managemant/presentition/ui/auth/loginPage.dart';
import 'package:kanban_task_managemant/presentition/ui/widgets/addSpace.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<RegisterPage> {
  GlobalKey<FormState> registerController = GlobalKey<FormState>();

  bool prefix = false;

  final FocusNode _focusNode = FocusNode();

  bool passwordVisibile = true;
  bool passconfirmVisible = true;

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        prefix = true;
      } else {
        prefix = false;
      }
      setState(() {});
    });
  }

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
                Form(
                  key: registerController,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextFormField(
                          focusNode: _focusNode,
                          controller: registerProvider.phoneController,
                          inputFormatters: [
                            MaskTextInputFormatter(
                              mask: ' 00 000 00 00',
                              filter: {'0': RegExp(r'[0-9]')},
                            )
                          ],
                          decoration: InputDecoration(
                              prefix: prefix
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
                                          style: TextStyle(color: Colors.black),
                                        )
                                      ],
                                    )
                                  : null,
                              border: const OutlineInputBorder(),
                              hintText: "Telephone number"),
                          validator: (value) {
                            if (value == null) {
                              return "Iltimos bo'sh qoldirmang";
                            } else if (value.length != 13) {
                              return "Raqamni to'liq kiriting";
                            } else if (registerProvider.error.isNotEmpty) {
                              /// fix has
                              return registerProvider.error.toString();
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextFormField(
                          controller: registerProvider.passwordController,
                          obscureText: passwordVisibile,
                          obscuringCharacter: "*",
                          decoration: InputDecoration(
                              suffixIcon: Visibility(
                                  child: IconButton(
                                      onPressed: () {
                                        passwordVisibile = !passwordVisibile;
                                        setState(() {});
                                      },
                                      icon: passwordVisibile
                                          ? const Icon(Icons.visibility_off)
                                          : const Icon(Icons.visibility))),
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
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ElevatedButton(
                      onPressed: () {
                        if (registerController.currentState!.validate()) {
                          registerProvider.registers(context).then(
                              (value) => registerProvider.clearTextFields());
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          backgroundColor: Colors.deepPurple),
                      child: Center(
                          child: registerProvider.isLoading
                              ? const CircularProgressIndicator.adaptive(
                                  backgroundColor: Colors.white)
                              : const Text(
                                  "Register",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
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
