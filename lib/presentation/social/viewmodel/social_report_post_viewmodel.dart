import 'package:flutter/widgets.dart';
import 'package:sceneary/core/navigation/app_routes.dart';
import 'package:sceneary/core/navigation/routes_path.dart';

class SocialReportPostViewmodel extends ChangeNotifier {
  final BuildContext context;

  SocialReportPostViewmodel({required this.context}) {
    loadReportOptions();
  }

  List<String> reportOptions = [];

  void loadReportOptions() {
    // This can be replaced with API response later
    reportOptions = [
      "I just don't like it",
      "Bullying or unwanted contact",
      "Suicide or self-harm",
      "Violence, hate or exploitation",
      "Selling or promoting restricted items",
      "Nudity or sexual activity",
      "Scam, fraud or spam",
      "False information",
    ];

    notifyListeners();
  }

  void selectReason(String reason) {
    // handle selection / API call
    debugPrint("Selected reason: $reason");
    AppRouter.instance.push(RoutePaths.socialReportSuccessScreen);
  }
}
