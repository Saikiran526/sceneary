import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/core/constants/app_colors.dart';
import 'package:sceneary/core/constants/assets_path.dart';
import 'package:sceneary/presentation/profile_details/profile_details_viewmodel.dart';
import 'package:sceneary/presentation/profile_details/utils.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProfileDetailsScreen extends StatelessWidget {
  const ProfileDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
          flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF090216), // Dark purple
                Color(0xFF9D306A), // Pinkish gradient
              ],
              begin: Alignment.centerLeft ,
              end: Alignment.centerRight,
            ),
          ),
        ),
          iconTheme: IconThemeData(color: onPrimary),
          title: Text(
              'Back',
            style: TextStyle(
              color: onPrimary
            ),
          ),
      ),
      body: ChangeNotifierProvider(
          create: (_)=>ProfileDetailsViewmodel(),
        child: Consumer<ProfileDetailsViewmodel>(
            builder: (context,viewModel,child){
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(21.0),
                  child: Column(
                    children: [
                      // Profile details
                      viewProfiles(size: size),
                      SizedBox(height: height * 0.02),

                      // Bio desc
                      Container(
                        decoration: BoxDecoration(
                            color: primaryColor100,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: primaryColor200,)
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
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: height * 0.01),
                              Text(
                                'Jorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit, sit amet feugiat lectus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent auctor purus luctus enim egestas, ac scelerisque ante pulvinar. ',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.02),

                      //Portfolio
                      Container(
                        decoration: BoxDecoration(
                          color: primaryColor100,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: primaryColor200),
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
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: height * 0.01),
                              Row(
                                children: [
                                  SvgPicture.asset(AssetsPath.instagramImg),
                                  SizedBox(width: width * 0.04),
                                  Text(
                                    'Instagram',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: height * 0.01),
                              Row(
                                children: [
                                  SvgPicture.asset(AssetsPath.youtubeImg),
                                  SizedBox(width: width * 0.04),
                                  Text(
                                    'YouTube',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: height * 0.01),
                              Row(
                                children: [
                                  SvgPicture.asset(AssetsPath.portfolioLinkImg),
                                  SizedBox(width: width * 0.04),
                                  Text(
                                    'Portfolio link',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.02),

                      // Career Highlights
                      Container(
                        width: width,
                        decoration: BoxDecoration(
                          color: primaryColor100,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: primaryColor200),
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
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: height * 0.01),
                              CarouselSlider(
                                options: CarouselOptions(
                                  autoPlay: true,
                                  enlargeCenterPage: true,
                                  viewportFraction: 1,
                                  aspectRatio: 16 / 10,
                                  autoPlayInterval: const Duration(seconds: 3),
                                  onPageChanged: (index, reason) {
                                    viewModel.updateIndex=index;
                                  },
                                ),
                                items: [1,2,3].map((item) {
                                  return
                                    Container(
                                      width: width,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade300,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    );
                                }).toList(),
                              ),
                              SizedBox(height:height*0.02 ),
                              Center(
                                child: AnimatedSmoothIndicator(
                                  activeIndex: viewModel.activeIndex,
                                  count: [1,2,3].length,
                                  effect: const WormEffect(
                                    dotHeight: 8,
                                    dotWidth: 8,
                                    activeDotColor: Color(0xff2B2B2B),
                                    dotColor: Colors.grey,
                                    spacing: 6,
                                  ),
                                ),
                              ),
                              SizedBox(height:height*0.02 ),
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
        ),
      ),
    );
  }
}
