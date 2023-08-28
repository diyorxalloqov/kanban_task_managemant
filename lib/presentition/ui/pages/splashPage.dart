import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kanban_task_managemant/domain/db/tokenDBservice.dart';
import 'package:kanban_task_managemant/presentition/ui/auth/loginPage.dart';

import 'homePage.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3))
        .then((value) => Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
          (route) => false)); // checkAccesToken(context)) this is a fix has
     super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Welcome"),
      ),
    );
  }

  void checkAccesToken(BuildContext context) async {
    TokenDBService tokenDBService = TokenDBService();
    await tokenDBService.openBox();

    String refreshToken =
        tokenDBService.token!.get("token")["refreshToken"].toString();
    if (refreshToken != null && refreshToken.isNotEmpty) {
      // if refresh token is expired    agar refreshtoken eskirgan bolsa degan shartga tekshirish kerak

      //Home
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
          (route) => false);
    } else {
      //login
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
          (route) => false);
    }
  }
}
