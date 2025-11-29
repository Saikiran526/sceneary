import 'package:flutter/material.dart';
import 'package:sceneary/presentation/app_utils/app_widgets.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'Privacy Policy'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(21.0),
          child: RichText(
            text: TextSpan(
                text: 'Your privacy is important to us. It is Brainstormings policy to respect your privacy regarding any information we may collect from you across our',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff959595)
                ),
                children: [
                  TextSpan(
                    text: ' website',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff3E3E3E)
                    ),
                  ),
                  TextSpan(
                    text: ', and other sites we own and operate.',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff959595)
                    ),
                  ),
                  TextSpan(
                    text: '\n\nWe only ask for personal information when we truly need it to provide a service to you. We collect it by fair and lawful means, with your knowledge and consent. We also let you know why we’re collecting it and how it will be used.',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff959595)
                    ),
                  ),
                  TextSpan(
                    text: '\n\nWe only retain collected information for as long as necessary to provide you with your requested service.',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff959595)
                    ),
                  ),
                ]
            ),
          ),
        ),
      ),
    );
  }
}


