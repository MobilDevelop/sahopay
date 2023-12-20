class UpdateProfile {
  String firstName;
  String lastName;

  UpdateProfile({required this.firstName, required this.lastName});

  Map<String, dynamic> toJson() => {'firstName': firstName, 'lastName': lastName};
}