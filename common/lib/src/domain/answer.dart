import 'package:common/src/typedefs.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'answer.freezed.dart';
part 'answer.g.dart';

@freezed

/// A single answer to a challenge.
abstract class Answer with _$Answer {
  /// Create an answer.
  const factory Answer({
    required String id,
    required Localizations text,
  }) = _Answer;

  /// Deserialize an answer from a JSON object.
  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);
}
