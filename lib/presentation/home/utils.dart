

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sceneary/core/constants/app_colors.dart';
import 'package:sceneary/core/constants/assets_path.dart';

Widget quickActions({
  required String action,
  required Size size,
  required String type}){
  return Container(
    height: size.height*0.17,
    width: size.width*0.4,
    decoration: BoxDecoration(
      color: primaryColor200,
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
              color: primaryColor700,
              borderRadius: BorderRadius.circular(4),
            ),
            child: switch(type){
              "add"=>Icon(Icons.add,color: onPrimary,size: 30,),
              "calendar" => SizedBox(
                height: 20,
                width: 20,
                child: SvgPicture.asset(
                  AssetsPath.calenderFilled20Img,
                  // fit: BoxFit.contain,
                ),
              ),
                  // Icon(Icons.calendar_view_day,color: onPrimary,size: 30,),

              "search"=>Icon(Icons.search,color: onPrimary,size: 30,),
              "profile"=>Icon(Icons.person,color: onPrimary,size: 30,),
              _=>null
            },
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