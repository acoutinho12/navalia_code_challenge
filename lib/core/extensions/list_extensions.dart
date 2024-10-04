extension NonNullableList<T> on List<T>? {
  bool get isNotNull => (this != null);
  List<T> get orEmpty => this ?? [];
}
