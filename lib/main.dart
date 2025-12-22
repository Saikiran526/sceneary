import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sceneary/presentation/login_welocme_back/welcome_back_screen%20.dart';
 import 'core/navigation/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light, // ANDROID → WHITE
      statusBarBrightness: Brightness.dark, // IOS
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'scenery',
      debugShowCheckedModeBanner: false,
      navigatorKey: AppRouter.instance.navKey,
      onGenerateRoute: AppRouter.instance.onGenerateRoute,
      home: const WelcomeBackScreen(),
    );
  }
}
