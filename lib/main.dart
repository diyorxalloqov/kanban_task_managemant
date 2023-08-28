import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:kanban_task_managemant/application/provider/loginProvider.dart';
import 'package:kanban_task_managemant/application/provider/registerProvider.dart';
import 'package:kanban_task_managemant/domain/db/authDbService.dart';
import 'package:kanban_task_managemant/domain/theme/theme_data.dart';
import 'package:kanban_task_managemant/presentition/ui/pages/splashPage.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  AuthDBService.registerAdapter();
  // UpdateAccessToken().updateAccessToken();
  
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => RegisterProvider()),
      ChangeNotifierProvider(create: (context) => LoginProvider())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
        light: KanbanTheme.lightTheme,
        dark: KanbanTheme.darkTheme,
        initial: AdaptiveThemeMode.system,
        builder: (theme, dark) => ScreenUtilInit(
            designSize: kIsWeb ? const Size(1440, 1024) : const Size(412, 892),
            builder: (BuildContext context, child) {
              return MaterialApp(
                  theme: theme,
                  themeMode: ThemeMode.system,
                  debugShowCheckedModeBanner: false,
                  home: const SplashPage()
                  // HomePage(),
                  );
            }));
  }
}
