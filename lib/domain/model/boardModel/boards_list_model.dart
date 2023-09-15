

import 'dart:convert';

class BoardsListModel {
    final int id;
    final String title;
    final int creator;
    final String createdAt;
    final String updateAt;

    BoardsListModel({
        required this.id,
        required this.title,
        required this.creator,
        required this.createdAt,
        required this.updateAt,
    });

    factory BoardsListModel.fromRawJson(String str) => BoardsListModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory BoardsListModel.fromJson(Map<String, dynamic> json) => BoardsListModel(
        id: json["id"],
        title: json["title"],
        creator: json["creator"],
        createdAt: json["created_at"],
        updateAt: json["update_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "creator": creator,
        "created_at": createdAt,
        "update_at": updateAt,
    };
}
