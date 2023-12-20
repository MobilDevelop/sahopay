class ExchangeCall {
  String currencyKey;
  String senderAmount;

  ExchangeCall({
    required this.currencyKey,
    required this.senderAmount,

  });

  Map<String,dynamic> toJson()=>{
    "currencyKey":currencyKey,
    "senderAmount":senderAmount,
 };
}
