import 'dart:async';

import 'package:common/common.dart';
import 'package:riverpod_app/features/challenges/challenges_notifier.dart';

import '../../helpers/future_behavior.dart';

class FakeChallengesNotifier extends ChallengesNotifier {
  FakeChallengesNotifier({
    required this.challenges,
    this.behavior,
  });

  final List<Challenge> challenges;
  final FutureBehavior? behavior;

  @override
  Future<List<Challenge>> build(String conceptId) async {
    await behavior?.simulate();
    return challenges;
  }
}
