import 'package:flutter/material.dart';
import 'package:sceneary/core/navigation/app_routes.dart';
import 'package:sceneary/core/navigation/routes_path.dart';
import 'package:sceneary/presentation/app_utils/app_widgets.dart';

class ScenicOrderTemplateDetailsScreen extends StatelessWidget {
  const ScenicOrderTemplateDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Scenic order'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(21.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select Template',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600
                ),
              ),
              SizedBox( height: height*0.01,),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(26),
                ),
                child: Container(
                  height: height * 0.75,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(26),
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                  child: Center(
                    child: Text(
                      'Template 1',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox( height: height*0.01,),
              primaryButton(
                  text: 'Select Template',
                  onPressed: (){
                    AppRouter.instance.push(RoutePaths.enterScenicOrderTemplateDetailsScreen);
                  }
              )


            ],
          ),
        ),
      ),
    );
  }
}
