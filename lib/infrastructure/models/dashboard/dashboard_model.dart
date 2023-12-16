List<DashboardModel> dashboardModelFromMap(List list)=>List<DashboardModel>.from(list.map((json) => DashboardModel.fromJson(json)));

class DashboardModel {
 String account;
 String currensyName;
 String status;
 double hold;
 String logoUrl;
 double balance;

 DashboardModel({required this.account,required this.currensyName,required this.status,required this.hold,required this.logoUrl,required this.balance});

 factory DashboardModel.fromJson(Map<String,dynamic> json)=>DashboardModel(
  account: json['account'], 
  currensyName: json['currencyName'], 
  status: json['accountStatus'], 
  hold: json['hold'], 
  logoUrl: json['logoUrl'], 
  balance: json['balance']);

}