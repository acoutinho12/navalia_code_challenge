extension NonNullableString on String? {
  String get orEmpty => this ?? "";
}
