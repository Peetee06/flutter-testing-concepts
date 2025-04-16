import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_app/common/typedefs.dart';
import 'package:riverpod_app/domain/answer.dart';

part 'challenge.freezed.dart';
part 'challenge.g.dart';

@freezed

/// Represents a challenge with a [question], multiple [options], and correct
/// [answer IDs]. The [correctAnswerIds] list contains the IDs of the [Answer]
/// objects in the [options] list that are considered correct responses to the
/// challenge.
class Challenge with _$Challenge {
  @Assert(
    'options.map((o) => o.id).toSet().containsAll(correctAnswerIds)',
    'Each correctAnswerId must match an id in options',
  )
  const factory Challenge({
    required String id,
    required Localizations question,
    required List<Answer> options,
    required List<String> correctAnswerIds,
  }) = _Challenge;

  factory Challenge.fromJson(Map<String, dynamic> json) =>
      _$ChallengeFromJson(json);
}
