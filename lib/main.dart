import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:kanban_task_managemant/application/provider/loginProvider.dart';
import 'package:kanban_task_managemant/application/provider/registerProvider.dart';
import 'package:kanban_task_managemant/domain/core/theme/theme_data.dart';
import 'package:kanban_task_managemant/presentition/ui/pages/splashPage.dart';
import 'package:provider/provider.dart';
import 'application/bloc/BoardBloc/boards_bloc.dart';
import 'domain/db/auth/authDbService.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await SystemChrome.setPreferredOrientations(DeviceOrientation.),
  // Platform.isAndroid ? DeviceOrientation.landscapeLeft : DeviceOrientation.landscapeRight;
  await dotenv.load(fileName: '.env');
  await Hive.initFlutter();
  AuthDBService.registerAdapter();
  runApp(MultiBlocProvider(
      providers: [BlocProvider(create: (context) => BoardsBloc())],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => RegisterProvider()),
          ChangeNotifierProvider(create: (context) => LoginProvider())
        ],
        child: const MyApp(),
      )));
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
                  home: Builder(builder: (context) => const SplashPage())
                  // HomePage(),
                  );
            }));
  }
}
