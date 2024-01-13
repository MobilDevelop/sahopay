class RegistrationSendInfo{
  String answer;
  String email;
  String password;
  String referalCode;
  bool termsAndCantion;
  String captchaRandomId;
  String phoneName;
  String systemVersion;
  String systemName;
  String localizedModel;
  String model;
  String apiKey;
  String deviceId;

  RegistrationSendInfo({
    required this.answer,
    required this.email,
    required this.password,
    required this.referalCode,
    required this.termsAndCantion,
    required this.captchaRandomId,
    required this.phoneName,
    required this.systemVersion,
    required this.apiKey,
    required this.deviceId,
    required this.localizedModel,
    required this.model,
    required this.systemName
  });

  Map<String,dynamic> toJson()=>{
    'answer':answer,
    'email':email,
    'password':password,
    'referralCode':referalCode,
    'termsAndCondition':termsAndCantion,
    'captchaRandomId':captchaRandomId,
    'phoneName':phoneName,
    'systemVersion':systemVersion,
    'apiKey':apiKey,
    'model':model,
    'localizedModel':localizedModel,
    'systemName':systemName,
    'deviceId':deviceId
  };
}