import 'package:flutter/material.dart';
import 'package:sceneary/presentation/add_phase/add_phase_screen.dart';
import 'package:sceneary/presentation/add_shooting_schedule/view/add_shooting_schedule_screen.dart';
import 'package:sceneary/presentation/budget/view/add_budget_screen.dart';
import 'package:sceneary/presentation/budget/view/actuals_screen.dart';
import 'package:sceneary/presentation/budget/view/add_expense_screen.dart';
import 'package:sceneary/presentation/budget/view/budget_screen.dart';
import 'package:sceneary/presentation/budget/view/budget_tab_screen.dart';
import 'package:sceneary/presentation/budget/view/budget_version_screen.dart';
import 'package:sceneary/presentation/budget/view/document_detail_form_screen.dart';
import 'package:sceneary/presentation/budget/view/document_detail_screen.dart';
import 'package:sceneary/presentation/budget/view/documents_screen.dart';
import 'package:sceneary/presentation/budget/view/edit_budget_screen.dart';
import 'package:sceneary/presentation/calender/calender_screen.dart';
import 'package:sceneary/presentation/call_sheets/view/call_sheet_preview_screen.dart';
import 'package:sceneary/presentation/call_sheets/view/call_sheet_screen.dart';
import 'package:sceneary/presentation/call_sheets/view/call_sheet_table_screen.dart';
import 'package:sceneary/presentation/call_sheets/view/create_call_sheet_check_availability_screen.dart';
import 'package:sceneary/presentation/call_sheets/view/create_call_sheet_screen.dart';
import 'package:sceneary/presentation/call_sheets/view/edit_call_sheet_screen.dart';
import 'package:sceneary/presentation/call_sheets/view/notification_screen.dart';
import 'package:sceneary/presentation/budget/view/select_date_filter_screen.dart';

