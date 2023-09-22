import 'dart:convert';

class CreateBoardsModel {
  final int id;
  final String title;
  final Creator creator;
  final List<dynamic> taskConditions;
  final String createdAt;
  final String updateAt;

  CreateBoardsModel({
    required this.id,
    required this.title,
    required this.creator,
    required this.taskConditions,
    required this.createdAt,
    required this.updateAt,
  });

  factory CreateBoardsModel.fromRawJson(String str) =>
      CreateBoardsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CreateBoardsModel.fromJson(Map<String, dynamic> json) =>
      CreateBoardsModel(
        id: json["id"],
        title: json["title"],
        creator: Creator.fromJson(json["creator"]),
        taskConditions: List<dynamic>.from(json["task_conditions"]),
        createdAt: json["created_at"],
        updateAt: json["update_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "creator": creator.toJson(),
        "task_conditions": taskConditions,
        "created_at": createdAt,
        "update_at": updateAt,
      };
}

class Creator {
  final int id;
  final dynamic firstName;
  final dynamic lastName;
  final String phone;

  Creator({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
  });

  factory Creator.fromRawJson(String str) => Creator.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Creator.fromJson(Map<String, dynamic> json) => Creator(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "phone": phone,
      };
}
