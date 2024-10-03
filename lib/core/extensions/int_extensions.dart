extension NonNullableInt on int? {
  int get orZero => this ?? 0;
  int get orNegativeOne => this ?? -1;
}
