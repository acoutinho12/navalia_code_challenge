final class Formatters {
  static String stringOrEmpty(dynamic value) {
    if (value is String) {
      return value;
    } else if (value is num) {
      return "$value";
    } else {
      return "";
    }
  }

  static int intOrNegativeOne(dynamic value) {
    if (value is String) {
      return int.parse(value);
    } else if (value is num) {
      return value.toInt();
    } else {
      return -1;
    }
  }

  static double toDoubleOrNegativeOne(dynamic value) {
    if (value is String) {
      return double.parse(value);
    } else if (value is num) {
      return value.toDouble();
    } else {
      return -1;
    }
  }
}
