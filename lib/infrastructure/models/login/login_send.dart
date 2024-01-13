class LoginSend{
  String username;
  String password;
  String phoneName;
  String systemVersion;
  String apiKey;
  String model;
  String localizedModel;
  String systemName;
  String deviceId;

  LoginSend(
    {
    required this.phoneName,
    required this.systemVersion,
    required this.apiKey,
    required this.model,
    required this.localizedModel,
    required this.systemName,
    required this.deviceId,
    required this.username,
    required this.password});

 Map<String,dynamic> toJson()=>{
    "username":username,
    "password":password,
    'phoneName':phoneName,
    'systemVersion':systemVersion,
    'apiKey':apiKey,
    'model':model,
    'localizedModel':localizedModel,
    'systemName':systemName,
    'deviceId':deviceId
 };
}