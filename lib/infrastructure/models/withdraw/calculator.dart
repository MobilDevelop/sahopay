class WithdrawCalc {
  int amount;
  int recipientSystemId;
  String senderCurrencyType;
  String senderWalletNumber;
  bool withCommission;

  WithdrawCalc({
    required this.amount,
    required this.recipientSystemId,
    required this.senderCurrencyType,
    required this.senderWalletNumber,
    required this.withCommission,
  });

  Map<String,dynamic> toJson()=>{
    "amount":amount,
    "recipientSystemId":recipientSystemId,
    "senderCurrencyType":senderCurrencyType,
    "senderWalletNumber":senderWalletNumber,
    "withCommission":withCommission,
 };
}