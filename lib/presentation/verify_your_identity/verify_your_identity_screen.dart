import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/core/navigation/app_routes.dart';
import 'package:sceneary/core/navigation/routes_path.dart';
import 'package:sceneary/presentation/app_utils/app_widgets.dart';
import 'package:sceneary/presentation/verify_your_identity/verify_your_identity_viewmodel.dart';

class VerifyYourIdentityScreen extends StatelessWidget {
  const VerifyYourIdentityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => VerifyYourIdentityViewmodel(context: context),
      child: Consumer<VerifyYourIdentityViewmodel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Verify your identity',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'To keep Sceneary safe for real film professionals, please record a short video of yourself reading the number shown on the screen.',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF3D3D3D),
                        ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        'Read the number shown below',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: const Color(0xFFEDEDED),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Guidelines',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF454545),
                              ),
                            ),
                            const SizedBox(height: 8),
                            ...viewModel.guidelinesData.map(
                              (e) => Padding(
                                padding: const EdgeInsets.only(
                                  left: 10,
                                  bottom: 6,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 4,
                                      height: 4,
                                      margin: const EdgeInsets.only(top: 6),
                                      decoration: const BoxDecoration(
                                        color: Colors.black,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    const SizedBox(width: 6),
                                    Expanded(
                                      child: Text(
                                        e,
                                        style: const TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      Container(
                        padding: EdgeInsets.all(16),
                        width: double.infinity,
                        height: 482,
                        decoration: BoxDecoration(
                          color: const Color(0xFFD9D9D9),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: viewModel.isVideoStarted
                            ? Align(
                                alignment: AlignmentGeometry.topCenter,
                                child: Text(
                                  '25648',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              )
                            : null,
                      ),
                      const SizedBox(height: 24),
                      viewModel.isVideoStarted
                          ? Row(
                              children: [
                                Expanded(
                                  child: OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadiusGeometry.circular(8),
                                      ),
                                    ),
                                    onPressed: () {
                                      viewModel.retakeVideo();
                                    },
                                    child: const Text(
                                      'Retake',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: primaryButton(
                                    text: 'Submit',
                                    onPressed: () {
                                      AppRouter.instance.goTo(
                                        RoutePaths.dashboardScreen,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            )
                          : primaryButton(
                              text: 'Take Video',
                              onPressed: () {
                                viewModel.startVideo();
                              },
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
