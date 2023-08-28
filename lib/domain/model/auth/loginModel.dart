import 'dart:convert';

import 'package:hive/hive.dart';

part 'loginModel.g.dart';

@HiveType(typeId: 0)
class LoginModel {
  @HiveField(0)
  final String refresh;
  @HiveField(1)
  final String access;
  @HiveField(2)
  final Data data;

  LoginModel({
    required this.refresh,
    required this.access,
    required this.data,
  });

  factory LoginModel.fromRawJson(String str) =>
      LoginModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        refresh: json["refresh"],
        access: json["access"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "refresh": refresh,
        "access": access,
        "data": data.toJson(),
      };
}

@HiveType(typeId: 1)
class Data {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String phone;
  @HiveField(2)
  final Item item;

  Data({
    required this.id,
    required this.phone,
    required this.item,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        phone: json["phone"],
        item: Item.fromJson(json["item"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "phone": phone,
        "item": item.toJson(),
      };
}

@HiveType(typeId: 2)
class Item {
  @HiveField(0)
  final Boards boards;
  @HiveField(1)
  final Boards memberBoards;

  Item({
    required this.boards,
    required this.memberBoards,
  });

  factory Item.fromRawJson(String str) => Item.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        boards: Boards.fromJson(json["boards"]),
        memberBoards: Boards.fromJson(json["member_boards"]),
      );

  Map<String, dynamic> toJson() => {
        "boards": boards.toJson(),
        "member_boards": memberBoards.toJson(),
      };
}

@HiveType(typeId: 3)
class Boards {
  Boards();

  factory Boards.fromRawJson(String str) => Boards.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Boards.fromJson(Map<String, dynamic> json) => Boards();

  Map<String, dynamic> toJson() => {};
}
