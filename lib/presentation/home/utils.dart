

import 'package:flutter/material.dart';

Widget quickActions({required String action,required Size size}){
  return Container(
    height: size.height*0.17,
    width: size.width*0.4,
    decoration: BoxDecoration(
      color: Color(0xffD9D9D9),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Padding(
      padding: const EdgeInsets.all(21.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height : size.height*0.07,
            width : size.height*0.07,
            decoration: BoxDecoration(
              color: Color(0xff5D5D5D),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          Text(
            action,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600
            ),
          )
        ],
      ),
    ),
  );
}