import 'package:json_annotation/json_annotation.dart';

class IntConverter extends JsonConverter<int, String> {
  const IntConverter();
  @override
  int fromJson(String json) {
    double d = double.parse(json);
    int number = d.toInt();
    return number;
  }

  @override
  String toJson(int object) {
    return object.toString();
  }
}
