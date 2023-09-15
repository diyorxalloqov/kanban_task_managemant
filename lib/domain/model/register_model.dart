import 'dart:convert';

import 'package:flutter/material.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first


@immutable
class RegisterModel {
  final String? phone;

  RegisterModel({
    this.phone,
  });

  RegisterModel copyWith({
    String? phone,
  }) {
    return RegisterModel(
      phone: phone ?? this.phone,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'phone': phone,
    };
  }

  factory RegisterModel.fromMap(Map<String, dynamic> map) {
    return RegisterModel(
      phone: map['phone'] as String?,
    );
  }

  String toJson() {
    return json.encode(toMap());
  }

  factory RegisterModel.fromJson(String source) {
    final Map<String, dynamic> map = json.decode(source) as Map<String, dynamic>;
    return RegisterModel.fromMap(map);
  }

  @override
  String toString() {
    return 'RegisterModel(phone: $phone)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RegisterModel && other.phone == phone;
  }

  @override
  int get hashCode {
    return phone.hashCode;
  }
}