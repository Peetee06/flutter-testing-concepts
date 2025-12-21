import 'package:common/common.dart' hide Localizations;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/features/concepts/concepts_notifier.dart';
import 'package:riverpod_app/features/concepts/concepts_route.dart';
import 'package:riverpod_app/l10n/l10n.dart';

class ConceptsView extends StatelessWidget {
  const ConceptsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.conceptsViewTitle),
      ),
      body: const ConceptsContent(),
    );
  }
}

class ConceptsContent extends ConsumerWidget {
  const ConceptsContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final conceptsAsync = ref.watch(conceptsProvider);
    return switch (conceptsAsync) {
      AsyncData(:final value) => value.isEmpty
          ? Center(child: Text(context.l10n.conceptsEmpty))
          : ListView.separated(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: value.length,
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final concept = value[index];
                return ListTile(
                  title: Text(
                    concept.title.localizedTo(Localizations.localeOf(context)),
                  ),
                  subtitle: Text(
                    context.l10n.conceptsSections(concept.sections.length),
                  ),
                  trailing: Chip(
                    label: Text(
                      context.l10n
                          .conceptsChallenges(concept.challengeIds.length),
                    ),
                  ),
                  onTap: () => ConceptRoute(id: concept.id).go(context),
                );
              },
            ),
      AsyncError(:final error) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(error.toString()),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                ref.invalidate(conceptsProvider);
              },
              child: Text(context.l10n.conceptsTryAgain),
            ),
          ],
        ),
      _ => const Center(child: CircularProgressIndicator()),
    };
  }
}
