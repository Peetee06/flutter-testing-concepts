import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_app/domain/answer.dart';
import 'package:riverpod_app/domain/challenge.dart';

void main() {
  group('Challenge', () {
    const mockQuestionLocalizations = {
      'en': 'Test Question',
      'de': 'Testfrage',
    };
    final mockOptions = [
      const Answer(id: 'a1', text: {'en': 'Option 1'}),
      const Answer(id: 'a2', text: {'en': 'Option 2'}),
    ];

    test(
        'should throw AssertionError '
        'when correctAnswerIds contains an ID not in options', () {
      expect(
        () => Challenge(
          id: 'c1',
          question: mockQuestionLocalizations,
          options: mockOptions,
          correctAnswerIds: const ['a1', 'a3'], // 'a3' is not in options
        ),
        throwsA(isA<AssertionError>()),
      );
    });

    test('should create successfully when correctAnswerIds are valid', () {
      expect(
        () => Challenge(
          id: 'c2',
          question: mockQuestionLocalizations,
          options: mockOptions,
          correctAnswerIds: const ['a1', 'a2'], // Both IDs are in options
        ),
        returnsNormally,
      );
    });

    test('should create successfully when correctAnswerIds is empty', () {
      expect(
        () => Challenge(
          id: 'c3',
          question: mockQuestionLocalizations,
          options: mockOptions,
          correctAnswerIds: const [], // Empty list is valid
        ),
        returnsNormally,
      );
    });

    test(
        'should create successfully '
        'when options is empty and correctAnswerIds is empty', () {
      expect(
        () => Challenge(
          id: 'c4',
          question: mockQuestionLocalizations,
          options: [], // Empty options list
          correctAnswerIds: [], // Empty list is valid
        ),
        returnsNormally,
      );
    });

    test(
        'should throw AssertionError '
        'when options is empty but correctAnswerIds is not', () {
      expect(
        () => Challenge(
          id: 'c5',
          question: mockQuestionLocalizations,
          options: [], // Empty options list
          correctAnswerIds: ['a1'], // Invalid ID
        ),
        throwsA(isA<AssertionError>()),
      );
    });
  });
}
