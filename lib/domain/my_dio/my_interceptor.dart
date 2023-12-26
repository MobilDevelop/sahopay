// ignore_for_file: deprecated_member_use
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sahopay/domain/provider/registration.dart';
import 'package:sahopay/infrastructure/local_source/local_source.dart';

class MyInterceptor extends Interceptor{
  
  MyInterceptor();

  @override
  void onError(DioError err, ErrorInterceptorHandler handler)async{
      if (err.response?.statusCode == 401) {
      LocalSource.clearProfile();

    String json = await  LocalSource.getInfo(key: "loginParam");

    if(json.isNotEmpty){
      Map<String,dynamic> param = jsonDecode(json);
     await RegistrationServices().login(param);

     EasyLoading.showInfo(tr('universal.error'));
    }
      
    }
    super.onError(err, handler);
  }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers['Content-Type'] = 'application/json';
    options.headers['Accept'] = 'application/json'; 
    options.headers['Origin'] = 'https://sahopay.com'; 
    options.headers['Authorization'] = await LocalSource.getInfo(key: 'token');
    options.baseUrl = dotenv.env['mainUrl']!;
    super.onRequest(options, handler);
  }
}