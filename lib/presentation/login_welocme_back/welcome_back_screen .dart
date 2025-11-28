import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
          return Scaffold(
            body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFF7F7F9), Color(0xFF929293)],
                ),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 50),
                      Align(
                        alignment: AlignmentGeometry.bottomRight,
                        child: Container(
                          width: 60,
                          height: 36,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(width: 1, color: Colors.grey),
                          ),
                          child: Center(
                            child: Text(
                              "Skip",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Welcome Back",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "Sign in to continue to your projects",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 40),
                      Container(
                        width: 328,
                        height: 448,
                        padding: const EdgeInsets.fromLTRB(14, 60, 14, 60),
                        decoration: BoxDecoration(
                           boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.10),
                              blurRadius: 12,
                              spreadRadius: 1,
                              offset: Offset(0, 4),
                            ),
                          ],
                          color: Colors.white.withOpacity(1),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 24),
                            Text(
                              "Email or Mobile ",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 8),
                            customTextField(
                              controller: viewModel.emailOrMobileController,
                              hintText: 'Enter here',
                            ),
                            SizedBox(height: 24),
                            Row(
                              children: [
                                Text(
                                  "Password ",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  "Forgot Password? ",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            customTextField(
                              controller: viewModel.passwordController,
                              hintText: 'Enter here',
                            ),
                            SizedBox(height: 24),
                            primaryButton(text: 'Login', onPressed: () {
                             // AppRouter.instance.push(RoutePaths.basicInformationPageview);
                              AppRouter.instance.push(RoutePaths.castAndCrewScreen);
                            }),
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
                    ],
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
