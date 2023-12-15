class ForgotPasswordJson{
  String answer;
  String mail;
  String randomId;

  ForgotPasswordJson({required this.answer,required this.mail,required this.randomId});

  Map<String,dynamic> toJson()=>{
    "answer":answer,
    "mail":mail,
    "captchaRandomId":randomId
  };
}