class GetCaptcha{
  String randomId;
  String photoUrl;

  GetCaptcha({required this.photoUrl,required this.randomId});

  factory GetCaptcha.fromJson(Map<String,dynamic> json)=>GetCaptcha(
    photoUrl: json['photoUrl'], 
    randomId: json['randomId']);

}