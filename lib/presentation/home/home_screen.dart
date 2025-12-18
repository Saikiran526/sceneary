import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/presentation/home/utils.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'home_viewmodel.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final height = MediaQuery.of(context).size.height;
    final width= MediaQuery.of(context).size.width;

    return ChangeNotifierProvider(
          create: (_)=>HomeViewmodel(),
          child: Consumer<HomeViewmodel>(
              builder: (context,viewModel,child){
                return SafeArea(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(21),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: height*0.1,
                            width: width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                color: Colors.white
                            ),
                            child: Row(
                              children: [
                                ...viewModel.remainingDatesOfCurrentMonth.map((date){
                                  return Expanded(
                                    flex: 1,
                                    child: GestureDetector(
                                      onTap: () {
                                        viewModel.setSelectedDate = date;
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 8.0,bottom: 8.0,),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: viewModel.selectedDate == date ? Colors.black : Colors.white,
                                          ),
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  '$date',
                                                  style: TextStyle(
                                                      color: viewModel.selectedDate == date ? Colors.white : Colors.black
                                                  ),
                                                ),
                                                if (viewModel.selectedDate == date)
                                                  SizedBox(width: 15),
                                                if (viewModel.selectedDate == date)
                                                  Text(
                                                    'Today',
                                                    style: TextStyle(
                                                        color: viewModel.selectedDate == date ? Colors.white : Colors.black
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                                IconButton(
                                    onPressed: (){},
                                    icon: Icon(Icons.arrow_forward_ios)
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: height*0.01,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Today Schedule'),
                              TextButton(
                                  style: TextButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(5)
                                      )
                                  ),
                                  onPressed: (){},
                                  child: Text(
                                    '+ Add',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black
                                    ),
                                  )
                              )
                            ],
                          ),
                          SizedBox(height: height*0.01,),
                          // To see schedules
                          if(viewModel.selectedDate!=22)...[
                            CarouselSlider(
                              options: CarouselOptions(
                                autoPlay: true,
                                enlargeCenterPage: true,
                                viewportFraction: 1,
                                aspectRatio: 16 / 7,
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
                                    child: Padding(
                                      padding: const EdgeInsets.all(21.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Scene 12B Shoot',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,

                                            ),
                                          ),
                                          SizedBox(height: height*0.01,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(Icons.timer_outlined,color: Colors.grey.shade600,),
                                                  SizedBox(width: width*0.01,),
                                                  Text('7:00 AM - 10:00 AM',style: TextStyle(color: Colors.grey.shade600),)
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Icon(Icons.location_on_outlined,color: Colors.grey.shade600,),
                                                  SizedBox(width: width*0.01,),
                                                  Text('Ramoji film city - Set',style: TextStyle(color: Colors.grey.shade600),)
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: height*0.01,),
                                          Text(
                                            'Notes:',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xff454545)
                                            ),
                                          ),
                                          SizedBox(height: height*0.005,),
                                          Text(
                                            'Carry white costume',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xff454545)
                                            ),                                  ),
                                        ],
                                      ),
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
                          ],
                          // If no schedules yet
                          if(viewModel.selectedDate==22)
                            Container(
                              height: height*0.1,
                              width: width,
                                decoration: BoxDecoration(
                                  color: Color(0xffC3C3C3),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              child: Center(
                                child: Text(
                                    'No Schedules Today',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          SizedBox(height: height*0.02,),
                          Text(
                              'Recent Updates',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: height*0.01,),
                          ...[1,2].map((element){
                            return Container(
                              width: width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(16)),
                              ),
                              child: Column(
                                children: [
                                  Card(
                                    elevation: 10,
                                    child: Padding(
                                      padding: const EdgeInsets.all(21.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Project Invitation',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          SizedBox(height: height*0.02,),
                                          Row(
                                            children: [
                                              CircleAvatar(
                                                backgroundColor: Colors.grey.shade400,
                                                radius: 30,
                                              ),
                                              SizedBox(width: width*0.01,),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Kabaddi Warriors',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.w600
                                                    ),
                                                  ),
                                                  SizedBox(height: height*0.01,),
                                                  Text(
                                                    'Requested By: Sandeep Reddy (Director)  ',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.w400,
                                                        color: Color(0xff6D6D6D)
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: height*0.02,),
                                          Text(
                                            'You’ve been invited to join this project as Cast.',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xff3D3D3D)
                                            ),
                                          ),
                                          SizedBox(height: height*0.01,),
                                          Row(
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: OutlinedButton(
                                                    style: OutlinedButton.styleFrom(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(8)
                                                        )
                                                    ),
                                                    onPressed: (){},
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Text(
                                                          'Reject',
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight: FontWeight.w500
                                                          ),
                                                        ),
                                                        SizedBox(width: width*0.01,),
                                                        Icon(Icons.close)
                                                      ],
                                                    )
                                                ),
                                              ),
                                              SizedBox(width: width*0.05,),
                                              Expanded(
                                                flex: 1,
                                                child: ElevatedButton(
                                                    style: ElevatedButton.styleFrom(
                                                        backgroundColor: Colors.black,
                                                        foregroundColor: Colors.white,
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(8)
                                                        )
                                                    ),
                                                    onPressed: (){},
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Text(
                                                          'Accept',
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight: FontWeight.w500
                                                          ),
                                                        ),
                                                        SizedBox(width: width*0.01,),
                                                        Icon(Icons.check)
                                                      ],
                                                    )
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: height*0.02,),
                                ],
                              ),
                            );
                          }).toList(),
                          SizedBox(height: height*0.01,),
                          Text(
                            'Quick Actions',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,

                            ),
                          ),
                          SizedBox(height: height*0.02,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              quickActions(action: "Create Project", size: size),
                              quickActions(action: "My Calendar", size: size),
                            ],
                          ),
                          SizedBox(height: height*0.02,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              quickActions(action: "Explore People", size: size),
                              quickActions(action: "My Profile", size: size),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }
          ),
        );

  }
}
