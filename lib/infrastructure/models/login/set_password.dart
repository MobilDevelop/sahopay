class SetPassword{
  String newPassword;
  String key;

  SetPassword({required this.newPassword,required this.key});

  Map<String,dynamic> toJson()=>{
    "newPassword":newPassword,
    "key":key
  };
}