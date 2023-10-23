class RegisterModel {
  final String succes;
  final int userId;
  final String token;
  RegisterModel(
      {required this.succes, required this.token, required this.userId});

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
        succes: json['succes'], token: json['token'], userId: json['user_id']);
  }
}
