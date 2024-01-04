import 'package:sahopay/infrastructure/models/dashboard/dashboard_model.dart';
import 'package:sahopay/presentation/pages/checkPass/checkPass_page.dart';
import 'package:sahopay/presentation/pages/forgotPass/forgotPass_page.dart';
import 'package:sahopay/presentation/pages/registration/registration_page.dart';

import 'index_routes.dart';
import 'package:flutter/material.dart';
import 'package:sahopay/presentation/pages/home/home_page.dart';
import 'package:sahopay/presentation/pages/login/login_page.dart';
import 'package:sahopay/presentation/pages/password/password_page.dart';
import 'package:sahopay/presentation/pages/pin/pin_page.dart';
import 'package:sahopay/presentation/pages/profile/profile_page.dart';
import 'package:sahopay/presentation/pages/setting/setting_page.dart';
import 'package:sahopay/presentation/pages/splash/splash_page.dart';
import 'package:sahopay/presentation/pages/transfer/transfer_page.dart';
import 'package:sahopay/presentation/pages/withdraw/withdraw_page.dart';



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
          child:   TransferPage(model: state.extra as DashboardModel?),
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
        name: Routes.pin.name, 
        path: Routes.pin.path,
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child:   PinPage(type: state.extra as int),
        ),
      ),
      GoRoute(
        name: Routes.withdraw.name, 
        path: Routes.withdraw.path,
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child:   WithdrawPage(model: state.extra as DashboardModel?),
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
       GoRoute(
        name: Routes.registration.name, 
        path: Routes.registration.path,
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child:  const RegistrationPage(),
        ),
      ),
      GoRoute(
        name: Routes.checkPass.name, 
        path: Routes.checkPass.path,
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child:   CheckPassPage(email: state.extra as String),
        ),
      ),
      GoRoute(
        name: Routes.forgotPass.name, 
        path: Routes.forgotPass.path,
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child:   ForgotPassPage(param: state.extra as Map<String,dynamic>),
        ),
      ),
    ],
    errorBuilder: (context, state) => const SizedBox());
