import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/presentation/add_shooting_schedule/add_shooting_schedule_viewmodel.dart';
import 'package:sceneary/presentation/app_utils/app_widgets.dart';

class AddShootingScheduleScreen extends StatelessWidget {
  const AddShootingScheduleScreen({super.key});

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
        child: Consumer(
            builder: (context,viewModel,child){
              return Padding(
                padding: const EdgeInsets.all(21.0),
                child: Column(
                  children: [
                    customTextFieldWithHeading(
                        size: size,
                        heading: 'Sl.No *',
                        hintText: 'Enter Sl.No',
                        controller: TextEditingController(),
                        readOnly: false
                    )
                  ],
                ),
              );
            }
        )
      ),
    );
  }
}
