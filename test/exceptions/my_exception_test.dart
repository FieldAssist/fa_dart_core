import 'package:fa_dart_core/fa_dart_core.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('MyException', () {
    test('MyException should return message on calling toString', () {
      final exception = MyException('Test Error');
      expect(exception.toString(), 'Test Error');
    });
  });
}
