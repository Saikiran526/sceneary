import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
 import 'package:sceneary/presentations/subscription/subscription_viewmodel.dart';
import 'package:sceneary/presentation/dashboard/dashboard_screen.dart';
import 'core/navigation/app_routes.dart';

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
      title: 'scenery',
      debugShowCheckedModeBanner: false,
      navigatorKey: AppRouter.instance.navKey,
      onGenerateRoute: AppRouter.instance.onGenerateRoute,
      home: const DashboardScreen(),
    );
  }
}
