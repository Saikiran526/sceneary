import 'package:flutter/material.dart';
import 'package:sceneary/core/navigation/app_routes.dart';
import 'package:sceneary/core/navigation/routes_path.dart';

PopupMenuItem<String> _buildMenuItem(String text) {
  return PopupMenuItem<String>(
    value: text,
    child: Text(text, style: TextStyle(color: Colors.white, fontSize: 14)),
  );
}

void servicePopUpMenu(BuildContext context) {
  showMenu(
    context: context,
    color: Colors.black,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    position: RelativeRect.fromLTRB(200, 130, 0, 0),
    items: [
      _buildMenuItem("Overview"),
      _buildMenuItem("Cast & Crew"),
      _buildMenuItem("Project Plan"),
      _buildMenuItem("Budget"),
      _buildMenuItem("Scenic Order"),
      _buildMenuItem("Call Sheets"),
      _buildMenuItem("Shooting Schedules"),
      _buildMenuItem("Group Chat"),
      _buildMenuItem("Project Settings"),
    ],
  ).then((value) {
    if (value == null) return;

    switch (value) {
      case "Overview":
        break;
      case "Cast & Crew":
        AppRouter.instance.push(RoutePaths.castAndCrewScreen);
        break;
      case "Timeline / Task":
        break;
      case "Budget":
        AppRouter.instance.push(RoutePaths.budgetScreen);
        break;
      case "Scenic Order":
        AppRouter.instance.push(RoutePaths.scenicOrderScreen);
        break;
      case "Call Sheets":
        AppRouter.instance.push(RoutePaths.callSheetScreen);
        break;
      case "Shooting Schedules":
        AppRouter.instance.push(RoutePaths.shootingScheduleScreen);
        break;
      case "Group Chat":
        AppRouter.instance.push(RoutePaths.chatScreen);
        break;
      case "Project Settings":
        AppRouter.instance.push(RoutePaths.projectSettingsScreen);
        break;

      case "Project Plan":
        AppRouter.instance.push(RoutePaths.projectPlanScreen);
    }
  });
}

// PopupMenuItem<String> _buildMenuItem(String text) {
//   return PopupMenuItem<String>(
//     value: text,
//     child: Text(
//       text,
//       style: TextStyle(
//         color: Colors.white,
//         fontSize: 14,
//       ),
//     ),
//   );
// }
