import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sceneary/core/constants/app_colors.dart';
import 'package:sceneary/core/constants/assets_path.dart';

Widget viewProfiles({required Size size}){
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
                  color: Color(0xffD9D9D9),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.asset(AssetsPath.photographerProfilePngImg,fit: BoxFit.cover,),
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
                            Container(
                              decoration: BoxDecoration(
                                color: primaryColor100,
                                borderRadius: BorderRadius.circular(8)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text('Expert'),
                              ),
                            ),
                            SizedBox(width: size.width*0.01,),
                            Text(
                              '6+ years',
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: size.height*0.02,),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: primaryButtonColor
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)
                        )
                    ),
                    onPressed: (){},
                    child: Text(
                      'Send Message',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        color: primaryButtonColor
                      ),
                    ),
                ),
              ),
              SizedBox(width: size.width*0.05,),
              Expanded(
                flex: 1,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: primaryButtonColor,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)
                        )
                    ),
                    onPressed: (){},
                    child: Text(
                      'Add to Project',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}