import 'package:sahopay/infrastructure/models/universal/payment_params.dart';

class Payment {
  int id;
  String systemName;
  String logoUrl;
  String accountStatus;
  String key;
  double commission;
  double maxSumDeposit;
  double minSumDeposit;
  List<PaymentParams> params;

  Payment(
      {required this.id,
      required this.systemName,
      required this.logoUrl,
      required this.accountStatus,
      required this.key,
      required this.commission,
      required this.maxSumDeposit,
      required this.minSumDeposit,
      required this.params,
      }); 
}
