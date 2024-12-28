import 'package:duseca_assignment/src/core/config/app_routes.dart';
import 'package:duseca_assignment/src/features/calendar/presentation/calendar_page.dart';
import 'package:duseca_assignment/src/features/chat/presentation/chat_page.dart';
import 'package:duseca_assignment/src/features/dashboard/presentation/dashboard_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final navigatorKey = GlobalKey<NavigatorState>();

final class AppRouter {
  static final GoRouter router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: AppRoutes.dashboard,
    routes: [
      GoRoute(
        name: AppRoutes.dashboard,
        path: AppRoutes.dashboard,
        builder: (context, state) => const DashboardPage(),
      ),
      GoRoute(
        name: AppRoutes.calendar,
        path: AppRoutes.calendar,
        builder: (context, state) => CalendarPage(),
      ),
      GoRoute(
        name: AppRoutes.chat,
        path: AppRoutes.chat,
        builder: (context, state) => ChatPage(),
      ),
    ],
  );
  void goToDashboard(BuildContext context) =>
      context.goNamed(AppRoutes.dashboard);
}
