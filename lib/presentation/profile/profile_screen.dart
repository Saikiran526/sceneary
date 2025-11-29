import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sceneary/core/constants/assets_path.dart';
import 'package:sceneary/presentation/app_utils/app_widgets.dart';
import 'package:sceneary/presentation/profile/utils.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final height = MediaQuery.of(context).size.height;
    final width= MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: customAppBar(title: "Profile"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(21.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your Account',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600
                ),
              ),
              SizedBox(height: height*0.02,),
              showProfileItems(icon: SvgPicture.asset(AssetsPath.editProfileImg,), heading: "Edit Profile", size: size),
              SizedBox(height: height*0.01,),
              showProfileItems(icon: SvgPicture.asset(AssetsPath.changePasswordImg), heading: "Change Password", size: size),
              SizedBox(height: height*0.01,),
              showProfileItems(icon: SvgPicture.asset(AssetsPath.twoFactorAuthImg), heading: "Two-Factor Authentication", size: size),
              SizedBox(height: height*0.02,),
              Text(
                'Calender',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600
                ),
              ),
              SizedBox(height: height*0.02,),
              showProfileItems(icon: SvgPicture.asset(AssetsPath.calendarImg), heading: "Update Calender", size: size),
              SizedBox(height: height*0.02,),
              Text(
                'Subscription',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600
                ),
              ),
              SizedBox(height: height*0.02,),
              showProfileItems(icon: SvgPicture.asset(AssetsPath.subscriptionImg), heading: "Subscription Details", size: size),
              SizedBox(height: height*0.02,),
              Text(
                'Policy Center',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600
                ),
              ),
              SizedBox(height: height*0.02,),
              showProfileItems(icon: SvgPicture.asset(AssetsPath.termsAndConditionsImg), heading: "Terms & Conditions", size: size),
              SizedBox(height: height*0.01,),
              showProfileItems(icon: SvgPicture.asset(AssetsPath.privacyPolicyImg), heading: "Privacy Policy", size: size),
              SizedBox(height: height*0.01,),
              showProfileItems(icon: SvgPicture.asset(AssetsPath.refundPolicyImg), heading: "Refund Policy", size: size),
              SizedBox(height: height*0.01,),
              showProfileItems(icon: SvgPicture.asset(AssetsPath.helpAndSupportImg), heading: "Help & Support", size: size),
              SizedBox(height: height*0.01,),
              showProfileItems(icon: SvgPicture.asset(AssetsPath.faqsImg), heading: "FAQs", size: size),
              SizedBox(height: height*0.02,),
              Container(
                color: Colors.grey.shade300,
                height: 1,
                width: width,
              ),
              SizedBox(height: height*0.02,),
              TextButton(
                  onPressed: (){
                    showBottomSlideForStitchingIssueReason(context: context);
                  },
                  child: Text(
                    'Delete Account',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      color: Colors.black
                    ),
                  )
              ),
              TextButton(
                  onPressed: (){
                    showLogoutBottomSheet(context: context, size: size);
                  },
                  child: Text(
                    'Log Out',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.black
                    ),
                  )
              ),

            ],
          ),
        ),
      ),
    );
  }
}
