class RegisterModel {
  String? success;
  int? userId;
  String? token;

  RegisterModel({this.success, this.userId, this.token});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    userId = json['user_id'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['user_id'] = userId;
    data['token'] = token;
    return data;
  }
}
