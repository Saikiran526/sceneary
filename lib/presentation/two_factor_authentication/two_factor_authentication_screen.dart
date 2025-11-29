import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/presentation/app_utils/app_widgets.dart';
import 'package:sceneary/presentation/two_factor_authentication/two_factor_authentication_viewmodel.dart';

class TwoFactorAuthenticationScreen extends StatelessWidget {
  const TwoFactorAuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final height= MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: customAppBar(title: 'Two-Factor Authentication'),
      body: ChangeNotifierProvider(
          create: (_)=> TwoFactorAuthenticationViewmodel(),
        child: Consumer<TwoFactorAuthenticationViewmodel>(
            builder: (context,viewModel,child){
              return Padding(
                padding: const EdgeInsets.all(21.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Help to protect your account',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    SizedBox(height: height*0.02,),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(26),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(21.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Authentication app',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                  child: Radio(
                                    value: 'inApp',
                                    groupValue: viewModel.selectedOption,
                                    onChanged: (value) {
                                      viewModel.setSelectedOption=value!;
                                    },
                                  ),
                                )

                              ],
                            ),
                            Text(
                              'Lorem Ipsum is simply dummy text ',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400
                              ),
                            ),
                            SizedBox(height: height*0.02,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'SMS or WhatsApp',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                  child: Radio(
                                    value: 'sms',
                                    groupValue: viewModel.selectedOption,
                                    onChanged: (value) {
                                      viewModel.setSelectedOption=value!;
                                    },
                                  ),
                                )

                              ],
                            ),
                            Text(
                              'Lorem Ipsum is simply dummy text ',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: height*0.03,),
                    primaryButton(text: 'Next', onPressed: (){})
                    
                  ],
                ),
              );
            }
        ),
      ),
    );
  }
}
