class ServerMessage{
  String message;
  int code;

  ServerMessage({required this.message,required this.code});

  factory ServerMessage.fromJson(Map<String,dynamic> json)=>ServerMessage(
    message: json['message'], 
    code: json['code']);

}