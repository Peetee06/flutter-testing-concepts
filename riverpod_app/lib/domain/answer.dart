import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_app/common/typedefs.dart';

part 'answer.freezed.dart';
part 'answer.g.dart';

@freezed
class Answer with _$Answer {
  const factory Answer({
    required String id,
    required Localizations text,
  }) = _Answer;

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);
}
