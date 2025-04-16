import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_app/common/typedefs.dart';

part 'answer.freezed.dart';
part 'answer.g.dart';

@freezed
abstract class Answer with _$Answer {
  /// Represents an answer option for a Challenge.
  /// Each Answer has a unique ID and localized text content.
  const factory Answer({
    required String id,
    required Localizations text,
  }) = _Answer;

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);
}
