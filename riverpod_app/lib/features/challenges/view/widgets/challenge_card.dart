import 'package:common/common.dart' hide Localizations;
import 'package:flutter/material.dart';

class ChallengeCard extends StatelessWidget {
  const ChallengeCard({required this.challenge, super.key});
  final Challenge challenge;

  @override
  Widget build(BuildContext context) {
    // Get locale for localization
    final locale = Localizations.localeOf(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              challenge.question.localizedTo(locale),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            ...challenge.options.map(
              (option) => Padding(
                // Add padding only if it's not the last option
                padding: EdgeInsets.only(
                  bottom: option == challenge.options.last ? 0 : 8,
                ),
                child: Text(option.text.localizedTo(locale)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
