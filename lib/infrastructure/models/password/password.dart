class UpdatePassword {
  String currentPassword;
  String newPassword;
  String confirmPassword;

  UpdatePassword({
    required this.currentPassword,
    required this.newPassword,
    required this.confirmPassword,
  });

  Map<String, dynamic> toJson() => {
    'currentPassword': currentPassword,
    'newPassword': newPassword,
    'confirmPassword': confirmPassword,
    

    };
}