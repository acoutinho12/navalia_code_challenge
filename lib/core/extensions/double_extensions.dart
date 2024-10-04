extension DoubleExtensions on double {
  String get toCurrency => "\$ ${toStringAsFixed(2)}";
}
