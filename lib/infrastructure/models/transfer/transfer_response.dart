class TransferResponse {
  int transId;
  String transDate;
  String pc;
  int amount;
  String sender;
  String recipient;
  String senderCurrency;
  String recipientCurrency;
  int code;
  String message;

  TransferResponse({
    required this.code,
    required this.message,
    required this.transId,
    required this.transDate,
    required this.pc,
    required this.amount,
    required this.sender,
    required this.recipient,
    required this.senderCurrency,
    required this.recipientCurrency,
  });


 factory TransferResponse.fromJson(Map<String, dynamic> json) => json["code"]==200? TransferResponse(
        transId: json['objectData']['transId']?? -1,
        transDate: json['objectData']['transDate'] ?? "",
        pc: json['objectData']['pc'] ?? "",
        amount: json['objectData']['amount'] ?? -1,
        sender: json['objectData']['sender'] ?? "",
        recipient: json['objectData']['recipient'] ?? "",
        senderCurrency: json['objectData']['senderCurrency']??"",
        recipientCurrency: json['objectData']['recipientCurrency']??"", 
        code: json['code'],
        message: json['message']
      ):TransferResponse(code: json['code'], 
      message: json['message'], 
      transId: -1, 
      transDate: "", 
      pc: "", 
      amount: -1, 
      sender: "", 
      recipient: "", 
      senderCurrency: "", 
      recipientCurrency: "");
}