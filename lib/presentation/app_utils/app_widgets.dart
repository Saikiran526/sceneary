

import 'package:flutter/material.dart';

AppBar customAppBar(){
  return AppBar(
    title: Text(
      'Profile',
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600
      ),
    ),
    backgroundColor: Color(0xffD9D9D9),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(25),
      ),
    ),
  );
}