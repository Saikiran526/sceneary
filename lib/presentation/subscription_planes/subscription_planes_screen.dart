import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sceneary/presentation/app_utils/app_widgets.dart';

class SubscriptionPlanesScreen extends StatelessWidget {
  const SubscriptionPlanesScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: customAppBar(title: 'Subscription'),
      body: Padding(
        padding: const EdgeInsets.all(21.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'No Active Plans',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600
                  ),
                ),
                ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff3D3D3D),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      )
                    ),
                    child: Text('Invoice')
                )
              ],
            ),
            SizedBox(height: height*0.02,),
            Text(
              'Our packages',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600
              ),
            ),
            SizedBox(height: height*0.02,),
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: false,
                // height: height*0.5,
                enlargeCenterPage: true,
                viewportFraction: 0.8,
                aspectRatio: 16 / 20,
                autoPlayInterval: const Duration(seconds: 3),
                onPageChanged: (index, reason) {
                  // viewModel.updateIndex=index;
                },
              ),
              items: [1,2,3].map((item) {
                return Container(
                  width: width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          width: 2,
                          color: Colors.black
                      ),
                      borderRadius: BorderRadius.circular(7)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 21.0, vertical: 50),
                    child: Column(
                      children: [
                        Text(
                          'Care Lite',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: height * 0.01,),
                        RichText(
                            text: TextSpan(
                                text: '₹45,000  ',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black
                                ),
                                children: [
                                  TextSpan(
                                      text: '₹75,000 ',
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                          decoration: TextDecoration
                                              .lineThrough,
                                          color: Colors.black
                                      )
                                  )
                                ]
                            )
                        ),
                        SizedBox(height: height * 0.01,),
                        Text(
                          'per month',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff4F4F4F)
                          ),
                        ),
                        SizedBox(height: height * 0.01,),
                        Container(
                          width: width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                  color: Color(0xff6D6D6D),
                                  width: 1
                              )
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '4 Edits',
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: height * 0.02,),
                        Text(
                          'Dummy textDummy textDummy textDummy textDummy textDummy textDummy textDummy textDummy textDummy textDummy textDummy textDummy textDummy textDummy textDummy textDummy textDummy textDummy textDummy textDummy textDummy textDummy textDummy ',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400
                          ),
                        ),
                        SizedBox(height: height * 0.02,),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            children: [
                              Text(
                                'Key features',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                              SizedBox(height: height * 0.005,),
                              Text(
                                'Dummy text',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400
                                )
                              ),
                              SizedBox(height: height * 0.005,),
                              Text(
                                  'Dummy text',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400
                                  )
                              ),
                              SizedBox(height: height * 0.005,),
                              Text(
                                  'Dummy text',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400
                                  )
                              ),

                            ],
                          ),
                        )


                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: height*0.03,),
            primaryButton(text: 'Continue', onPressed: (){})
            
          ],
        ),
      ),
    );
  }
}
