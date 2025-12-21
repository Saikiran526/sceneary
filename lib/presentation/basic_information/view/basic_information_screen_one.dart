import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/core/constants/assets_path.dart';
import 'package:sceneary/presentation/app_utils/app_widgets.dart';
import 'package:sceneary/presentation/basic_information/viewmodel/basic_information_pageview_viewmodel.dart';
import 'package:sceneary/presentation/basic_information/viewmodel/basic_information_viewmodel_one.dart';

class BasicInformationScreenOne extends StatelessWidget {
  const BasicInformationScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BasicInformationViewmodelOne(context: context),
      child: Consumer<BasicInformationViewmodelOne>(
        builder: (context, viewModel, _) {
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
                    const Text(
                      "Full Name *",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    customTextField(
                      controller: viewModel.fullNameController,
                      hintText: 'Enter here',
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Screen Name",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    customTextField(
                      controller: viewModel.screenNameController,
                      hintText: 'Enter here',
                    ),

                    const SizedBox(height: 16),
                    //  const Text(
                    //   "Gender",
                    //   style: TextStyle(
                    //     fontSize: 14,
                    //     fontWeight: FontWeight.w600,
                    //   ),
                    // ),
                    // const SizedBox(height: 8),
                    // _genderDropdown(viewModel),
                    // const SizedBox(height: 16),
                    // const SizedBox(height: 16),
                    //  const Text(
                    //   "Verify Email ID",
                    //   style: TextStyle(
                    //     fontSize: 14,
                    //     fontWeight: FontWeight.w600,
                    //   ),
                    // ),
                    // const SizedBox(height: 8),
                    // customTextField(
                    //   controller: viewModel.verifyEmailIdController,
                    //   hintText: 'Enter here',
                    // ),
                    const Text(
                      "Mobile Number",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        _countryCodeDropdown(viewModel),
                        const SizedBox(width: 10),
                        Expanded(
                          child: customTextField(
                            controller: viewModel.mobileNOController,
                            hintText: 'Enter here',
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Email ID *",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    customTextField(
                      controller: viewModel.emailIdController,
                      hintText: 'Enter here',
                      // suffix: _verifyButton(),
                    ),

                    const SizedBox(height: 16),

                    const Text(
                      "Password",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    customTextField(
                      controller: viewModel.passwordController,
                      hintText: 'Enter here',
                      suffix: SvgPicture.asset(AssetsPath.visibiltyImg),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Re-Enter Password",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    customTextField(
                      controller: viewModel.reEnterPasswordController,
                      hintText: 'Enter here',
                      suffix: SvgPicture.asset(AssetsPath.iconInvisible),
                    ),

                    const SizedBox(height: 24),

                    primaryButton(
                      text: 'Verify',
                      onPressed: () {
                        Provider.of<BasicInformationPageviewViewmodel>(
                          context,
                          listen: false,
                        ).nextPage();
                      },
                    ),
                    const SizedBox(height: 24),
                    const Center(
                      child: Text(
                        'OR',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
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

  Widget _countryCodeDropdown(BasicInformationViewmodelOne viewModel) {
    return Container(
      height: 40,
      width: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFEDF1F3)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: viewModel.selectCode,
          isExpanded: true,
          items: viewModel.chooseCode
              .map(
                (e) => DropdownMenuItem(
                  value: e,
                  child: Center(
                    child: Text(e, style: const TextStyle(fontSize: 12)),
                  ),
                ),
              )
              .toList(),
          onChanged: (value) {
            if (value != null) viewModel.selectedCode(value);
          },
        ),
      ),
    );
  }
}

  // Widget _verifyButton() {
  //   return Container(
  //     height: 23,
  //     width: 50,
  //     alignment: Alignment.center,
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(8),
  //       border: Border.all(color: const Color(0xFFEDF1F3)),
  //     ),
  //     child: const Text('Verify', style: TextStyle(fontSize: 12)),
  //   );
  // }

  // Widget _genderDropdown(BasicInformationViewmodelOne viewModel) {
  //   return Container(
  //     height: 40,
  //     padding: const EdgeInsets.symmetric(horizontal: 10),
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(8),
  //       border: Border.all(color: const Color(0xFFEDF1F3)),
  //     ),
  //     child: DropdownButtonHideUnderline(
  //       child: DropdownButton<String>(
  //         value: viewModel.selectGender,
  //         isExpanded: true,
  //         items: viewModel.chooseGender
  //             .map(
  //               (e) => DropdownMenuItem(
  //                 value: e,
  //                 child: Text(e, style: const TextStyle(fontSize: 12)),
  //               ),
  //             )
  //             .toList(),
  //         onChanged: (value) {
  //           if (value != null) viewModel.selectedGender(value);
  //         },
  //       ),
  //     ),
  //   );
  // }



