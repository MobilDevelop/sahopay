class TransferCalc {
  int amount;
  int recipientSystemId;
  String senderCurrencyType;
  String comment;
  bool withCommission;

  TransferCalc({
    required this.amount,
    required this.recipientSystemId,
    required this.senderCurrencyType,
    required this.comment,
    required this.withCommission,
  });

  Map<String,dynamic> toJson()=>{
    "amount":amount,
    "recipientSystemId":recipientSystemId,
    "senderCurrencyType":senderCurrencyType,
    "comment":comment,
    "withCommission":withCommission,
 };
}