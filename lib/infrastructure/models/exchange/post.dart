
class ExchangePost {
  String currencyKey;
  String senderAmount;
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