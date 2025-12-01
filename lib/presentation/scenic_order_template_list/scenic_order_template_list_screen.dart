import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/core/navigation/app_routes.dart';
import 'package:sceneary/core/navigation/routes_path.dart';
import 'package:sceneary/presentation/app_utils/app_widgets.dart';
import 'package:sceneary/presentation/scenic_order_template_list/scenic_order_template_list_viewmodel.dart';

class ScenicOrderTemplateListScreen extends StatelessWidget {
  const ScenicOrderTemplateListScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    // final width= MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Scenic order'),
      ),
      body: ChangeNotifierProvider(
          create: (_)=> ScenicOrderTemplateListViewmodel(),
        child: Consumer<ScenicOrderTemplateListViewmodel>(
            builder: (context,viewModel,child){
              return SingleChildScrollView(
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
                      ...List.generate(4, (index){
                        return GestureDetector(
                          onTap: (){
                            viewModel.setSelectedTemplate=index;
                          },
                          child: Column(
                            children: [
                              Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(26),
                                ),
                                child: Container(
                                  height: height*0.15,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(26),
                                      border: viewModel.selectedTemplate==index
                                          ? Border.all(
                                          color: Colors.black,
                                          width: 1
                                      )
                                          : null
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Template ${index+1}',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: height*0.01,)
                            ],
                          ),
                        );
                      }),
                      SizedBox( height: height*0.01,),
                      primaryButton(
                          text: 'Choose', 
                          onPressed: (){
                            AppRouter.instance.push(RoutePaths.scenicOrderTemplateDetailsScreen);
                          }
                      )


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
