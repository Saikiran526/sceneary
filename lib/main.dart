import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/presentations/subscription/subscription_screen.dart';
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
      home: const SubscriptionScreen(), 
    );
  }
}
