import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 24),
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
                      ),
                    ),
                    Text(
                      "Enter your details to create account",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 24),

                    Expanded(
                      child: PageView(
                        controller: viewModel.pageController,
                        onPageChanged: (page) {
                          viewModel.changePage(page);
                        },
                        children: const [
                          BasicInformationScreenOne(),
                          BasicInformationScreenTwo(),
                         BasicInformationScreenThree( ),
                        ],
                      ),
                    ),
                  ],
                ),
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
      backgroundColor: isActive ? Colors.black : Color(0xFF868686),
      child: Text(
        "${index + 1}",
        style: TextStyle(
          color: Colors.white,
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
        margin: EdgeInsets.symmetric(horizontal: 8),
      ),
    );
  }
}
