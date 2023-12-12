
import 'package:flutter/material.dart';
import 'package:sahopay/presentation/pages/home/home_page.dart';
import 'package:sahopay/presentation/pages/login/login_page.dart';
import 'package:sahopay/presentation/pages/password/password_page.dart';
import 'package:sahopay/presentation/pages/profile/profile_page.dart';
import 'package:sahopay/presentation/pages/setting/setting_page.dart';
import 'package:sahopay/presentation/pages/splash/splash_page.dart';
import 'package:sahopay/presentation/pages/transfer/transfer_page.dart';
import 'package:sahopay/presentation/pages/withdraw/withdraw_page.dart';
import 'index_routes.dart';


final GoRouter router = GoRouter(
    initialLocation: Routes.splash.path,
    debugLogDiagnostics: true,
    routes: <GoRoute>[
      GoRoute(
        name: Routes.home.name, 
        path: Routes.home.path,
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child:  const HomePage(),
        ),
      ),
      GoRoute(
        name: Routes.transfer.name, 
        path: Routes.transfer.path,
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child:  const TransferPage(),
        ),
      ),
      GoRoute(
        name: Routes.setting.name, 
        path: Routes.setting.path,
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child:  const SettingPage(),
        ),
      ),
      GoRoute(
        name: Routes.login.name, 
        path: Routes.login.path,
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child:  const LoginPage(),
        ),
      ),
      GoRoute(
        name: Routes.withdraw.name, 
        path: Routes.withdraw.path,
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child:  const WithdrawPage(),
        ),
      ),
      GoRoute(
        name: Routes.profile.name, 
        path: Routes.profile.path,
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child:  const ProfilePage(),
        ),
      ),
      GoRoute(
        name: Routes.password.name, 
        path: Routes.password.path,
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child:  const PasswordPage(),
        ),
      ),
      GoRoute(
        name: Routes.splash.name, 
        path: Routes.splash.path,
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child:  const SplashPage(),
        ),
      ),
    ],
    errorBuilder: (context, state) => const SizedBox());
