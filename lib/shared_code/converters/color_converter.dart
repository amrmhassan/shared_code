import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

class ColorConverter extends JsonConverter<Color, String> {
  const ColorConverter();
  @override
  Color fromJson(String json) {
    double d = double.parse(json);
    int number = d.toInt();

    return Color(number);
  }

  @override
  String toJson(Color object) {
    return object.value.toDouble().toString();
  }
}
