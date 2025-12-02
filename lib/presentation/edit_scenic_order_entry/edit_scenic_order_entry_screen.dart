import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/core/constants/assets_path.dart';
import 'package:sceneary/core/navigation/app_routes.dart';
import 'package:sceneary/presentation/app_utils/app_widgets.dart';
import 'package:sceneary/presentation/edit_scenic_order_entry/edit_scenic_order_entry_viewmodel.dart';

class EditScenicOrderEntryScreen extends StatelessWidget {
  const EditScenicOrderEntryScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final height = MediaQuery.of(context).size.height;
    final width= MediaQuery.of(context).size.width;

    return Scaffold(
      body: ChangeNotifierProvider(
          create: (_)=> EditScenicOrderEntryViewmodel(),
        child: Consumer<EditScenicOrderEntryViewmodel>(
            builder: (context,viewModel,child){
              return SingleChildScrollView(
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(21.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: SizedBox()
                            ),
                            Text(
                              'Edit Scenic order Entry',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700
                              ),
                            ),
                            Expanded(
                                child: GestureDetector(
                                    onTap: (){
                                      AppRouter.instance.pop();
                                    },
                                    child: Align(alignment:Alignment.centerRight ,child: SvgPicture.asset(AssetsPath.crossImg))
                                )
                            ),

                          ],
                        ),
                        SizedBox(height: height*0.02,),
                        Center(
                          child: Text(
                            'Fill in the details for the new scenic order entry.',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            'All fields marked with * are required',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                        ),
                        SizedBox(height: height*0.02,),
                        Row(
                          children: [
                            Expanded(
                              child: customTextFieldWithHeading(
                                  size: size,
                                  heading: 'Scene Number *',
                                  hintText: 'Enter scene no',
                                  controller: viewModel.sceneNemController,
                                  readOnly: false,
                                  maxLines: 1
                              ),
                            ),
                            SizedBox(width: width*0.02,),
                            Expanded(
                              child: customTextFieldWithHeading(
                                  size: size,
                                  heading: 'Sub Scene *',
                                  hintText: 'Enter Sub-scene no',
                                  controller: viewModel.sceneNemController,
                                  readOnly: false,
                                  maxLines: 1
                              ),
                            ),

                          ],
                        ),
                        SizedBox(height: height*0.02,),
                        customTextFieldWithHeading(
                            size: size,
                            heading: 'Description',
                            hintText: 'Brief description of the scene',
                            controller: viewModel.sceneNemController,
                            readOnly: false,
                            maxLines: 5
                        ),
                        SizedBox(height: height*0.02,),
                        customTextFieldWithHeading(
                            size: size,
                            heading: 'Location *',
                            hintText: 'e g. Stadium or office',
                            controller: viewModel.sceneNemController,
                            readOnly: false,
                            maxLines: 1
                        ),
                        SizedBox(height: height*0.02,),
                        Row(
                          children: [
                            Expanded(
                              child: customDropdownWithHeading(
                                  heading: 'Interior/Exterior *',
                                  hintText: 'Select type',
                                  value: null,
                                  items: ["Interior","Exterior"],
                                  onChanged: (value){}
                              ),
                            ),
                            SizedBox(width: width*0.02,),
                            Expanded(
                              child: customDropdownWithHeading(
                                  heading: 'Time *',
                                  hintText: 'Select',
                                  value: null,
                                  items: ["Morning","Afternoon","Evening"],
                                  onChanged: (value){}
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: height*0.02,),
                        customTextFieldWithHeading(
                            size: size,
                            heading: 'Actors',
                            hintText: 'Allu Arjun, Rashmika... ',
                            controller: viewModel.sceneNemController,
                            readOnly: false,
                            maxLines: 1
                        ),
                        SizedBox(height: height*0.02,),
                        customDropdownWithHeading(
                            heading: 'Select Cast *',
                            hintText: 'Pushpa - Hero , srivalli - heroine',
                            value: null,
                            items: ["Pushpa - Hero","srivalli - heroine"],
                            onChanged: (value){}
                        ),
                        SizedBox(height: height*0.02,),
                        customDropdownWithHeading(
                            heading: 'Select Crew *',
                            hintText: 'Cameraman, dance master..',
                            value: null,
                            items: ["CameraMan","dance master"],
                            onChanged: (value){}
                        ),
                        SizedBox(height: height*0.02,),
                        Row(
                          children: [
                            Expanded(
                                child: primaryOutlinedButton(
                                    text: 'Cancel',onPressed: (){}
                                )
                            ),
                            SizedBox(width: width*0.05,),
                            Expanded(
                                child: primaryButton(
                                    text: 'Save Entry',
                                    onPressed: (){
                                      // AppRouter.instance.push(RoutePaths.previewScenicOrderTemplateDetailsScreen);
                                    }
                                )
                            )
                          ],
                        )


                      ],
                    ),
                  ),
                ),
              );
            }
        ),
      ),
    );
  }
}
