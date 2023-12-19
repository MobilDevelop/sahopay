
class Transaction {
  String transactionStatus;
  String pc;
  String sender;
  String recipient;
  double amount;
  double commission ;

  Transaction({
    required this.transactionStatus,
    required this.pc,
    required this.sender,
    required this.recipient,
    required this.amount,
    required this.commission,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        transactionStatus: json['transactionStatus']?? "",
        pc: json['pc'] ?? "",
        sender: json['sender'] ?? "",
        recipient: json['recipient'] ?? "",
        amount: json['amount'] ?? -1,
        commission: json['commission'] ?? -1,
      );
}