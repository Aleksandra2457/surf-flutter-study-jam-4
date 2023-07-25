import 'package:go_router/go_router.dart';
import '../../feature_magic_ball_prediction/presentation/magic_ball_screen/magic_ball_screen.dart';
import '../../feature_magic_ball_settings/presentation/magic_ball_settings_screen.dart';

/// Описание всех маршрутов (экранов приложения).
final goRouter = GoRouter(routes: [
  GoRoute(
      path: '/',
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: MagicBallScreen())),
  GoRoute(
      path: '/settings',
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: MagicBallSettingsScreen())),
]);
