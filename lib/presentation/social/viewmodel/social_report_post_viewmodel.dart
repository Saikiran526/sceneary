import 'package:flutter/widgets.dart';
import 'package:sceneary/core/navigation/app_routes.dart';
import 'package:sceneary/core/navigation/routes_path.dart';

class SocialReportPostViewmodel extends ChangeNotifier {
  final BuildContext context;

  SocialReportPostViewmodel({required this.context}) {
    loadReportOptions();
  }

  List<String> reportOptions = [];

  bool showOtherField = false;
  final TextEditingController otherController = TextEditingController();

  void loadReportOptions() {
    reportOptions = [
      "I just don't like it",
      "Bullying or unwanted contact",
      "Suicide or self-harm",
      "Violence, hate or exploitation",
      "Selling or promoting restricted items",
      "Nudity or sexual activity",
      "Scam, fraud or spam",
      "False information",
      "Other",
    ];
    notifyListeners();
  }

  void selectReason(String reason) {
    if (reason == "Other") {
      showOtherField = true;
      notifyListeners();
    } else {
      AppRouter.instance.push(RoutePaths.socialReportSuccessScreen);
    }
  }

  void submitOtherReason() {
    if (otherController.text.trim().isEmpty) return;

    AppRouter.instance.push(RoutePaths.socialReportSuccessScreen);
  }

  @override
  void dispose() {
    otherController.dispose();
    super.dispose();
  }
}