import 'package:sceneary/presentation/create_task/create_task_screen.dart';
import 'package:sceneary/presentation/dashboard/dashboard_screen.dart';
import 'package:sceneary/presentation/calender_month_plan/calender_month_plan_screen.dart';
import 'package:sceneary/presentation/edit_phase/edit_phase_screen.dart';
import 'package:sceneary/presentation/edit_scenic_order_entry/edit_scenic_order_entry_screen.dart';
import 'package:sceneary/presentation/extent_phase_date/extent_phase_date_screen.dart';
import 'package:sceneary/presentation/group_chat/view/chat_screen.dart';
import 'package:sceneary/core/navigation/routes_path.dart';
import 'package:sceneary/presentation/basic_information/view/basic_information_pageview.dart';
import 'package:sceneary/presentation/cast_and_crew/view/add_member_screen.dart';
import 'package:sceneary/presentation/cast_and_crew/view/cast_and_crew_screen.dart';
import 'package:sceneary/presentation/cast_and_crew/view/cast_and_crew_availability_screen.dart';
import 'package:sceneary/presentation/chang_password/change_password_screen.dart';
import 'package:sceneary/presentation/edit_profile/edit_profile_screen.dart';
import 'package:sceneary/presentation/cast_and_crew/view/edit_member_screen.dart';
import 'package:sceneary/presentation/enter_otp/enter_otp_screen.dart';
import 'package:sceneary/presentation/enter_scenic_order_template_details/enter_scenic_order_template_details_screen.dart';
import 'package:sceneary/presentation/faqs/faqs_screen.dart';
import 'package:sceneary/presentation/group_chat/view/group_chat_history_screen.dart';
import 'package:sceneary/presentation/help_and_support/help_and_support_screen.dart';
import 'package:sceneary/presentation/group_chat/view/individual_chat_screen.dart';
import 'package:sceneary/presentation/messages/view/message_request_screen.dart';
import 'package:sceneary/presentation/messages/view/messages_individual_chat_screen.dart';
import 'package:sceneary/presentation/mobile_number/mobile_number_screen.dart';
import 'package:sceneary/presentation/create_project/create_project_screen.dart';
import 'package:sceneary/presentation/notifications/notifications_screen.dart';
import 'package:sceneary/presentation/pre_production/pre_production_screen.dart';
import 'package:sceneary/presentation/preview_scenic_order_template_details/preview_scenic_order_template_details_screen.dart';
import 'package:sceneary/presentation/privacy_policy/privacy_policy_screen.dart';
import 'package:sceneary/presentation/profile_details/profile_details_screen.dart';
import 'package:sceneary/presentation/project_plan/project_plan_screen.dart';
import 'package:sceneary/presentation/project_plan_add_phase/project_plan_add_phase_screen.dart';
import 'package:sceneary/presentation/refund_policy/refund_policy_screen.dart';
import 'package:sceneary/presentation/scenic_order/scenic_order_screen.dart';
import 'package:sceneary/presentation/scenic_order_template_details/scenic_order_template_details_screen.dart';
import 'package:sceneary/presentation/scenic_order_template_list/scenic_order_template_list_screen.dart';
import 'package:sceneary/presentation/script_discussion/script_discussion_screen.dart';
import 'package:sceneary/presentation/shooting_schedule/shooting_schedule_screen.dart';
import 'package:sceneary/presentation/social/view/add_post_screen.dart';
import 'package:sceneary/presentation/social/view/messages_screen.dart';
import 'package:sceneary/presentation/social/view/social_chat_screen.dart';
import 'package:sceneary/presentation/social/view/social_message_requests_screen.dart';
import 'package:sceneary/presentation/social/view/social_notification_screen.dart';
import 'package:sceneary/presentation/social/view/social_report_post_screen.dart';
import 'package:sceneary/presentation/social/view/social_report_success_screen.dart';
import 'package:sceneary/presentation/social/view/social_screen.dart';
import 'package:sceneary/presentation/social/view/social_search_screen.dart';
import 'package:sceneary/presentation/social/view/view_profile_screen.dart';
import 'package:sceneary/presentation/subscription_planes/subscription_planes_screen.dart';
import 'package:sceneary/presentation/terms_and_conditions/terms_and_conditions_screen.dart';
import 'package:sceneary/presentation/two_factor_authentication/two_factor_authentication_screen.dart';
import 'package:sceneary/presentation/project_settings/view/project_settings_screen.dart';
import 'package:sceneary/presentation/verify_your_identity/verify_your_identity_screen.dart';
import 'package:sceneary/presentation/project_details/project_details_screen.dart';
import 'package:sceneary/presentation/view_chart_view_project_plan/view_chart_view_screen.dart';

class AppRouter {
  // Singleton
  AppRouter._();
  static final AppRouter instance = AppRouter._();

  // Global Navigator Key
  final GlobalKey<NavigatorState> _navKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> get navKey => _navKey;

