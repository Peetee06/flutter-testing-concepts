import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/features/challenges/challenges_notifier.dart';
import 'package:riverpod_app/features/challenges/view/widgets/challenges_list.dart';

class ChallengesView extends StatelessWidget {
  const ChallengesView({
    required this.conceptId,
    super.key,
  });

  final String conceptId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _ChallengesBody(conceptId: conceptId),
    );
  }
}

class _ChallengesBody extends ConsumerWidget {
  const _ChallengesBody({required this.conceptId});

  final String conceptId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final challengesAsync = ref.watch(challengesProvider(conceptId));

    return switch (challengesAsync) {
      AsyncData(:final value) => ChallengesList(challenges: value),
      AsyncError(:final error) => Center(child: Text(error.toString())),
      _ => const Center(child: CircularProgressIndicator()),
    };
  }
}
