import 'package:navalia_code_challenge/core/utils/formatters.dart';
import 'package:test/test.dart';

void main() {
  group('stringOrEmpty', () {
    test('should return "Hello" when value is String', () {
      const String value = 'Hello';
      expect(Formatters.stringOrEmpty(value), value);
    });

    test('should return "20" when value is num', () {
      const int value = 20;
      expect(Formatters.stringOrEmpty(value), "20");
    });

    test('should return "" when value is null', () {
      expect(Formatters.stringOrEmpty(null), "");
    });
  });

  group('intOrNegativeOne', () {
    test('should return 20 when value is String', () {
      const String value = '20';
      expect(Formatters.intOrNegativeOne(value), 20);
    });

    test('should return 20 when value is num', () {
      const double value = 20.0;
      expect(Formatters.intOrNegativeOne(value), 20);
    });

    test('should return  when value is null', () {
      expect(Formatters.intOrNegativeOne(null), -1);
    });
  });
}
