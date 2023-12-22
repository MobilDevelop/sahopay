class CalcResponse{
  String comissionAmount;
  String comission;
  String currency;

  CalcResponse({required this.comissionAmount,required this.comission,required this.currency});

  
  factory CalcResponse.fromJson(Map<String,dynamic> json)=>CalcResponse(
    comissionAmount: json['commissionAmount'].toString(), 
    comission: json['commission'].toString(), 
    currency: json['currency'].toString());
}