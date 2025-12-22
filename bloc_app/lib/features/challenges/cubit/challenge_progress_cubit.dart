import 'package:bloc_app/features/challenges/cubit/challenge_progress.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Cubit that manages the user's progress on a specific challenge.
///
/// This demonstrates a use case where a Cubit is needed because:
/// - State is mutable (selecting answers, submitting)
/// - Multiple methods modify the state
/// - The UI needs to trigger state changes imperatively
class ChallengeProgressCubit extends Cubit<ChallengeProgress> {
  /// Creates a [ChallengeProgressCubit] instance.
  ChallengeProgressCubit() : super(const ChallengeProgress());

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

    emit(state.copyWith(selectedAnswerIds: newSelection));
  }

  /// Submits the challenge, marking it as completed.
  ///
  /// After submission, the selected answers cannot be changed.
  void submit() {
    if (state.isSubmitted) return;
    emit(state.copyWith(isSubmitted: true));
  }

  /// Resets the challenge progress, clearing all selections and submission
  /// status.
  void reset() {
    emit(const ChallengeProgress());
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
