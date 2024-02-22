class MapUtils {
  static Map<String, dynamic> fixMap(Map map) {
    Map<String, dynamic> fixed = {};
    for (var entry in map.entries) {
      var value = entry.value;
      if (value is Map) {
        fixed[entry.key] = fixMap(value);
      } else {
        fixed[entry.key] = value;
      }
    }
    return fixed;
  }
}
