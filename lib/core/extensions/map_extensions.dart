extension DynamicExtension on dynamic {
  String get orEmpty {
    if (this is String?) {
      return this ?? "";
    } else if (this is int? || this is double?) {
      return "${this ?? ""}";
    } else {
      return "";
    }
  }
}
