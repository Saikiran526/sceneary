import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/presentation/app_utils/app_widgets.dart';
import 'package:sceneary/presentation/chang_password/change_password_viewmodel.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final height = MediaQuery.of(context).size.height;
    // final width= MediaQuery.of(context).size.width;


    return Scaffold(
      appBar: customAppBar(title: 'Change Password'),
      body: ChangeNotifierProvider(
          create: (_)=>ChangePasswordViewmodel(),
        child: Consumer<ChangePasswordViewmodel>(
            builder: (context,viewModel,child){
              return Padding(
                padding: const EdgeInsets.all(21.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: height*0.02),
                    customTextFieldWithHeading(size: size,
                        heading: 'Your Current Password',
                        hintText: 'Actor@12345',
                        controller: viewModel.currentPassword,
                        maxLines: 1,
                        readOnly: false
                    ),
                    SizedBox(height: height*0.02),
                    customTextFieldWithHeading(size: size,
                        heading: 'New Password',
                        hintText: 'Enter new password',
                        controller: viewModel.newPassword,
                        maxLines: 1,
                        readOnly: false
                    ),
                    SizedBox(height: height*0.02),
                    customTextFieldWithHeading(size: size,
                        heading: 'Re-type Password',
                        hintText: 'Re-enter password',
                        controller: viewModel.reTypePassword,
                        maxLines: 1,
                        readOnly: false
                    ),
                    TextButton(
                        onPressed: (){},
                        child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        color: Colors.black
                      ),
                    )
                    ),
                    SizedBox(height: height*0.01),
                    primaryButton(text: 'Change Password', onPressed: (){})
                  ],
                ),
              );
            }
        ),
      ),
    );
  }
}
