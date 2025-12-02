import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sceneary/core/constants/assets_path.dart';

class ShootingScheduleScreen extends StatelessWidget {
  const ShootingScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final height= MediaQuery.of(context).size.height;
    final width= MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Shooting schedule'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(21.0),
          child: Column(
            children: [
              Text(
                'Manage and organize your shooting scenes',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff787878)
                ),
              ),
              SizedBox(height: height*0.02,),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      onPressed: (){
                        // AppRouter.instance.push(RoutePaths.scenicOrderTemplateListScreen);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(AssetsPath.addImg),
                          Text(
                            'Add Entry',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: width*0.03,),
                  Expanded(
                    flex: 3,
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: BorderSide(
                                  color: Colors.black,
                                  width: 1
                              )
                          ),
                        ),
                        onPressed: (){},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(AssetsPath.downloadImg),
                            SizedBox(width: width*0.01,),
                            Text(
                              'Download Template',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black
                              ),
                            )
                          ],
                        )
                    ),
                  ),

                ],
              ),
              SizedBox(height: height*0.01,),
              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(
                            color: Colors.black,
                            width: 1
                        )
                    ),
                  ),
                  onPressed: (){},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(AssetsPath.upload),
                      SizedBox(width: width*0.01,),
                      Text(
                        'Upload scenic order',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black
                        ),
                      )
                    ],
                  )
              ),
              SizedBox(height: height*0.05,),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                        color: Colors.grey.shade300,
                        width: 1
                    )
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0,vertical: 40),
                    child: Text(
                      'No scenic order entries yet. Add your first entry or upload an Excel file.',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff787878)
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
