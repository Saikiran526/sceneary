import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sceneary/core/constants/assets_path.dart';
import 'package:sceneary/presentation/profile_details/utils.dart';

class ProfileDetailsScreen extends StatelessWidget {
  const ProfileDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final height = MediaQuery.of(context).size.height;
    final width= MediaQuery.of(context).size.width;
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Back'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(21.0),
        child: Column(
          children: [
            viewProfiles(size: size),
            SizedBox(height: height*0.02,),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Color(0xff000000).withAlpha(10)
                )
              ),
              child: Padding(
                padding: const EdgeInsets.all(21.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bio',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    SizedBox(height: height*0.01,),
                    Text(
                      'Jorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit, sit amet feugiat lectus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent auctor purus luctus enim egestas, ac scelerisque ante pulvinar. ',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: height*0.02,),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Color(0xff000000).withAlpha(10)
                )
              ),
              child: Padding(
                padding: const EdgeInsets.all(21.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Portfolio',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    SizedBox(height: height*0.01,),
                    Row(
                      children: [
                        SvgPicture.asset(AssetsPath.instagramImg),
                        SizedBox(width: width*0.04,),
                        Text(
                            'Instagram',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: height*0.01,),
                    Row(
                      children: [
                        SvgPicture.asset(AssetsPath.youtubeImg),
                        SizedBox(width: width*0.04,),
                        Text(
                          'YouTube',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: height*0.01,),
                    Row(
                      children: [
                        SvgPicture.asset(AssetsPath.portfolioLinkImg),
                        SizedBox(width: width*0.04,),
                        Text(
                          'Portfolio link',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: height*0.02,),
            Container(
              width: width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                      color: Color(0xff000000).withAlpha(10)
                  )
              ),
              child: Padding(
                padding: const EdgeInsets.all(21.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Career Highlights',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    SizedBox(height: height*0.01,),
                    Text(
                      'Worked on RRR',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    SizedBox(height: height*0.01,),
                    Text(
                      'Worked on RRR',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    SizedBox(height: height*0.01,),
                    Text(
                      'Worked on RRR',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500
                      ),
                    ),
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
