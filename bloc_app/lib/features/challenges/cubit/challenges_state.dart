import 'package:common/common.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'challenges_state.freezed.dart';

@freezed
sealed class ChallengesState with _$ChallengesState {
  const factory ChallengesState.initial() = ChallengesInitial;
  const factory ChallengesState.loading() = ChallengesLoading;
  const factory ChallengesState.loaded(List<Challenge> challenges) =
      ChallengesLoaded;
  const factory ChallengesState.error(String message) = ChallengesError;
}
