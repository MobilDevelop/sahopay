class ExchangeAmount {
  String currencyKey;
  int senderAmount;
  String comment;

  ExchangeAmount({
    required this.currencyKey,
    required this.senderAmount,
    required this.comment,
  });

  Map<String,dynamic> toJson()=>{
    "currencyKey":currencyKey,
    "senderAmount":senderAmount,
    "comment":comment
 };
}

