import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sahopay/presentation/assets/res/app_icons.dart';

class AppContatants{

  static String addition = dotenv.env['addition']!;//test

  static String imageUrl = dotenv.env['imageUrl']!;//test
   
  static String registration = '${addition}register';
  static String captcha = '${addition}get-temp-captcha';
  static String succesCode = '${addition}mobile-activate';
  static String login = '${addition}auth-mail';
  static String forgotPassword = '${addition}account/reset-password/init';
  static String newPassword = '${addition}account/reset-password/finish';
  static String dashboard = '${addition}get-all-wallet/andBalance';


  static String appVersion = '1.2.2';

  static int duration = 200;
  
  static List<String> backgroundImages=[
    AppIcons.card,
    AppIcons.card1,
    AppIcons.card2,
    AppIcons.card3,
    AppIcons.card5,
    AppIcons.card6,
    AppIcons.card7,
    AppIcons.card8,
    AppIcons.card9,
    AppIcons.card10,
    AppIcons.card11,
    AppIcons.card12, 
    AppIcons.card13,
    AppIcons.card14,
  ];
}