import 'package:fa_dart_core/fa_dart_core.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('add', () {
    test('addDataSafely should not add data if subject is closed', () {
      final subject = BehaviorSubject<int>.seeded(0);
      expect(subject, emits(0));
      subject.close();
      subject.addDataSafely(1);
      expect(subject, neverEmits(1));
    });

    test('addDataSafely should add data if subject is not closed', () {
      final subject = BehaviorSubject<int>.seeded(0);
      expect(subject, emits(0));
      subject.addDataSafely(1);
      expect(subject, emits(1));
    });
  });

  group('error', () {
    test('addErrorSafely should not add error if subject is closed', () {
      final subject = BehaviorSubject<int>.seeded(0);
      expect(subject, emits(0));
      subject.close();
      subject.addErrorSafely(NullThrownError());
      expect(subject, neverEmits(isA<NullThrownError>()));
    });
    test('addErrorSafely should add error if subject is not closed', () {
      final subject = BehaviorSubject<int>.seeded(0);
      expect(subject, emits(0));
      subject.addErrorSafely(NullThrownError());
      expect(subject, emitsError(isA<NullThrownError>()));
    });
  });
}
