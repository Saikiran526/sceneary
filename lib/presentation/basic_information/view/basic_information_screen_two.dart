import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/core/constants/assets_path.dart';
import 'package:sceneary/presentation/app_utils/app_widgets.dart';
import 'package:sceneary/presentation/basic_information/viewmodel/basic_information_pageview_viewmodel.dart';
import 'package:sceneary/presentation/basic_information/viewmodel/basic_information_viewmodel_two.dart';

class BasicInformationScreenTwo extends StatelessWidget {
  const BasicInformationScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BasicInformationViewmodelTwo(context: context),
      child: Consumer<BasicInformationViewmodelTwo>(
        builder: (context, viewModel, child) {
          return SingleChildScrollView(
            child: Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              elevation: 6,
              shadowColor: Colors.black.withOpacity(0.15),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    SizedBox(height: 16),
                    Text(
                      "Craft",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        border: Border.all(color: Color(0xFFEDF1F3), width: 1),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: viewModel.selectCraft,
                          isExpanded: true,
                          icon: const Icon(Icons.keyboard_arrow_down, size: 18),
                          dropdownColor: Colors.white,
                          items: viewModel.chooseCraft
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(
                                    e,
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              )
                              .toList(),

                          onChanged: (value) {
                            if (value != null) {
                              viewModel.selectedCraft(value);
                            }
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Subcraft",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        border: Border.all(color: Color(0xFFEDF1F3), width: 1),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: viewModel.selectSubCraft,
                          isExpanded: true,
                          icon: const Icon(Icons.keyboard_arrow_down, size: 18),
                          dropdownColor: Colors.white,
                          items: viewModel.chooseSubCraft
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(
                                    e,
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            if (value != null) {
                              viewModel.selectedSubCraft(value);
                            }
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Experience level",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        border: Border.all(color: Color(0xFFEDF1F3), width: 1),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: viewModel.selectExperienceLevel,
                          isExpanded: true,
                          icon: const Icon(Icons.keyboard_arrow_down, size: 18),
                          dropdownColor: Colors.white,
                          items: viewModel.chooseExperienceLevel
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(
                                    e,
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            if (value != null) {
                              viewModel.selectedSeniorLevel(value);
                            }
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Instagram ",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8),
                    customTextField(
                      controller: viewModel.instaUserNameController,
                      hintText: '@Yourusername',
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Youtube",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8),
                    customTextField(
                      controller: viewModel.youtubeController,
                      hintText: 'Channel URL',
                    ),
                    SizedBox(height: 24),
                    Text(
                      "Career Highlights",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8),
                    customTextField(
                      controller: viewModel.youtubeController,
                      hintText: 'Enter here..',
                      suffix: Container(
                        height: 23,
                        width: 51,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.white,
                          border: Border.all(color: Colors.grey, width: 1),
                        ),
                        child: Text(
                          '+ Add',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF4F4F4F),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Container(
                      padding: EdgeInsets.all(8),
                      width: double.infinity,
                      color: Color(0xFFFBF4F9),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(AssetsPath.pageTwoImg),
                              Text(
                                'Loem Ipsunf sudhbsjcn jsw wsds..',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF454545),
                                ),
                              ),
                              Icon(Icons.close),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(AssetsPath.pageTwoImg),
                              Text(
                                'Loem Ipsunf sudhbsjcn jsw wsds..',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF454545),
                                ),
                              ),
                              Icon(Icons.close),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24),
                    primaryButton(
                      text: 'Next',
                      onPressed: () {
                        Provider.of<BasicInformationPageviewViewmodel>(
                          context,
                          listen: false,
                        ).nextPage();
                      },
                    ),

                    SizedBox(height: 24),
                    Center(
                      child: Text(
                        'OR',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Already have an account? ',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF4F4F4F),
                              ),
                            ),
                            TextSpan(
                              text: 'Login',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                decoration: TextDecoration.underline,
                                decorationThickness: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
