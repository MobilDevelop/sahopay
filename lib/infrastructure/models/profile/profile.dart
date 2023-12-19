// List<ProfileModel> dashboardModelFromMap(List list)=>List<ProfileModel>.from(list.map((json) => ProfileModel.fromJson(json)));

class ProfileModel {
 int id;
 String firstName;
 String lastName;
 String email;
 String imageUrl;
 bool activated;
 String langKey;
 String createdBy;
 String createdDate;
 String lastModifiedBy;
 String lastModifiedDate;
 String authorities;
 String clientId;


 ProfileModel({
  required this.id,
  required this.firstName,
  required this.lastName,
  required this.email,
  required this.imageUrl,
  required this.activated,
  required this.langKey,
  required this.createdBy,
  required this.createdDate,
  required this.lastModifiedBy,
  required this.lastModifiedDate,
  required this.authorities,
  required this.clientId,
  });

//  factory ProfileModel.fromJson(Map<String,dynamic> json)=>ProfileModel(
//   email: json['email'], 
//   firstName: json['firstName'], 
//   lastName: json['lastName'], 
//   clientId: json['clientId'], 
//   );

}