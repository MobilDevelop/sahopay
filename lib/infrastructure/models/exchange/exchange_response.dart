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
  String message;
  int code;

  ExchangeResponse({
    required this.transId,
    required this.message,
    required this.code,
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

  factory ExchangeResponse.fromJson(Map<String, dynamic> json) =>
      ExchangeResponse(
        transId: json["objectData"]['transId'] ?? -1,
        transDate: json["objectData"]['transDate'] ?? "",
        pc: json["objectData"]['pc'] ?? "",
        amount: json["objectData"]['amount'] ?? 0.0,
        conversionAmount: json["objectData"]['conversionAmount'] ?? 0.0,
        sender: json["objectData"]['sender'] ?? "",
        recipient: json["objectData"]['recipient'] ?? "",
        senderCurrency: json["objectData"]['senderCurrency'] ?? "",
        recipientCurrency: json["objectData"]['recipientCurrency'] ?? "",
        rate: json["objectData"]['rate'] ?? 0.00, 
        code: json['code'], 
        message: json['message'],
      );
}
