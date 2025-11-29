import 'package:flutter/material.dart';
import 'package:sceneary/core/navigation/routes_path.dart';
import 'package:sceneary/presentation/basic_information/view/basic_information_pageview.dart';
import 'package:sceneary/presentation/cast_add_member/add_member_screen.dart';
import 'package:sceneary/presentation/cast_and_crew/cast_and_crew_screen.dart';
import 'package:sceneary/presentation/cast_edit_member/edit_member_screen.dart';
import 'package:sceneary/presentation/enter_otp/enter_otp_screen.dart';
import 'package:sceneary/presentation/mobile_number/mobile_number_screen.dart';
import 'package:sceneary/presentation/create_project/create_project_screen.dart';
import 'package:sceneary/presentation/profile_details/profile_details_screen.dart';
import 'package:sceneary/presentation/project_settings/view/project_settings_screen.dart';
import 'package:sceneary/presentation/verify_your_identity/verify_your_identity_screen.dart';
import 'package:sceneary/presentation/project_details/project_details_screen.dart';

class AppRouter {
  // Singleton
  AppRouter._();
  static final AppRouter instance = AppRouter._();

  // Global Navigator Key
  final GlobalKey<NavigatorState> _navKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> get navKey => _navKey;

  // Route Builders (String → Widget)
  static final Map<String, Widget Function()> _builders = {
    RoutePaths.profileDetailsScreen: () => const ProfileDetailsScreen(),
    RoutePaths.createProjectScreen: () => const CreateProjectScreen(),
    RoutePaths.projectDetailsScreen: () => const ProjectDetailsScreen(),

    //muni
    RoutePaths.basicInformationPageview: () => const BasicInformationPageview(),
    RoutePaths.mobileNumberScreen: () => const MobileNumberScreen(),
    RoutePaths.enterOtpScreen: () => const EnterOtpScreen(),
    RoutePaths.verifyYourIdentityScreen: () => const VerifyYourIdentityScreen(),
    RoutePaths.castAndCrewScreen: () => const CastAndCrewScreen(),
    RoutePaths.editMemberScreen: () => const EditMemberScreen(),
    RoutePaths.addMemberScreen: () => const AddMemberScreen(),
    RoutePaths.projectSettingsScreen: () => const ProjectSettingsScreen(),
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
