import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/core/constants/assets_path.dart';
import 'package:sceneary/presentation/basic_information/view/basic_information_screen_one.dart';
import 'package:sceneary/presentation/basic_information/view/basic_information_screen_three.dart';
import 'package:sceneary/presentation/basic_information/view/basic_information_screen_two.dart';
import 'package:sceneary/presentation/basic_information/viewmodel/basic_information_pageview_viewmodel.dart';

class BasicInformationPageview extends StatelessWidget {
  const BasicInformationPageview({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BasicInformationPageviewViewmodel(context: context),
      child: Consumer<BasicInformationPageviewViewmodel>(
        builder: (context, viewModel, child) {
          return AnnotatedRegion(
            value: const SystemUiOverlayStyle(
              statusBarColor: Color(0xFF0B0B0B),
              statusBarIconBrightness: Brightness.light,
              statusBarBrightness: Brightness.dark,
            ),
            child: Scaffold(
              resizeToAvoidBottomInset: false, 
              body: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.centerRight,
                        colors: [Color(0xFF090216), Color(0xFF9D306A)],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 119,
                    child: SvgPicture.asset(AssetsPath.basicViewGradient),
                  ),
                  Positioned(
                    top: 20,
                    left: 40,
                    child: SvgPicture.asset(AssetsPath.basicViewImg),
                  ),
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            GestureDetector(
                              onTap: () {
                                viewModel.pageController.previousPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.ease,
                                );
                              },
                              child: SvgPicture.asset(AssetsPath.appbarBtn),
                            ),
                          SizedBox(height: 140),
                          Row(
                            children: [
                              _buildStepCircle(0, viewModel),
                              _buildLine(),
                              _buildStepCircle(1, viewModel),
                              _buildLine(),
                              _buildStepCircle(2, viewModel),
                            ],
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Basic Information",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Enter your details to create account",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFB0B0B0),
                            ),
                          ),
                          SizedBox(height: 15),
                          Expanded(
                            child: PageView(
                              controller: viewModel.pageController,
                              onPageChanged: (page) {
                                viewModel.changePage(page);
                              },
                              children: const [
                                BasicInformationScreenOne(),
                                BasicInformationScreenTwo(),
                                BasicInformationScreenThree(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildStepCircle(int index, viewModel) {
    bool isActive = viewModel.currentPage == index;
    return CircleAvatar(
      radius: 24,
      backgroundColor: isActive ? Colors.white : Color(0xFF868686),
      child: Text(
        "${index + 1}",
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w700,
          fontSize: 20,
        ),
      ),
    );
  }

  Widget _buildLine() {
    return Expanded(
      child: Container(
        height: 2,
        color: Colors.grey.shade400,
        margin: const EdgeInsets.symmetric(horizontal: 8),
      ),
    );
  }
}
