// List<ProfileModel> dashboardModelFromMap(List list)=>List<ProfileModel>.from(list.map((json) => ProfileModel.fromJson(json)));

class ProfileModel {
 String firstName;
 String lastName;
 String email;
 String clientId;


 ProfileModel({
  required this.firstName,
  required this.lastName,
  required this.email,
  required this.clientId,
  });

 factory ProfileModel.fromJson(Map<String,dynamic> json)=>ProfileModel(
  email: json['email'], 
  firstName: json['firstName'], 
  lastName: json['lastName'], 
  clientId: json['clientId'],
  );

}