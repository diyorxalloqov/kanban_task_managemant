import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:kanban_task_app/application/bloc/boards_bloc.dart';

import 'package:kanban_task_app/application/provider/login_provider.dart';
import 'package:kanban_task_app/application/provider/register_provider.dart';
import 'package:kanban_task_app/application/theme/app_theme.dart';

import 'package:kanban_task_app/domain/db/auth_db_service.dart';

import 'package:kanban_task_app/presenatation/ui/pages/login_page.dart';
import 'package:provider/provider.dart';

Future<void> main(List<String> args) async {
  await Hive.initFlutter();
  
  AuthDBService.registerAdapter();
  runApp(MultiBlocProvider(
       providers: [BlocProvider(create: (context)=>BoardsBloc())],
       child: MultiProvider(providers: [
          ChangeNotifierProvider(create: (context)=>LoginProvider()),
          ChangeNotifierProvider(create: (context) => RegisterProvider(),) 
      ] ,child: const  MyApp(),),
  ),

    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
        light: AppThemeData.lightTheme,
        dark: AppThemeData.darkTheme,
        initial: AdaptiveThemeMode.system,
        builder: (theme,dark)  =>ScreenUtilInit(
             designSize: kIsWeb?  const  Size(1440,1024): const Size(412,892),
             builder: (context, child) {
       
          return MaterialApp(
               theme: theme,
               themeMode: ThemeMode.system,  
             debugShowCheckedModeBanner: false,
             
               home: LoginPage(),
            );
      }),
    );
  }
}
