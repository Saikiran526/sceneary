import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sceneary/core/constants/app_colors.dart';
import 'package:sceneary/core/constants/assets_path.dart';
import 'package:sceneary/core/navigation/app_routes.dart';
import 'package:sceneary/core/navigation/routes_path.dart';

Widget searchProfiles({required Size size}){
  return Container(
    width: size.width,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 21.0,horizontal: 8),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: size.height*0.15,
                width: size.width*0.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.asset(AssetsPath.photographerProfilePngImg)
                // SvgPicture.asset(AssetsPath.photographerProfileSvgImg),
              ),
              SizedBox(width: size.width*0.03,),
              SizedBox(
                height: size.height*0.15,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Rahul Sharma',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Photographer – Stills / Behind the Scenes',
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff454545)
                      ),
                    ),
                    Wrap(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(AssetsPath.locationPinImg),
                            SizedBox(width: size.width*0.01,),
                            Text(
                              'Hyderabad, India',
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500
                              ),
                            )
                          ],
                        ),
                        SizedBox(width: size.width*0.02,),
                        Row(
                          children: [
                            SvgPicture.asset(AssetsPath.bagExperienceImg),
                            SizedBox(width: size.width*0.01,),
                            Text(
                              '6+ years | Expert',
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    Text(
                      'Worked on 12 feature films & 8 web series.',
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff454545)
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: size.height*0.02,),
          SizedBox(
            width: size.width,
            child: OutlinedButton(
                onPressed: (){
                  AppRouter.instance.push(RoutePaths.profileDetailsScreen);
                },
                style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: primaryButtonColor
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                    )
                ),
                child: Text(
                  'View Profile',
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    color: primaryButtonColor
                  ),
                )
            ),
          )
        ],
      ),
    ),
  );
}