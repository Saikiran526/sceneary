import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/presentations/login_welocme_back/welcome_back_screen%20.dart';
 import 'package:sceneary/presentations/subscription/subscription_viewmodel.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SubscriptionViewmodel()),
      ],
      child: const MyApp(),   
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const WelcomeBackScreen(), 
    );
  }
}
