class LoginModel {
  String? success;

  LoginModel({this.success});

  LoginModel.fromJson(Map<String, dynamic> json) {
    success = json['Success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Success'] = success;
    return data;
  }
}
