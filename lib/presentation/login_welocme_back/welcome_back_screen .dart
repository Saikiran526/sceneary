import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/core/constants/app_colors.dart';
import 'package:sceneary/core/constants/assets_path.dart';
import 'package:sceneary/core/navigation/app_routes.dart';
import 'package:sceneary/core/navigation/routes_path.dart';
import 'package:sceneary/presentation/app_utils/app_widgets.dart';
import 'package:sceneary/presentation/login_welocme_back/welcome_back_viewmodel.dart';

class WelcomeBackScreen extends StatelessWidget {
  const WelcomeBackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WelcomeBackViewmodel(context: context),
      child: Consumer<WelcomeBackViewmodel>(
        builder: (context, viewModel, child) {
          return AnnotatedRegion(
            value: const SystemUiOverlayStyle(
              statusBarColor: Color(0xFF0B0B0B), 
              statusBarIconBrightness: Brightness.light,  
              statusBarBrightness: Brightness.dark,  
            ),
            child: Scaffold(
              body: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFF0B0B0B), Color(0xFF720455)],
                      ),
                    ),
                  ),
                  Positioned(
                    left: -19,
                    top: -25,
                    child: SizedBox(
                      child: SvgPicture.asset(AssetsPath.leftGradeient),
                    ),
                  ),
                  Positioned(
                    left: 104,
                    top: -1,
                    child: SizedBox(
                      child: SvgPicture.asset(AssetsPath.rightGradeient),
                    ),
                  ),
                  Positioned(
                    right: -20,
                    child: SizedBox(
                      width: 147,
                      height: 370,
                      child: SvgPicture.asset(AssetsPath.middleGradeient),
                    ),
                  ),
                  Positioned(
                    top: 39,
                    left: 93,
                    child: SizedBox(
                      child: SvgPicture.asset(AssetsPath.loginCenter),
                    ),
                  ),
                  SingleChildScrollView(
                    child: SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset(AssetsPath.appbarBtn),
                            SizedBox(height: 50),
                            Text(
                              "Welcome Back",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Sign in to continue to your projects",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 50),
                            Container(
                              width: double.infinity,
                              height: 492,
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.20),
                                    blurRadius: 40,
                                    spreadRadius: 4,
                                    offset: const Offset(0, 20),
                                  ),
                                ],
                                color: Colors.white.withOpacity(1),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 50),
                                  Text(
                                    "Email ID *",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  customTextField(
                                    controller:
                                        viewModel.emailOrMobileController,
                                    hintText: 'Enter here',
                                    isError: viewModel.isEmailError,
                                    errorText: viewModel.emailErrorText,
                                    keyboardType: TextInputType.emailAddress,
                                    onChanged: (_) {
                                      if (viewModel.isEmailError) {
                                        viewModel.validateEmail();
                                      }
                                    },
                                  ),

                                  SizedBox(height: 24),
                                  Text(
                                    "Password *",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  customTextField(
                                    controller: viewModel.passwordController,
                                    hintText: 'Enter here',
                                    obscureText: true,
                                    focusNode: viewModel.passwordFocusNode,
                                    isError: viewModel.isPasswordError,
                                    errorText: viewModel.passwordErrorText,
                                    onChanged: (_) {
                                      viewModel.validatePassword();
                                    },
                                  ),

                                  SizedBox(height: 24),
                                  Text(
                                    "Forgot Password? ",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: primaryBlue,
                                    ),
                                  ),
                                  SizedBox(height: 40),
                                  primaryButton(
                                    text: 'Login',
                                    onPressed: () {
                                      final isValid = viewModel.validateLogin();

                                      if (isValid) {
                                       AppRouter.instance.push(RoutePaths.basicInformationPageview);
                                      }
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
                                            text: 'Don’t have an account? ',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xFF4F4F4F),
                                            ),
                                          ),
                                          TextSpan(
                                            text: 'Register Now',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: primaryBlue,
                                              decoration:
                                                  TextDecoration.underline,
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
                            const SizedBox(height: 30),
                          ],
                        ),
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
}
