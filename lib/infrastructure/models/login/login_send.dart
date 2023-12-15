class LoginSend{
  String username;
  String password;

  LoginSend({required this.username,required this.password});

 Map<String,dynamic> toJson()=>{
  "username":username,
  "password":password
 };
}