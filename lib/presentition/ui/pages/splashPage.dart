// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:kanban_task_managemant/domain/source/db/auth/token/tokenDBservice.dart';
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
        .then((value) => checkAccesToken(context));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SvgPicture.asset(
        "assets/group.svg",
        width: 50,
        fit: BoxFit.fill,
      )),
    );
  }

  void checkAccesToken(BuildContext context) async {
    TokenDBService tokenDBService = TokenDBService();
    await tokenDBService.openBox();

    var tokenMap = tokenDBService.token?.get("token");

    if (tokenMap != null) {
      String? refreshToken = tokenMap["refreshToken"]?.toString();
      bool isExpired = JwtDecoder.isExpired(refreshToken ?? "");

      if (isExpired || refreshToken == null || refreshToken.isEmpty) {
        // If refresh token is expired or empty, navigate to the login page
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
            (route) => false);
      } else {
        // Refresh token is valid, navigate to the home page
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
            (route) => false);
      }
    } else {
      // Handle the case when the tokenMap is null
      // You might want to navigate to the login page or handle it differently
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
          (route) => false);
    }
  }
}
