extension NonNullableInt on int? {
  bool get isNotNull => (this != null);
  int get orZero => this ?? 0;
  int get orNegativeOne => this ?? -1;
}
