import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/features/challenges/challenge_progress.dart';

part 'challenge_progress_notifier.g.dart';

/// Notifier that manages the user's progress on a specific challenge.
///
/// This demonstrates a use case where a Notifier is needed because:
/// - State is mutable (selecting answers, submitting)
/// - Multiple methods modify the state
/// - The UI needs to trigger state changes imperatively
@riverpod
class ChallengeProgressNotifier extends _$ChallengeProgressNotifier {
  @override
  ChallengeProgress build(String challengeId) {
    return const ChallengeProgress();
  }

  /// Toggles the selection of an answer.
  ///
  /// If the answer is already selected, it will be deselected.
  /// If the answer is not selected, it will be selected.
  ///
  /// Does nothing if the challenge has already been submitted.
  void toggleAnswer(String answerId) {
    if (state.isSubmitted) return;

    final currentSelection = state.selectedAnswerIds;
    final Set<String> newSelection;
    if (currentSelection.contains(answerId)) {
      newSelection = {...currentSelection}..remove(answerId);
    } else {
      newSelection = {...currentSelection, answerId};
    }

    state = state.copyWith(selectedAnswerIds: newSelection);
  }

  /// Submits the challenge, marking it as completed.
  ///
  /// After submission, the selected answers cannot be changed.
  void submit() {
    if (state.isSubmitted) return;
    state = state.copyWith(isSubmitted: true);
  }

  /// Resets the challenge progress, clearing all selections and submission
  /// status.
  void reset() {
    state = const ChallengeProgress();
  }

  /// Checks if the selected answers match the correct answers.
  ///
  /// Returns `true` if all correct answers are selected and no incorrect
  /// answers are selected.
  bool isCorrect(List<String> correctAnswerIds) {
    final correctSet = correctAnswerIds.toSet();
    return state.selectedAnswerIds.length == correctSet.length &&
        state.selectedAnswerIds.containsAll(correctSet);
  }
}
