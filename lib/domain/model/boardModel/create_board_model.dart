


class CreateBoardModel {
  int? id;
  String? title;
  int? creator;
  String? createdAt;
  String? updateAt;

  CreateBoardModel(
      {this.id, this.title, this.creator, this.createdAt, this.updateAt});

  CreateBoardModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    creator = json['creator'];
    createdAt = json['created_at'];
    updateAt = json['update_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['creator'] = this.creator;
    data['created_at'] = this.createdAt;
    data['update_at'] = this.updateAt;
    return data;
  }
}
