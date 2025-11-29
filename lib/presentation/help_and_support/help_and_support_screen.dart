import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sceneary/core/constants/assets_path.dart';
import 'package:sceneary/presentation/app_utils/app_widgets.dart';

class HelpAndSupportScreen extends StatelessWidget {
  const HelpAndSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: customAppBar(title: 'Help & Support'),
      body: Padding(
        padding: const EdgeInsets.all(21.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 1,
                  color: Color(0xffE0E0E0),
                ),
                borderRadius: BorderRadius.circular(8)
              ),
              child: Padding(
                padding: const EdgeInsets.all(21.0),
                child: Row(
                  children: [
                    SvgPicture.asset(AssetsPath.callImg),
                    SizedBox(width: width*0.05,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '9876543210',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        Text(
                          'Our 24/7 Customer Services',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff787878)
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: height*0.02,),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    width: 1,
                    color: Color(0xffE0E0E0),
                  ),
                  borderRadius: BorderRadius.circular(8)
              ),
              child: Padding(
                padding: const EdgeInsets.all(21.0),
                child: Row(
                  children: [
                    SvgPicture.asset(AssetsPath.mailImg),
                    SizedBox(width: width*0.05,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sceneary@gmail.com',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        Text(
                          'Our 24/7 Customer Services',
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff787878)
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
