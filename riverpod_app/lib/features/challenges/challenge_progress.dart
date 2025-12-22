import 'package:freezed_annotation/freezed_annotation.dart';

part 'challenge_progress.freezed.dart';

/// Represents the user's progress on a challenge.
@freezed
abstract class ChallengeProgress with _$ChallengeProgress {
  /// Creates a [ChallengeProgress] instance.
  const factory ChallengeProgress({
    /// IDs of the currently selected answers.
    @Default(<String>{}) Set<String> selectedAnswerIds,

    /// Whether the challenge has been submitted.
    @Default(false) bool isSubmitted,
  }) = _ChallengeProgress;
}
