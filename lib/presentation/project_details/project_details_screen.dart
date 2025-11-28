import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sceneary/core/constants/assets_path.dart';
import 'package:sceneary/presentation/project_details/utils.dart';

class ProjectDetailsScreen extends StatelessWidget {
  const ProjectDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    // final size = MediaQuery.of(context).size;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final GlobalKey recentUpdatesKey = GlobalKey();

    return Scaffold(
      body: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft:Radius.circular(16) ,
              bottomRight: Radius.circular(16),
            ),
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xffD1D1D1)
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(21.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: (){
                          servicePopUpMenu(context);
                        },
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: SvgPicture.asset(AssetsPath.menuImg),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            height: height*0.18,
                            width: width*0.25,
                            decoration: BoxDecoration(
                              color: Color(0xff9F9B9B),
                              borderRadius: BorderRadius.circular(8),

                            ),
                          ),
                          SizedBox(width: width*0.04,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Animal',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,

                                ),
                              ),
                              SizedBox(height: height*0.02,),
                              RichText(
                                text: TextSpan(
                                    text:'Director: ',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff4F4F4F)
                                    ),
                                    children: [
                                      TextSpan(
                                        text:"Sandeep Reddy",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ]
                                ),
                              ),
                              SizedBox(height: height*0.01,),
                              RichText(
                                text: TextSpan(
                                    text:'Producer: ',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff4F4F4F)
                                    ),
                                    children: [
                                      TextSpan(
                                        text:"Ajay Kumar",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ]
                                ),
                              ),
                              SizedBox(height: height*0.01,),
                              RichText(
                                text: TextSpan(
                                    text:'Type: ',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff4F4F4F)
                                    ),
                                    children: [
                                      TextSpan(
                                        text:"Future Film",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ]
                                ),
                              ),

                            ],
                          )
                        ],
                      ),
                      SizedBox(height: height*0.02,),
                      Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Progress',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,

                                      ),
                                    ),
                                    Text(
                                      '40%',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,

                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: height*0.01,),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: LinearProgressIndicator(
                                    value: 0.45,
                                    color: Colors.black,
                                    backgroundColor: Colors.grey,
                                    minHeight: 8,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: width*0.04,),
                          Expanded(
                            flex: 1,
                            child: RichText(
                              text: TextSpan(
                                  text:'23/',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black
                                  ),
                                  children: [
                                    TextSpan(
                                      text:"60",
                                      style: TextStyle(
                                        fontSize: 8,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    TextSpan(
                                      text:"Days",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  ]
                              ),
                            ),
                          )
                        ],
                      ),


                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: SizedBox(
                child: Padding(
                  padding: const EdgeInsets.all(21.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Budget Overview',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: height*0.01,),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(21.0),
                          child: Row(
                            children: [
                              SizedBox(
                                height: 127,
                                width: 127,
                                child: PieChart(
                                  PieChartData(
                                    centerSpaceRadius: 40,
                                    sectionsSpace: 2,
                                    sections: [
                                      PieChartSectionData(
                                        value: 66,
                                        color: Color(0xff5D5D5D),
                                        title: '',//'66%',
                                        radius: 25,
                                        titleStyle: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      PieChartSectionData(
                                        value: 34,
                                        color: Color(0xffD9D9D9),
                                        title: '',//"34%",
                                        radius: 25,
                                        titleStyle: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: width*0.08,),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Total Budget',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xffB0B0B0)
                                      ),
                                    ),
                                    SizedBox(height: height*0.005,),
                                    Text(
                                      '₹ 10,00,00,000',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff252525)
                                      ),
                                    ),
                                    SizedBox(height: height*0.01,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Spent',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xffB0B0B0)
                                              ),
                                            ),
                                            SizedBox(height: height*0.005,),
                                            Text(
                                              '₹ 3,50,00,000',
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xff252525)
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Remaining',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xffB0B0B0)
                                              ),
                                            ),
                                            SizedBox(height: height*0.005,),
                                            Text(
                                              '₹ 6,50,00,000',
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xff252525)
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: height*0.02,),
                      Text(
                        'Project overview',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: height*0.01,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            flex:1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Type:',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xffB0B0B0)
                                  ),
                                ),
                                SizedBox(height: height*0.001,),
                                Text(
                                  'Feature Film',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff252525)
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex:1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Status:',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xffB0B0B0)
                                  ),
                                ),
                                SizedBox(height: height*0.001,),
                                Text(
                                  'Pre-production',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff252525)
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height*0.01,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Timeline:',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xffB0B0B0)
                            ),
                          ),
                          SizedBox(height: height*0.001,),
                          Text(
                            'Apr 12, 2025 – Aug 30, 2026',
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff252525)
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height*0.02,),
                      Text(
                        'Synopsis: ',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff454545)
                        ),
                      ),
                      SizedBox(height: height*0.01,),
                      Text(
                        'A story about a small-town boy who rises to fame the Kabaddi championships while battling personal  personal  personal struggles.Kabaddi championships while battling personal struggles.Kabaddi championships while battling personal struggles.Kabaddi championships while battling personal struggles.',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff454545)
                        ),
                      ),
                      SizedBox(height: height*0.02,),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(21.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Next Shoot',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff5D5D5D)
                                    ),
                                  ),
                                  SvgPicture.asset(AssetsPath.calenderOnrImg)
                                ],
                              ),
                              SizedBox(height: height*0.02,),
                              Container(
                                width: width,
                                decoration: BoxDecoration(
                                  color: Color(0xffDADADA),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(21.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        'Tomorrow, 6:00 AM',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xff3D3D3D)

                                        ),
                                      ),
                                      SizedBox(height: height*0.01,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              SvgPicture.asset(AssetsPath.scenesImg),
                                              SizedBox(width: width*0.02,),
                                              Text(
                                                '7 scenes',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,

                                                ),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              SvgPicture.asset(AssetsPath.locationPinImg),
                                              SizedBox(width: width*0.02,),
                                              Text(
                                                'Location: Studio A',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,

                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: height*0.02,),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ExpansionTile(
                          key: recentUpdatesKey,
                          shape: Border(),
                          collapsedShape: Border(),
                          title: Text(
                            'Recent Updates',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,

                            ),
                          ),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(21.0),
                              child: SizedBox(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset(AssetsPath.clockImg),
                                    SizedBox(width: width*0.02,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Scene 24 marked as completed',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,

                                          ),
                                        ),
                                        SizedBox(height: height*0.01,),
                                        Text(
                                          '3hr ago',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,

                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              color: Colors.grey.shade300,
                              height: 1,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(21.0),
                              child: SizedBox(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset(AssetsPath.clockImg),
                                    SizedBox(width: width*0.02,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Scene 24 marked as completed',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,

                                          ),
                                        ),
                                        SizedBox(height: height*0.01,),
                                        Text(
                                          '3hr ago',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,

                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              color: Colors.grey.shade300,
                              height: 1,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(21.0),
                              child: SizedBox(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset(AssetsPath.clockImg),
                                    SizedBox(width: width*0.02,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Scene 24 marked as completed',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,

                                          ),
                                        ),
                                        SizedBox(height: height*0.01,),
                                        Text(
                                          '3hr ago',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,

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

                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
