import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kiddie/common/services/cart_service.dart';
import 'package:kiddie/common/utils/app_routes.dart';
import 'package:kiddie/common/utils/environment.dart';
import 'package:kiddie/common/utils/kstrings.dart';
import 'package:kiddie/controllers/bottomtabbarnotifier.dart';
import 'package:kiddie/controllers/onboarding_notifier.dart';
import 'package:kiddie/src/entrypoint/views/entrypoint.dart';
import 'package:kiddie/src/splashscreen/view/spalshscreen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //load the correct environment
  await dotenv.load(
    fileName: Environment.fileName,
  );
  await GetStorage.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => OnboardingNotifier(),
        ),
        ChangeNotifierProvider(
          create: (_) => TabIndexNotifier(),
        ),
      ],
       child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return ScreenUtilInit(
      designSize: screenSize,
      minTextAdapt: true,
      splitScreenMode: false,
      useInheritedMediaQuery: true,
      builder: (_, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: AppText.kAppName,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          routerConfig: router,
          color: Colors.amber,
        );
      },
      child: Entrypoint(),
    );
  }
}
