List<DashboardModel> dashboardModelFromMap(List list)=>List<DashboardModel>.from(list.map((json) => DashboardModel.fromJson(json)));

class DashboardModel {
 String account;
 String currencyName;
 String status;
 double hold;
 String logoUrl;
 double balance;

 DashboardModel({
 required this.account,
 required this.currencyName,
 required this.status,
 required this.hold,
 required this.logoUrl,
 required this.balance,
 });

 factory DashboardModel.fromJson(Map<String,dynamic> json)=>DashboardModel(
  account: json['account'], 
  currencyName: json['currencyName'], 
  status: json['accountStatus'], 
  hold: json['hold'], 
  logoUrl: json['logoUrl'], 
  balance: json['balance']);

}