  // Route Builders (String → Widget)
  static final Map<String, Widget Function()> _builders = {
    // Dashboard
    RoutePaths.dashboardScreen: () => DashboardScreen(),
    // Home
    RoutePaths.profileDetailsScreen: () => const ProfileDetailsScreen(),
    // Projects
    RoutePaths.createProjectScreen: () => const CreateProjectScreen(),
    RoutePaths.projectDetailsScreen: () => const ProjectDetailsScreen(),
    // Profile
    RoutePaths.editProfileScreen: () => const EditProfileScreen(),
    RoutePaths.changePasswordScreen: () => const ChangePasswordScreen(),
    RoutePaths.twoFactorAuthenticationScreen: () =>
        const TwoFactorAuthenticationScreen(),
    RoutePaths.subscriptionPlanesScreen: () => const SubscriptionPlanesScreen(),
    RoutePaths.termsAndConditionsScreen: () => const TermsAndConditionsScreen(),
    RoutePaths.privacyPolicyScreen: () => const PrivacyPolicyScreen(),
    RoutePaths.refundPolicyScreen: () => const RefundPolicyScreen(),
    RoutePaths.helpAndSupportScreen: () => const HelpAndSupportScreen(),
    RoutePaths.faqsScreen: () => const FaqsScreen(),
    // Scenic order
    RoutePaths.scenicOrderScreen: () => ScenicOrderScreen(),
    RoutePaths.scenicOrderTemplateListScreen: () =>
        ScenicOrderTemplateListScreen(),
    RoutePaths.scenicOrderTemplateDetailsScreen: () =>
        ScenicOrderTemplateDetailsScreen(),
    RoutePaths.enterScenicOrderTemplateDetailsScreen: () =>
        EnterScenicOrderTemplateDetailsScreen(),
    RoutePaths.previewScenicOrderTemplateDetailsScreen: () =>
        PreviewScenicOrderTemplateDetailsScreen(),
    RoutePaths.editScenicOrderEntryScreen: () => EditScenicOrderEntryScreen(),
    // Shooting Schedules
    RoutePaths.shootingScheduleScreen: () => ShootingScheduleScreen(),
    RoutePaths.addShootingScheduleScreen: () => AddShootingScheduleScreen(),

    //muni
    RoutePaths.basicInformationPageview: () => const BasicInformationPageview(),
    RoutePaths.mobileNumberScreen: () => const MobileNumberScreen(),
    RoutePaths.enterOtpScreen: () => const EnterOtpScreen(),
    RoutePaths.verifyYourIdentityScreen: () => const VerifyYourIdentityScreen(),
    RoutePaths.castAndCrewScreen: () => const CastAndCrewScreen(),
    RoutePaths.editMemberScreen: () => const EditMemberScreen(),
    RoutePaths.addMemberScreen: () => const AddMemberScreen(),
    RoutePaths.castAndCrewAvailabilityScreen: () =>
        const CastAndCrewAvailabilityScreen(),
    RoutePaths.projectSettingsScreen: () => const ProjectSettingsScreen(),
    RoutePaths.chatScreen: () => const ChatScreen(),
    RoutePaths.groupChatHistoryScreen: () => const GroupChatHistoryScreen(),
    RoutePaths.individualChatScreen: () => const IndividualChatScreen(),
    RoutePaths.messagesIndividualChatScreen: () =>
        const MessagesIndividualChatScreen(),
    RoutePaths.messageRequestScreen: () => const MessageRequestScreen(),
    RoutePaths.notificationsScreen: () => const NotificationsScreen(),
    RoutePaths.calenderScreen: () => const CalenderScreen(),
    RoutePaths.calenderMonthPlanScreen: () => const CalenderMonthPlanScreen(),

    RoutePaths.projectPlanScreen: () => const ProjectPlanScreen(),
    RoutePaths.addPhaseScreen: () => const AddPhaseScreen(),
    RoutePaths.projectPlanAddPhaseScreen: () =>
        const ProjectPlanAddPhaseScreen(),
    RoutePaths.preProductionScreen: () => const PreProductionScreen(),
    RoutePaths.editPhaseScreen: () => const EditPhaseScreen(),
    RoutePaths.createTaskScreen: () => const CreateTaskScreen(),
    RoutePaths.scriptDiscussionScreen: () => const ScriptDiscussionScreen(),
    RoutePaths.extentPhaseDateScreen: () => const ExtentPhaseDateScreen(),
    RoutePaths.viewChartViewScreen: () => const ViewChartViewScreen(),

    //upendar
    RoutePaths.callSheetScreen: () => const CallSheetScreen(),
    RoutePaths.createCallSheetScreen: () => const CreateCallSheetScreen(),
    RoutePaths.createCallSheetCheckAvailabilityScreen: () =>
        const CreateCallSheetCheckAvailabilityScreen(),
    RoutePaths.editCallSheetScreen: () => const EditCallSheetScreen(),
    RoutePaths.callSheetTableSceen: () => const CallSheetTableScreen(),
    RoutePaths.budgetScreen: () => const BudgetScreen(),
    RoutePaths.addBudgetScreen: () => const AddBudgetScreen(),
    RoutePaths.budgetTabScreen: () => const BudgetTabScreen(),
    RoutePaths.documentsScreen: () => const DocumentsScreen(),
    RoutePaths.documentDetailScreen: () => const DocumentDetailScreen(),
    RoutePaths.documentDetailFormScreen: () => const DocumentDetailFormScreen(),
    RoutePaths.budgetVersionScreen: () => const BudgetVersionScreen(),
    RoutePaths.editBudgetScreen: () => const EditBudgetScreen(),
    RoutePaths.actualsScreen: () => const ActualsScreen(),
    RoutePaths.addExpenseScreen: () => const AddExpenseScreen(),
    RoutePaths.callSheetPreviewScreen: () => const CallSheetPreviewScreen(),
    RoutePaths.notificationScreen: () => const NotificationScreen(),
    RoutePaths.selectDateFilterScreen: () => const SelectDateFilterScreen(),
    RoutePaths.socialScreen: () => const SocialScreen(),
    RoutePaths.addPostScreen: () => const AddPostScreen(),
    RoutePaths.viewProfileScreen: () => const ViewProfileScreen(),
    RoutePaths.socialMessagesScreen: () => const SocialMessagesScreen(),
    RoutePaths.socialMessageRequestsScreen: () =>
        const SocialMessageRequestsScreen(),
    RoutePaths.socialSearchScreen: () => const SocialSearchScreen(),
    RoutePaths.socialNotificationsScreen: () =>
        const SocialNotificationScreen(),
    RoutePaths.socialReportPostScreen: () => const SocialReportPostScreen(),
    RoutePaths.socialReportSuccessScreen: () =>
        const SocialReportSuccessScreen(),
        RoutePaths.socialChatScreen:()=> const SocialChatScreen(),
  };

