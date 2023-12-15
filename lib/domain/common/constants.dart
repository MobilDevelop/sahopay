
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppContatants{

  static String addition = dotenv.env['addition']!;//test
   
  static String registration = '${addition}register';
  static String captcha = '${addition}get-temp-captcha';
  static String succesCode = '${addition}mobile-activate';
  static String login = '${addition}auth-mail';
  static String forgotPassword = '${addition}account/reset-password/init';
  static String newPassword = '${addition}account/reset-password/finish';


  static String appVersion = '1.2.2';

    static int duration = 200;

}