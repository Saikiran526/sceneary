import 'package:flutter/material.dart';
import 'package:sceneary/presentation/app_utils/app_widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: const Center(child: Text('Profile screen...!'),),
    );
  }
}
