import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

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
  final List<dynamic> boards;
  @HiveField(3)
  final List<dynamic> memberBoards;

  Data({
    required this.id,
    required this.phone,
    required this.boards,
    required this.memberBoards,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        phone: json["phone"],
        boards: List<dynamic>.from(json["boards"].map((x) => x)),
        memberBoards: List<dynamic>.from(json["member_boards"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "phone": phone,
        "boards": List<dynamic>.from(boards.map((x) => x)),
        "member_boards": List<dynamic>.from(memberBoards.map((x) => x)),
      };
}
