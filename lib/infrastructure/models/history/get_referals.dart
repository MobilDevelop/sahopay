List<HistoryReferals> historyReferalsFromMap(List list)=>List<HistoryReferals>.from(list.map((json) => HistoryReferals.fromJson(json)));

class HistoryReferals{
  String referralUserId;
  String userId;
  String referaldate;

  HistoryReferals({
    required this.referralUserId,
    required this.userId,
    required this.referaldate,
  });

  factory HistoryReferals.fromJson(Map<String, dynamic> json) => HistoryReferals(
        userId: json['userId'] ?? "",
        referralUserId: json['referralUserId'] ?? "",
        referaldate: json['referralDate'] ?? "",
      );
}