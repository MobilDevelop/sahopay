import 'dart:math' as math;
import 'package:easy_localization/easy_localization.dart';

class Helper{
  static int randomNumber(){
      math.Random rng = math.Random();
      return rng.nextInt(17);
  }

  static String dateFormat(DateTime? date){
      return date==null?"": DateFormat('yyyy-MM-dd').format(date);
  }

  static String timeFormat(String date){
    DateTime parseDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(date);
    DateTime inputDate = DateTime.parse(parseDate.toString());  
    DateFormat outputFormat = DateFormat('hh:mm');
    String outputDate = outputFormat.format(inputDate);
    return outputDate;
  }

   static String dateTimeFormat(String date){
    DateTime parseDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(date);
    DateTime inputDate = DateTime.parse(parseDate.toString());  
    DateFormat outputFormat = DateFormat('yyyy-MM-dd  hh:mm:ss');
    String outputDate = outputFormat.format(inputDate);
    return outputDate;
  }


  static bool isEmail(String em) {

  String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = RegExp(p);

  return !regExp.hasMatch(em);
}


  static String toProcessCost(String value) {
    if (value == '0') {
      return '0';
    }

    String valueRealPart = '';
    String number = "";
    if (value.indexOf('.') > 0) {
      valueRealPart = value.substring(value.indexOf('.'), value.length);
      value = value.substring(0, value.indexOf('.'));
    }
    String count = '';
    if (value.length > 3) {
      int a = 0;
      for (int i = value.length; 0 < i; i--) {
        if (a % 3 == 0) {
          count = '${value.substring(i - 1, i)} $count';
        } else {
          count = value.substring(i - 1, i) + count;
        }
        a++;
      }
    } else {
      count = value;
    }
    return count;
  }

 

}