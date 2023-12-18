import 'package:sahopay/infrastructure/models/universal/payment.dart';
import 'package:sahopay/infrastructure/models/universal/payment_params.dart';

List<DepositItems> withdrawItemsFromMap(List list) => List<DepositItems>.from(list.map((items) => DepositItems.fromJson(items)));

class DepositItems extends Payment {
  String clientId;

  DepositItems({
      required super.id,
      required this.clientId,
      required super.systemName,
      required super.logoUrl,
      required super.saldoPrefix,
      required super.accountStatus,
      required super.key,
      required super.commission,
      required super.maxSumDeposit,
      required super.minSumDeposit,
      required super.params,
  });

  factory DepositItems.fromJson(Map<String, dynamic> json) => DepositItems(
        id: json['id'],
        clientId: json['cleintId'],
        systemName: json['systemName'] ?? "",
        logoUrl: json['logoUrl'],
        saldoPrefix: json['saldoPrefix'] ?? '',
        accountStatus: json['accountStatus'],
        key: json['key'],
        commission: json['commission'],
        maxSumDeposit: json['maxSumDeposit'],
        minSumDeposit: json['minSumDeposit'],
        params: paymentParamsFromMap(json['additionalParam']),
       
      
      );
}