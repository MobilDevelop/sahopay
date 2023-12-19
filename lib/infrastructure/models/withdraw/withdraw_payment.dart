import 'package:sahopay/infrastructure/models/universal/payment.dart';
import 'package:sahopay/infrastructure/models/universal/payment_params.dart';

List<WithdrawPayment> withdrawPaymentFromMap(List list) => List<WithdrawPayment>.from(list.map((items) => WithdrawPayment.fromJson(items)));

class WithdrawPayment extends Payment {
  String description;

  WithdrawPayment({
    required this.description,
    required super.id, 
    required super.systemName, 
    required super.logoUrl, 
    required super.accountStatus, 
    required super.key, 
    required super.commission, 
    required super.maxSumDeposit, 
    required super.minSumDeposit, 
    required super.params
  });
    
  

  factory WithdrawPayment.fromJson(Map<String, dynamic> json) => WithdrawPayment(
        id: json['id']?? -1,
        systemName: json['systemName'] ?? "",
        logoUrl: json['logoUrl'] ?? "",
        description: json['description'] ?? "",
        accountStatus: json['accountStatus'],
        key: json['key'],
        commission: json['commission'] ?? 0.00,
        maxSumDeposit: json['maxSumDeposit'] ?? 0.0,
        minSumDeposit: json['minSumDeposit'] ?? 0.0,
        params: paymentParamsFromMap(json['additionalParam'] ?? []),
      );
}