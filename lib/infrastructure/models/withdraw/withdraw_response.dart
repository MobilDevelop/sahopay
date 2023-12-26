class WithdrawResponse {
  String transactionStatus;
  String pc;
  String sender;
  String recipient;
  double amount;
  double commission;
  String message;
  int code;

  WithdrawResponse({
    required this.transactionStatus,
    required this.pc,
    required this.sender,
    required this.recipient,
    required this.amount,
    required this.commission,
    required this.message,
    required this.code
  });

  factory WithdrawResponse.fromJson(Map<String, dynamic> json) => WithdrawResponse(
        transactionStatus: json['objectData']['transactionStatus']?? "",
        pc: json['objectData']['pc'] ?? "",
        sender: json['objectData']['sender'] ?? "",
        recipient: json['objectData']['recipient'] ?? "",
        amount: json['objectData']['amount'] ?? -1,
        commission: json['objectData']['commission'] ?? -1,
        message: json['message'],
        code: json['code']
      );
}