  // Route Generator
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final builder = _builders[settings.name];
    if (builder == null) return _error(settings.name);
    return _slide(builder(), settings);
  }

  // Slide Transition
  PageRouteBuilder _slide(Widget page, RouteSettings settings) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (_, __, ___) => page,
      transitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (_, animation, __, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        final tween = Tween(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: Curves.easeInOut));
        return SlideTransition(position: animation.drive(tween), child: child);
      },
    );
  }

  // Error Screen
  Route<dynamic> _error(String? name) => MaterialPageRoute(
    builder: (_) => Scaffold(
      appBar: AppBar(title: const Text('Error')),
      body: Center(
        child: Text(
          'Route not found: "$name"',
          style: const TextStyle(color: Colors.red, fontSize: 16),
        ),
      ),
    ),
  );

  // NAVIGATION HELPERS (Enhanced)

  /// Push a route (optionally with arguments)
  Future<T?> push<T extends Object?>(String routePath, {Object? arguments}) {
    final builder = _builders[routePath];
    if (builder == null) throw ArgumentError('No route: $routePath');
    final route = _slide(
      builder(),
      RouteSettings(name: routePath, arguments: arguments),
    );
    return _navKey.currentState!.push(route) as Future<T?>;
  }

  /// Push a widget directly (optionally with arguments)
  Future<T?> pushWidget<T extends Object?>(Widget page, {Object? arguments}) {
    return _navKey.currentState!.push(
          _slide(page, RouteSettings(arguments: arguments)),
        )
        as Future<T?>;
  }

  /// Replace the current screen (optionally with arguments)
  Future<T?> replace<T extends Object?>(String routePath, {Object? arguments}) {
    final builder = _builders[routePath];
    if (builder == null) throw ArgumentError('No route: $routePath');
    final route = _slide(
      builder(),
      RouteSettings(name: routePath, arguments: arguments),
    );
    return _navKey.currentState!.pushReplacement(route) as Future<T?>;
  }

  /// Clear stack and go to a new route (optionally with arguments)
  Future<T?> goTo<T extends Object?>(String routePath, {Object? arguments}) {
    final builder = _builders[routePath];
    if (builder == null) throw ArgumentError('No route: $routePath');
    final route = _slide(
      builder(),
      RouteSettings(name: routePath, arguments: arguments),
    );
    return _navKey.currentState!.pushAndRemoveUntil(route, (_) => false)
        as Future<T?>;
  }

  /// Pop current screen
  void pop<T extends Object?>([T? result]) => _navKey.currentState!.pop(result);

  /// Pop until routePath
  void popUntil(String routePath) => _navKey.currentState!.popUntil(
    (route) => route.settings.name == routePath,
  );

  /// Check if can pop
  bool get canPop => _navKey.currentState!.canPop();
}
