List<HistoryTransaction> historyTransactionFromMap(List list)=>List<HistoryTransaction>.from(list.map((json) => HistoryTransaction.fromJson(json)));

class HistoryTransaction{
  int id;
  String sender;
  String recipient;
  double commission;
  double commissionAmount;
  String trasactionStatus;
  String comment;
  String date;
  String pc;
  double amount;
  String senderCurrency;
  String recipientCurrency;
  String transactionType;
  String clientId;

  HistoryTransaction({
    required this.id,
    required this.sender,
    required this.recipient,
    required this.commission,
    required this.commissionAmount,
    required this.trasactionStatus,
    required this.comment,
    required this.date,
    required this.pc,
    required this.amount,
    required this.senderCurrency,
    required this.recipientCurrency,
    required this.transactionType,
    required this.clientId,
  });

  factory HistoryTransaction.fromJson(Map<String, dynamic> json) => HistoryTransaction(
        id: json['id']?? -1,
        sender: json['sender'] ?? "",
        recipient: json['recipient'] ?? "",
        transactionType: json['transactionType'] ?? "",
        comment: json['comment'] ?? "",
        date: json['date'] ?? "",
        pc: json['pc'] ?? "",
        amount: json['amount'] ?? 0.0,
        senderCurrency: json['senderCurrency'] ?? "",
        commissionAmount: json['commissionAmount'] ?? 0.0,
        recipientCurrency: json['recipientCurrency'] ?? "",
        commission: json['commission'] ?? 0.0,
        trasactionStatus: json['transactionStatus'] ?? "",
        clientId: json['clientId'] ?? "",
      );


}