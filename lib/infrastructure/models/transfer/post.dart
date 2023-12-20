class TransferPost {
  String amount;
  String recipient;
  int recipientSystemId;
  String senderCurrencyName;
  String comment;
  bool withCommission;

  TransferPost({
    required this.amount,
    required this.recipient,
    required this.recipientSystemId,
    required this.senderCurrencyName,
    required this.comment,
    required this.withCommission,
  });

  Map<String,dynamic> toJson()=>{
    "amount":amount,
    "recipient":recipient,
    "recipientSystemId":recipientSystemId,
    "senderCurrencyName":senderCurrencyName,
    "comment":comment,
    "withCommission":withCommission,
 };
}