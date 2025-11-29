import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/core/navigation/app_routes.dart';
import 'package:sceneary/core/navigation/routes_path.dart';
import 'package:sceneary/presentation/app_utils/app_widgets.dart';
import 'package:sceneary/presentation/enter_otp/enter_otp_viewmodel.dart';

class EnterOtpScreen extends StatelessWidget {
  const EnterOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EnterOtpViewmodel(context: context),
      child: Consumer<EnterOtpViewmodel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 120),
                      Text(
                        "Please enter OTP",
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
                        width: double.infinity,
                        height: 356,
                        padding: const EdgeInsets.fromLTRB(34, 60, 14, 60),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.12),
                              blurRadius: 16,
                              spreadRadius: 2,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // SizedBox(height: 15),
                            Text(
                              "Please enter OTP",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "OTP sent to your Mobile Number 85003XXXX",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF5D5D5D),
                              ),
                            ),
                            SizedBox(height: 28),
                            SizedBox(
                              width: 268,
                              child: Row(
                                children: List.generate(4, (index) {
                                  return Row(
                                    children: [
                                      SizedBox(
                                        height: 48,
                                        width: 48,
                                        child: TextField(
                                          controller:
                                              viewModel.otpControllers[index],
                                          keyboardType: TextInputType.number,
                                          textAlign: TextAlign.center,
                                          maxLength: 1,
                                          decoration: InputDecoration(
                                            counterText: "",
                                            filled: true,
                                            fillColor: Colors.white,
                                            contentPadding: EdgeInsets.zero,
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              borderSide: BorderSide(
                                                color: Color(0xFFD1D1D1),
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              borderSide: BorderSide(
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          onChanged: (value) {
                                            viewModel.onTapChanged(
                                              value,
                                              index,
                                            );
                                          },
                                        ),
                                      ),
                                      if (index != 3) SizedBox(width: 16),
                                    ],
                                  );
                                }),
                              ),
                            ),
                            SizedBox(height: 40),
                            primaryButton(
                              text: 'Continue',
                              onPressed: () {
                                AppRouter.instance.push(
                                  RoutePaths.verifyYourIdentityScreen,
                                );
                              },
                            ),
                            SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (viewModel.seconds > 0)
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "Resend OTP in. ",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            height: 1.0,
                                            color: Color(0xFF5D5D5D),
                                          ),
                                        ),
                                        TextSpan(
                                          text: "${viewModel.seconds} sec",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                            height: 1.0,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                else
                                  GestureDetector(
                                    onTap: viewModel.resendOtp,
                                    child: Text(
                                      "Resend OTP",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        height: 1.0,
                                        color: Color(0xFF5D5D5D),
                                      ),
                                    ),
                                  ),
                              ],
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
