class RegistrationSendInfo{
  String answer;
  String email;
  String password;
  String referalCode;
  bool termsAndCantion;
  String captchaRandomId;

  RegistrationSendInfo({
    required this.answer,
    required this.email,
    required this.password,
    required this.referalCode,
    required this.termsAndCantion,
    required this.captchaRandomId
  });

  Map<String,dynamic> toJson()=>{
    'answer':answer,
    'email':email,
    'password':password,
    'referralCode':referalCode,
    'termsAndCondition':termsAndCantion,
    'captchaRandomId':captchaRandomId
  };
}