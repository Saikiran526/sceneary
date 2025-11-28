import 'package:flutter/material.dart';
import 'package:sceneary/presentation/login_welocme_back/welcome_back_screen%20.dart';
import 'core/navigation/app_routes.dart';

void main() {
  runApp(MyApp());
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
