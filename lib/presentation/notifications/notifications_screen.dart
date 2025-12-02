import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/presentation/notifications/notifications_viewmodel.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NotificationsViewmodel(context: context),
      child: Consumer<NotificationsViewmodel>(
        builder: (context, viewModel, child) {
          return DefaultTabController(
            length: 4,
            child: Scaffold(
              appBar: AppBar(
                title: const Text(
                  'Notifications',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(50),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    height: 50,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TabBar(
                        indicator: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.black,
                        tabs: [
                          SizedBox(
                            width: 60,
                            height: 40,
                            child: Center(child: Text("All")),
                          ),
                          SizedBox(
                            width: 60,
                            height: 40,
                            child: Center(child: Text("Project")),
                          ),
                          SizedBox(
                            width: 60,
                            height: 40,
                            child: Center(child: Text("Chat")),
                          ),
                          SizedBox(
                            width: 60,
                            height: 40,
                            child: Center(child: Text("System")),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              body: const TabBarView(
                children: [
                  Center(child: Text("All Notifications")),
                  Center(child: Text("Project Notifications")),
                  Center(child: Text("Chat Notifications")),
                  Center(child: Text("System Notifications")),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
