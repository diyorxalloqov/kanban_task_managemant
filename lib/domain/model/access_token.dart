



class AccessModel {
  String? access;

  AccessModel({this.access});

  AccessModel.fromJson(Map<String, dynamic> json) {
    access = json['access'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access'] = this.access;
    return data;
  }
}