import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sceneary/core/constants/assets_path.dart';
import 'package:sceneary/core/navigation/app_routes.dart';
import 'package:sceneary/presentation/add_shooting_schedule/viewmodel/add_shooting_schedule_viewmodel.dart';
import 'package:sceneary/presentation/app_utils/app_widgets.dart';

class AddShootingScheduleStepOne extends StatelessWidget {
  final AddShootingScheduleViewmodel viewModel;
  const AddShootingScheduleStepOne({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {

    final size= MediaQuery.of(context).size;
    final height= MediaQuery.of(context).size.height;
    final width= MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        children: [
          customTextFieldWithHeading(
              size: size,
              heading: 'Sl.No *',
              hintText: 'Enter Sl.No',
              controller: TextEditingController(),
              readOnly: false
          ),
          SizedBox(height: height*0.01,),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: customTextFieldWithHeading(
                    size: size,
                    heading: 'From Date *',
                    hintText: 'dd-mm-yyyy',
                    controller: TextEditingController(),
                    readOnly: false,
                    suffixIcon: Icon(Icons.calendar_month_outlined)
                ),
              ),
              SizedBox(width: width*0.02,),
              Expanded(
                flex: 1,
                child: customTextFieldWithHeading(
                    size: size,
                    heading: 'To Date *',
                    hintText: 'dd-mm-yyyy',
                    controller: TextEditingController(),
                    readOnly: false,
                    suffixIcon: Icon(Icons.calendar_month_outlined)
                ),
              ),
            ],
          ),
          SizedBox(height: height*0.01,),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: customTextFieldWithHeading(
                    size: size,
                    heading: 'Shoot start time *',
                    hintText: 'Select Time',
                    controller: TextEditingController(),
                    readOnly: false,
                    suffixIcon: Icon(Icons.access_time_filled)
                ),
              ),
              SizedBox(width: width*0.02,),
              Expanded(
                flex: 1,
                child: customTextFieldWithHeading(
                    size: size,
                    heading: 'Shoot end time*',
                    hintText: 'Select Time',
                    controller: TextEditingController(),
                    readOnly: false,
                    suffixIcon: Icon(Icons.access_time_filled)
                ),
              ),
            ],
          ),
          SizedBox(height: height*0.01,),
          customDropdownWithHeading(
              heading: 'Scenes *',
              hintText: '1,2,3,4',
              value: null,
              items: ['Scenes 1','Scenes 2','Scenes 3'],
              onChanged: (value){}
          ),
          SizedBox(height: height*0.01,),
          customDropdownWithHeading(
              heading: 'Interior/Exterior *',
              hintText: 'Select type',
              value: null,
              items: ['Interior','Exterior'],
              onChanged: (value){}
          ),
          SizedBox(height: height*0.01,),
          customTextFieldWithHeading(
              size: size,
              heading: 'Actors *',
              hintText: 'Comma-seperated names',
              controller: TextEditingController(),
              readOnly: false
          ),
          SizedBox(height: height*0.01,),
          customTextFieldWithHeading(
              size: size,
              heading: 'Select cast *',
              hintText: 'Hero - Arjun , Heroine - Das',
              controller: TextEditingController(),
              readOnly: false
          ),
          SizedBox(height: height*0.01,),
          customTextFieldWithHeading(
              size: size,
              heading: 'Location *',
              hintText: 'Fetch from scenic order',
              controller: TextEditingController(),
              readOnly: false
          ),
          Row(
            children: [
              Checkbox(
                  value: false,
                  onChanged: (toggle){},
                  checkColor: Colors.black ,
              ),
              Text('Select all crew members')
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: primaryOutlinedButton(
                    text: 'Cancel',
                    onPressed: (){
                      AppRouter.instance.pop();
                    }
                ),
              ),
              SizedBox(width: width*0.03,),
              Expanded(
                flex: 1,
                  child: primaryButton(text: 'Next', onPressed: (){
                    if(viewModel.currentPage==0){
                      viewModel.changePage=1;
                    }
                  })
              )
            ],
          )



        ],
      ),
    );
  }
}

