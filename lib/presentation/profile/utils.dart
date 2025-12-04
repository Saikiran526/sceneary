import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sceneary/core/navigation/app_routes.dart';
import 'package:sceneary/core/navigation/routes_path.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sceneary/core/constants/assets_path.dart';

Widget showProfileItems({
  required SvgPicture icon,
  required  String heading,
  required Size size
}){
  return GestureDetector(
    onTap: (){
      switch(heading){
        case "Edit Profile" : AppRouter.instance.push(RoutePaths.editProfileScreen); break;
        case "Change Password" : AppRouter.instance.push(RoutePaths.changePasswordScreen); break;
        case "Two-Factor Authentication" : AppRouter.instance.push(RoutePaths.twoFactorAuthenticationScreen); break;
        case "Update Calender" : AppRouter.instance.push(RoutePaths.calenderScreen); break;
        case "Subscription Details" : AppRouter.instance.push(RoutePaths.subscriptionPlanesScreen); break;
        case "Terms & Conditions" : AppRouter.instance.push(RoutePaths.termsAndConditionsScreen); break;
        case "Privacy Policy" : AppRouter.instance.push(RoutePaths.privacyPolicyScreen); break;
        case "Refund Policy" : AppRouter.instance.push(RoutePaths.refundPolicyScreen); break;
        case "Help & Support" : AppRouter.instance.push(RoutePaths.helpAndSupportScreen); break;
        case "FAQs" : AppRouter.instance.push(RoutePaths.faqsScreen); break;

      }
    },
    child: Row(
      children: [
        Container(
          decoration:BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  width: 1,
                  color: Colors.grey.shade300
              )
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: icon,
          ),
        ),
        SizedBox(width: size.width*0.02,),
        Text(
          heading,
          style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xff5D5D5D)
          ),
        )
      ],
    ),
  );
}


Future<dynamic> showBottomSlideForStitchingIssueReason({
  required BuildContext context}){
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: StatefulBuilder(
          builder: (context, setState) {
            return SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 21),
                height: MediaQuery.of(context).size.height * 0.65,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(),
                        const Text(
                          'Delete Account',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: SvgPicture.asset(
                            AssetsPath.crossOutlinedImg,
                            height: 20,
                            width: 20,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 1,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    const Text(
                      'Give Reason to Delete your Account.',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    // Radio Buttons Section
                    Column(
                      children: [
                        RadioListTile<String>(
                          title: const Text(
                            "No bookings",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff6C7278)
                            ),
                          ),
                          value: "No bookings",
                          activeColor: Colors.black,
                          groupValue: 'No bookings',
                          onChanged: (value) {
                            setState(() {
                              // viewModel.selectedReason = value;
                            });
                          },
                        ),
                        RadioListTile<String>(
                          title: const Text(
                            "Not using the app anymore",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff6C7278)
                            ),
                          ),
                          value: "Not using the app anymore",
                          activeColor: Colors.black,
                          groupValue: 'viewModel.selectedReason',
                          onChanged: (value) {
                            setState(() {
                              // viewModel.selectedReason = value;
                            });
                          },
                        ),
                        RadioListTile<String>(
                          title: const Text(
                            "Poor user experience",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff6C7278)
                            ),
                          ),
                          value: "Poor user experience",
                          activeColor: Colors.black,
                          groupValue: "viewModel.selectedReason",
                          onChanged: (value) {
                            setState(() {
                              // viewModel.selectedReason = value;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    // Other reason text
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Other reason (Please specify)",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff6C7278)
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    // Multiline TextField
                    TextField(
                      controller: null,
                      maxLines: 3,
                      decoration: InputDecoration(
                        hintText: "Type here...",
                        hintStyle: const TextStyle(
                          color: Colors.black,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xff5D5D5D)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    // Delete Account Button
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: const Color(0xff5D5D5D),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            AppRouter.instance.pop();
                            showConfirmDeleteBottomSheet(context: context, size: MediaQuery.of(context).size);
                          },
                          child: const Text(
                            'Delete Account',
                            style: TextStyle(
                            ),
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
    },
  );
}
Future<dynamic> showLogoutBottomSheet({
  required BuildContext context,
  required Size size
}){
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: StatefulBuilder(
          builder: (context, setState) {
            return SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 21),
                height: size.height * 0.3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    const Text(
                      'Logout',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 1,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    const Text(
                      'Are you sure you want to Logout ?',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Text(
                      'Lorem ipsum is a placeholder text commonly used to demonstrate the visual.',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: const Color(0xff5D5D5D),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide(
                                      color: const Color(0xff5D5D5D),
                                      width: 1
                                  )
                              ),
                            ),
                            onPressed: () {
                              AppRouter.instance.pop();
                            },
                            child: const Text(
                              'Not Now',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: size.width*0.03,),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: const Color(0xff5D5D5D),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {
                              AppRouter.instance.pop();
                            },
                            child: const Text(
                              'Yes Logout',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600
                              ),
                            ),
                          ),
                        ),
                      ],
                    )

                  ],
                ),
              ),
            );
          },
        ),
      );
    },
  );
}
Future<dynamic> showConfirmDeleteBottomSheet({
  required BuildContext context,
  required Size size
}){
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: StatefulBuilder(
          builder: (context, setState) {
            return SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 21),
                height: size.height * 0.3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    const Text(
                      'Delete',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 1,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    const Text(
                      'Are you sure you want to Delete ?',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Text(
                      'Lorem ipsum is a placeholder text commonly used to demonstrate the visual.',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: const Color(0xff5D5D5D),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide(
                                      color: const Color(0xff5D5D5D),
                                      width: 1
                                  )
                              ),
                            ),
                            onPressed: () {
                              AppRouter.instance.pop();
                            },
                            child: const Text(
                              'Not Now',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: size.width*0.03,),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: const Color(0xff5D5D5D),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {
                              AppRouter.instance.pop();
                            },
                            child: const Text(
                              'Yes Delete',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600
                              ),
                            ),
                          ),
                        ),
                      ],
                    )

                  ],
                ),
              ),
            );
          },
        ),
      );
    },
  );
}