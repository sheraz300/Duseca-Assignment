// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class CalendarsModel {
  String title;
  Color colors;
  CalendarsModel({
    required this.title,
    required this.colors,
  });

  CalendarsModel copyWith({
    String? title,
    Color? colors,
  }) {
    return CalendarsModel(
      title: title ?? this.title,
      colors: colors ?? this.colors,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'colors': colors.value,
    };
  }

  factory CalendarsModel.fromMap(Map<String, dynamic> map) {
    return CalendarsModel(
      title: map['title'] as String,
      colors: Color(map['colors'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory CalendarsModel.fromJson(String source) =>
      CalendarsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CalendarsModel(title: $title, colors: $colors)';

  @override
  bool operator ==(covariant CalendarsModel other) {
    if (identical(this, other)) return true;

    return other.title == title && other.colors == colors;
  }

  @override
  int get hashCode => title.hashCode ^ colors.hashCode;
}
