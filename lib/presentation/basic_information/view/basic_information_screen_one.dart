import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/core/constants/assets_path.dart';
import 'package:sceneary/core/navigation/app_routes.dart';
import 'package:sceneary/core/navigation/routes_path.dart';
import 'package:sceneary/presentation/app_utils/app_widgets.dart';
import 'package:sceneary/presentation/basic_information/view/basic_information_screen_two.dart';
import 'package:sceneary/presentation/basic_information/viewmodel/basic_information_pageview_viewmodel.dart';
import 'package:sceneary/presentation/basic_information/viewmodel/basic_information_viewmodel_one.dart';

class BasicInformationScreenOne extends StatelessWidget {
  const BasicInformationScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BasicInformationViewmodelOne(context: context),
      child: Consumer<BasicInformationViewmodelOne>(
        builder: (context, viewModel, child) {
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Center(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.10),
                          blurRadius: 12,
                          spreadRadius: 1,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 16),
                          Text(
                            "Full Name",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 8),
                          customTextField(
                            controller: viewModel.fullNameController,
                            hintText: 'Enter here',
                          ),
                          SizedBox(height: 16),
                          Text(
                            "Gender",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 8),
                          Container(
                            height: 40,
                            width: double.infinity,
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                              border: Border.all(
                                color: Color(0xFFEDF1F3),
                                width: 1,
                              ),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: viewModel.selectGender,
                                isExpanded: true,
                                icon: const Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 18,
                                ),
                                dropdownColor: Colors.white,
                                alignment: Alignment.center,
                                items: viewModel.chooseGender
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
                                    viewModel.selectedGender(value);
                                  }
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            "Email ID",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 8),
                          customTextField(
                            controller: viewModel.emailIdController,
                            hintText: 'Enter here',
                            suffix: Container(
                              height: 23,
                              width: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white,
                                border: Border.all(
                                  color: Color(0xFFEDF1F3),
                                  width: 1,
                                ),
                              ),
                              child: Text(
                                'Verify',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF4F4F4F),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            "Verify Email ID",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 8),
                          customTextField(
                            controller: viewModel.verifyEmailIdController,
                            hintText: 'Enter here',
                          ),
                          SizedBox(height: 16),
                          Text(
                            "Mobile Number",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Container(
                                height: 40,
                                width: 48,
                                alignment: Alignment.center,
                                padding: EdgeInsets.zero,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Color(0xFFEDF1F3),
                                    width: 1,
                                  ),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: viewModel.selectCode,
                                    isExpanded: true,
                                    icon: const Icon(
                                      Icons.keyboard_arrow_down,
                                      size: 18,
                                    ),
                                    dropdownColor: Colors.white,
                                    alignment: Alignment.center,
                                    items: viewModel.chooseCode
                                        .map(
                                          (e) => DropdownMenuItem(
                                            value: e,
                                            alignment: Alignment.center,
                                            child: Text(
                                              e,
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                    onChanged: (value) {
                                      if (value != null) {
                                        viewModel.selectedCode(value);
                                      }
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: customTextField(
                                  controller: viewModel.mobileNOController,
                                  hintText: 'Enter here',
                                  keyboardType: TextInputType.number,
                                  // maxlength: 10,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Text(
                            "Password",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 8),
                          customTextField(
                            controller: viewModel.passwordController,
                            hintText: 'Enter here',
                            suffix: SvgPicture.asset(AssetsPath.visibiltyImg),
                          ),
                          SizedBox(height: 16),
                          Text(
                            "Re-Enter Password",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 8),
                          customTextField(
                            controller: viewModel.reEnterPasswordController,
                            hintText: 'Enter here',
                            suffix: Icon(Icons.visibility_off),
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
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
