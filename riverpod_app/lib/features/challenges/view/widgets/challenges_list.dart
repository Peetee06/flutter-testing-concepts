import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_app/features/challenges/view/widgets/challenge_card.dart';
import 'package:riverpod_app/features/concepts/concepts_route.dart';
import 'package:riverpod_app/l10n/l10n.dart';

class ChallengesList extends StatelessWidget {
  const ChallengesList({
    required this.challenges,
    super.key,
  });

  final List<Challenge> challenges;

  static const doneButtonKey = Key('doneButton');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Stack(
        children: [
          if (challenges.isEmpty)
            Center(child: Text(context.l10n.challengesEmpty))
          else
            ListView.separated(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: challenges.length,
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                return ChallengeCard(challenge: challenges[index]);
              },
            ),
          Align(
            alignment: Alignment.bottomCenter,
            child: FilledButton(
              key: doneButtonKey,
              onPressed: () => const ConceptsRoute().go(context),
              child: Text(context.l10n.challengesDoneButtonLabel),
            ),
          ),
        ],
      ),
    );
  }
}
