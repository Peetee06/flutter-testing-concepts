import 'package:common/src/domain/answer.dart';
import 'package:common/src/typedefs.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'challenge.freezed.dart';
part 'challenge.g.dart';

@freezed

/// A challenge.
abstract class Challenge with _$Challenge {
  /// Represents a challenge with a [question], multiple [options], and correct
  /// [answer IDs]. The [correctAnswerIds] list contains the IDs of the [Answer]
  /// objects in the [options] list that are considered correct responses to the
  /// challenge.
  ///
  /// The [correctAnswerIds] list must contain only IDs that are present in the
  /// [options] list.
  @Assert(
    'options.map((o) => o.id).toSet().containsAll(correctAnswerIds)',
    'Each correctAnswerId must match an id in options',
  )
  factory Challenge({
    required String id,
    required Localizations question,
    required List<Answer> options,
    required List<String> correctAnswerIds,
  }) = _Challenge;

  /// Deserialize a challenge from a JSON object.
  factory Challenge.fromJson(Map<String, dynamic> json) =>
      _$ChallengeFromJson(json);
}
