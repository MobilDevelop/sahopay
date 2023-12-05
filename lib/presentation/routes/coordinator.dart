
import 'package:flutter/material.dart';
import 'package:sahopay/presentation/pages/home/home_page.dart';
import 'package:sahopay/presentation/pages/setting/setting_page.dart';
import 'package:sahopay/presentation/pages/transfer/transfer_page.dart';
import 'index_routes.dart';


final GoRouter router = GoRouter(
    initialLocation: Routes.home.path,
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
       
      
    ],
    errorBuilder: (context, state) => const SizedBox());
