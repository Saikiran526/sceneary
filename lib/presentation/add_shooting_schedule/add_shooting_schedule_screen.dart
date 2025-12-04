import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/presentation/add_shooting_schedule/add_shooting_schedule_step_two.dart';
import 'package:sceneary/presentation/add_shooting_schedule/add_shooting_schedule_viewmodel.dart';

import 'add_shooting_schedule_step_one.dart';

class AddShootingScheduleScreen extends StatelessWidget {
  const AddShootingScheduleScreen({super.key});

  Widget _buildStepCircle(int index, viewModel) {
    bool isActive = viewModel.currentPage == index;
    return CircleAvatar(
      radius: 24,
      backgroundColor: isActive ? Colors.black : Color(0xFF868686),
      child: Text(
        "${index + 1}",
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 20,
        ),
      ),
    );
  }
  Widget _buildLine() {
    return Container(
      height: 2,
      color: Colors.grey.shade400,
      margin: const EdgeInsets.symmetric(horizontal: 10),
    );
  }


  @override
  Widget build(BuildContext context) {

    final size= MediaQuery.of(context).size;
    final height= MediaQuery.of(context).size.height;
    final width= MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Add shooting schedule'),
      ),
      body: ChangeNotifierProvider(
          create: (_)=>AddShootingScheduleViewmodel(),
        child: Consumer<AddShootingScheduleViewmodel>(
            builder: (context,viewModel,child){
              return Padding(
                padding: const EdgeInsets.all(21.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            _buildStepCircle(0, viewModel),
                            SizedBox(height: height*0.01,),
                            Text('Basic details')
                          ],
                        ),
                        SizedBox(
                          width: width*0.2,
                            child: _buildLine()
                        ),
                        Column(
                          children: [
                            _buildStepCircle(1, viewModel),
                            SizedBox(height: height*0.01,),
                            Text('Check Availability')
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    Expanded(
                      child: PageView(
                        controller: viewModel.pageController,
                        onPageChanged: (page) {
                          viewModel.changePage=page;
                        },
                        children: const [
                          AddShootingScheduleStepOne(),
                          AddShootingScheduleStepTwo(),
                        ],
                      ),
                    ),

                  ],
                ),
              );
            }
        )
      ),
    );
  }
}
