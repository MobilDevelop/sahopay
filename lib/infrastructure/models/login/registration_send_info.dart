class RegistrationSendInfo{
  String answer;
  String email;
  String password;
  String referalCode;
  bool termsAndCantion;
  String captchaRandomId;
  String phoneName;
  String systemVersion;
  String apiKey;

  RegistrationSendInfo({
    required this.answer,
    required this.email,
    required this.password,
    required this.referalCode,
    required this.termsAndCantion,
    required this.captchaRandomId,
    required this.phoneName,
    required this.systemVersion,
    required this.apiKey
  });

  Map<String,dynamic> toJson()=>{
    'answer':answer,
    'email':email,
    'password':password,
    'referralCode':referalCode,
    'termsAndCondition':termsAndCantion,
    'captchaRandomId':captchaRandomId,
    'phone_name':phoneName,
    'system_version':systemVersion,
    'api_key':apiKey
  };
}