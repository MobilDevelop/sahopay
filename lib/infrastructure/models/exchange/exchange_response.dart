class ExchangeResponse {
  int transId;
  String transDate;
  String pc;
  double amount;
  double conversionAmount;
  String sender;
  String recipient;
  String senderCurrency;
  String recipientCurrency;
  double rate;

  ExchangeResponse({
    required this.transId,
    required this.transDate,
    required this.pc,
    required this.amount,
    required this.conversionAmount,
    required this.sender,
    required this.recipient,
    required this.senderCurrency,
    required this.recipientCurrency,
    required this.rate,
  });

  Map<String,dynamic> toJson()=>{
    "transId":transId,
    "transDate":transDate,
    "pc":pc,
    "amount":amount,
    "conversionAmount":conversionAmount,
    "sender":sender,
    "recipient":recipient,
    "senderCurrency":senderCurrency,
    "recipientCurrency":recipientCurrency,
    "rate":rate,
 };

  factory ExchangeResponse.fromJson(Map<String, dynamic> json) =>
      ExchangeResponse(
        transId: json['transId'] ?? -1,
        transDate: json['transDate'] ?? "",
        pc: json['pc'] ?? "",
        amount: json['amount'] ?? 0.0,
        conversionAmount: json['conversionAmount'] ?? 0.0,
        sender: json['sender'] ?? "",
        recipient: json['recipient'] ?? "",
        senderCurrency: json['senderCurrency'] ?? "",
        recipientCurrency: json['recipientCurrency'] ?? "",
        rate: json['rate'] ?? 0.00,
      );
}
