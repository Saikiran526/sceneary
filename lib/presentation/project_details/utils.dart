import 'package:flutter/material.dart';

PopupMenuItem<String> _buildMenuItem(String text) {
  return PopupMenuItem<String>(
    value: text,
    child: Text(
      text,
      style: TextStyle(
        color: Colors.white,          // text color
        fontSize: 14,
      ),
    ),
  );
}
void servicePopUpMenu(BuildContext context) {

  showMenu(
    context: context,
    color: Colors.black,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    position: RelativeRect.fromLTRB(200,130, 0,0,),
    items: [
      _buildMenuItem("Overview"),
      _buildMenuItem("Cast & Crew"),
      _buildMenuItem("Timeline / Task"),
      _buildMenuItem("Budget"),
      _buildMenuItem("Scenic Order"),
      _buildMenuItem("Call Sheets"),
      _buildMenuItem("Shooting Schedules"),
      _buildMenuItem("Group Chat"),
      _buildMenuItem("Project Settings"),
    ],
  ).then((value) {
    if (value != null) print(value);
  });
}
