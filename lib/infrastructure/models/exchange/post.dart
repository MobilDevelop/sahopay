import 'dart:ffi';

class ExchangePost {
  String currencyKey;
  Int senderAmount;
  String comment;


  ExchangePost({
    required this.currencyKey,
    required this.senderAmount,
    required this.comment,
  
  });

  Map<String,dynamic> toJson()=>{
    "currencyKey":currencyKey,
    "senderAmount":senderAmount,
    "comment":comment,
 };
}