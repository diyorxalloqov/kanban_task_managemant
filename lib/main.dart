import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanban_task_app/presenatation/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (context, child) {
      return MaterialApp(
              theme: ThemeData(
                
                useMaterial3: true
              ),
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            home: HomePage(),
        );
     });
  }
}
