import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/presentation/call_sheets/widgets/app_button.dart';
import 'package:sceneary/presentation/social/viewmodel/social_notification_viewmodel.dart';

class SocialNotificationScreen extends StatelessWidget {
  const SocialNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SocialNotificationViewmodel(context: context),
      child: Consumer<SocialNotificationViewmodel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            backgroundColor: Color(0XFFEEEEEE),

            appBar: AppBar(
              backgroundColor: Color(0XFFEEEEEE),

              title: Text(
                "Notifications",
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),

            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),

                child: Column(
                  children: List.generate(viewModel.notifications.length, (
                    index,
                  ) {
                    final item = viewModel.notifications[index];
                    final bool isConnect = item['type'] == 'connect';

                    return Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          child: Row(
                            crossAxisAlignment: isConnect
                                ? CrossAxisAlignment.start
                                : CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 24,
                                backgroundImage: AssetImage(item['avatar']),
                              ),

                              const SizedBox(width: 12),

                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      isConnect
                                          ? '"${item['name']}" wants to connect with you.'
                                          : '${item['name']} liked your post',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.montserrat(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),

                                    if (isConnect) ...[
                                      const SizedBox(height: 8),

                                      Row(
                                        children: [
                                          AppButton(
                                            label: "Delete",
                                            onTap: () {},
                                            textColor: Colors.black,
                                            buttonColor: Colors.white,
                                            borderColor: Colors.black,
                                            borderRadius: 12,
                                            height: 27,
                                            width: 80,
                                          ),

                                          const SizedBox(width: 12),

                                          AppButton(
                                            label: "Accept",
                                            onTap: () {},
                                            textColor: Colors.white,
                                            buttonColor: const Color(
                                              0XFF1D55A8,
                                            ),
                                            borderRadius: 12,
                                            height: 27,
                                            width: 80,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ],
                                ),
                              ),

                              if (!isConnect)
                                const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                  size: 24,
                                ),
                            ],
                          ),
                        ),

                        const Divider(
                          height: 1,
                          thickness: 0.6,
                          color: Colors.grey,
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
