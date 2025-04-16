import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_app/common/typedefs.dart';
import 'package:riverpod_app/domain/answer.dart';

part 'challenge.freezed.dart';
part 'challenge.g.dart';

@freezed
class Challenge with _$Challenge {
  const factory Challenge({
    required String id,
    required Localizations question,
    required List<Answer> options,
    required List<String> correctAnswerIds,
  }) = _Challenge;

  factory Challenge.fromJson(Map<String, dynamic> json) =>
      _$ChallengeFromJson(json);
}
