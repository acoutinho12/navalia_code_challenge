extension NonNullableString on String? {
  bool get isNotNull => (this != null);
  String get orEmpty => this ?? "";
}
