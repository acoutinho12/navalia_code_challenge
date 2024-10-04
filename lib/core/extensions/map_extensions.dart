extension DynamicExtension on dynamic {
  bool get isNotNull => (this != null);
  String get orEmpty {
    if (this is String) {
      return this ?? "";
    } else if (this is num) {
      return "${this ?? ""}";
    } else {
      return "";
    }
  }
}
