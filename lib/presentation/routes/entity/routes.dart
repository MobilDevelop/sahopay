import 'coordinate.dart';

/// A set of routes for the entire app.
class Routes implements Coordinate {
  const Routes._({
    required this.name,
    required this.path,
  });

  final String name;
  final String path;

  static const home = Routes._(
    name: 'home_page',
    path: '/home',
  );
   static const splash = Routes._(
    name: 'splash_page',
    path: '/splash',
  );
   static const login = Routes._(
    name: 'login_page',
    path: '/login',
  );
  static const pin = Routes._(
    name: 'pin_page',
    path: '/pin',
  );
   static const transfer = Routes._(
    name: 'transfer_page',
    path: '/transfer',
  );
   static const setting = Routes._(
    name: 'setting_page',
    path: '/setting',
  );
  static const withdraw = Routes._(
    name: 'withdraw_page',
    path: '/withdraw',
  );
  static const profile = Routes._(
    name: 'profile_page',
    path: '/profile',
  );
  static const password = Routes._(
    name: 'password_page',
    path: '/password',
  );
  

  @override
  String toString() => 'name=$name, path=$path';
}
