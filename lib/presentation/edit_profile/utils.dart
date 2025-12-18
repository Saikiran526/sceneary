import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sceneary/core/navigation/app_routes.dart';
import 'package:sceneary/presentation/call_sheets/widgets/app_button.dart';
import 'package:sceneary/presentation/edit_profile/edit_profile_viewmodel.dart';

Widget localCustomDropdown({
  required String heading,
  required String hintText,
  required String? value,
  required List<String> items,
  required Function(String?) onChanged,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        heading,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
      ),
      const SizedBox(height: 8),

      DropdownButtonFormField<String>(
        value: value,
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
          ),
        ),
        items: items
            .map((e) => DropdownMenuItem(value: e, child: Text(e)))
            .toList(),
        onChanged: onChanged,
      ),
    ],
  );
}

Widget editContainer(
  BuildContext screenContext,
  EditProfileViewmodel viewModel,
  String field,
) {
  return GestureDetector(
    onTap: () {
      _showEditDialog(screenContext, viewModel, field);
    },
    child: Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(3),
      ),
      padding: const EdgeInsets.all(4),
      child: const Icon(Icons.edit, size: 18, color: Colors.white),
    ),
  );
}

void _showEditDialog(
  BuildContext context,
  EditProfileViewmodel viewModel,
  String field,
) {
  final TextEditingController tempController = TextEditingController(
    text: field == 'email'
        ? viewModel.emailController.text
        : viewModel.mobileNumController.text,
  );

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    field == 'email'
                        ? 'Verify Your Email'
                        : 'Verify Your Number',
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      height: 20 / 14,
                      letterSpacing: 0.14,
                      color: Color(0xFF252525),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    field == 'email'
                        ? 'A 4 digit OTP sent to your email'
                        : 'A 4 digit OTP sent to your number',
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      height: 16 / 12,
                      color: Color(0xFF6B6B6B),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: tempController,
                    keyboardType: field == 'email'
                        ? TextInputType.emailAddress
                        : TextInputType.number,
                    decoration: InputDecoration(
                      hintText: field == 'email' ? 'Enter email' : 'Enter OTP',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      isDense: true,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Spacer(),
                  Row(
                    children: [
                      Expanded(
                        child: AppButton(
                          label: "Cancel",
                          buttonColor: Colors.white,
                          textColor: Color(0XFF1D55A8),
                          borderColor: Color(0XFF1D55A8),
                          onTap: () {
                            AppRouter.instance.pop(context);
                          },
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: AppButton(
                          label: "Send OTP",
                          buttonColor: Color(0XFF1D55A8),
                          textColor: Colors.white,
                          onTap: () {
                            if (field == 'email') {
                              viewModel.emailController.text =
                                  tempController.text;
                            } else {
                              viewModel.mobileNumController.text =
                                  tempController.text;
                            }
                            Navigator.of(context, rootNavigator: true).pop();
                            Future.microtask(() {
                              _showOtpDialog(
                                context,
                                viewModel,
                                isEmail: field == 'email',
                              );
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

void _showOtpDialog(
  BuildContext context,
  EditProfileViewmodel viewModel, {
  required bool isEmail,
}) {
  final List<TextEditingController> otpControllers = List.generate(
    4,
    (_) => TextEditingController(),
  );
  final List<FocusNode> focusNodes = List.generate(4, (_) => FocusNode());

  viewModel.startOtpTimer();

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          viewModel.addListener(() {
            setState(() {});
          });

          return Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Enter OTP',
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF252525),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        isEmail
                            ? 'OTP Verification Code Sent to Email'
                            : 'OTP Verification Code Sent to number',
                        style: GoogleFonts.montserrat(
                          fontSize: 12,
                          color: Color(0xFF6B6B6B),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(4, (index) {
                          return Padding(
                            padding: EdgeInsets.only(
                              right: index == 3 ? 0 : 10,
                            ),
                            child: SizedBox(
                              width: 40,
                              height: 40,
                              child: TextField(
                                controller: otpControllers[index],
                                focusNode: focusNodes[index],
                                maxLength: 1,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                                decoration: InputDecoration(
                                  counterText: '',
                                  isDense: true,
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 0,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                      color: Color(0x4D000000),
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                      color: Color(0x4D000000),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                onChanged: (value) {
                                  if (value.isNotEmpty && index < 3) {
                                    FocusScope.of(
                                      context,
                                    ).requestFocus(focusNodes[index + 1]);
                                  }
                                },
                              ),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 12),

                      Center(
                        child: GestureDetector(
                          onTap: viewModel.canResend
                              ? () {
                                  viewModel.resetOtpTimer();
                                }
                              : null,
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 8,
                                height: 1,
                              ),
                              children: [
                                const TextSpan(
                                  text: "Didn’t receive the OTP? ",
                                  style: TextStyle(color: Color(0xFF6B6B6B)),
                                ),
                                TextSpan(
                                  text: "Resend ",
                                  style: TextStyle(
                                    color: viewModel.canResend
                                        ? const Color(0xFF1D55A8)
                                        : Colors.grey,
                                    decoration: viewModel.canResend
                                        ? TextDecoration.underline
                                        : TextDecoration.none,
                                  ),
                                ),
                                TextSpan(
                                  text: viewModel.canResend
                                      ? ""
                                      : "in ${viewModel.otpTimer}s",
                                  style: const TextStyle(color: Colors.red),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      Row(
                        children: [
                          Expanded(
                            child: AppButton(
                              label: "Cancel",
                              buttonColor: Colors.white,
                              textColor: Color(0XFF1D55A8),
                              borderColor: Color(0XFF1D55A8),
                              onTap: () {
                                AppRouter.instance.pop(context);
                              },
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: AppButton(
                              label: "Continue",
                              onTap: () {
                                final otp = otpControllers.join();
                              },
                              buttonColor: Color(0XFF1D55A8),
                              textColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
    },
  );
}
