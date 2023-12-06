
List<WalletItem> walletFromMap(List list)=>List<WalletItem>.from(list.map((json) => WalletItem.fromJson(json)));

class WalletItem{
  int id;
  String title;

  WalletItem({required this.id,required this.title});

  factory WalletItem.fromJson(Map<String,dynamic> json)=>WalletItem(
    id: json['id'], 
    title: json['title']);
}