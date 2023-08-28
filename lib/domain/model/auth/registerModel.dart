class RegisterModel {
  String? phone;

  RegisterModel({this.phone});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    phone = json['phone'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phone'] = phone;
    return data;
  }
}
