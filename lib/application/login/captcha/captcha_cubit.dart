import 'package:sahopay/application/login/captcha/captcha_state.dart';
import 'package:sahopay/domain/provider/registration.dart';
import 'package:sahopay/infrastructure/models/login/captcha.dart';
import 'package:sahopay/presentation/pages/login/library/login_library.dart';

class CaptchaCubit extends Cubit<CaptchaState>{
  CaptchaCubit():super(CaptchaInitial()){
    init();
  }

  GetCaptcha? captcha;

  init()async{
       captcha = await RegistrationServices().getCaptcha();
     emit(CaptchaInitial());
  }
}