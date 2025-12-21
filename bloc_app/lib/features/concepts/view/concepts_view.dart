import 'package:bloc_app/features/concepts/concepts_route.dart';
import 'package:bloc_app/features/concepts/cubit/concepts_cubit.dart';
import 'package:bloc_app/features/concepts/cubit/concepts_state.dart';
import 'package:bloc_app/l10n/l10n.dart';
import 'package:common/common.dart' hide Localizations;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConceptsView extends StatelessWidget {
  const ConceptsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.conceptsViewTitle),
      ),
      body: BlocBuilder<ConceptsCubit, ConceptsState>(
        builder: (context, state) {
          return switch (state) {
            ConceptsInitial() => const SizedBox.shrink(),
            ConceptsLoading() => const Center(
                child: CircularProgressIndicator(),
              ),
            ConceptsLoaded(:final concepts) => RefreshIndicator(
                onRefresh: () => context.read<ConceptsCubit>().fetchConcepts(),
                child: concepts.isEmpty
                    ? Center(
                        child: Text(context.l10n.conceptsEmpty),
                      )
                    : ListView.separated(
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: concepts.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 8),
                        itemBuilder: (context, index) {
                          final concept = concepts[index];
                          return ListTile(
                            title: Text(
                              concept.title.localizedTo(
                                Localizations.localeOf(context),
                              ),
                            ),
                            subtitle: Text(
                              context.l10n.conceptsSections(
                                concept.sections.length,
                              ),
                            ),
                            trailing: Chip(
                              label: Text(
                                context.l10n.conceptsChallenges(
                                  concept.challengeIds.length,
                                ),
                              ),
                            ),
                            onTap: () => ConceptRoute(
                              id: concept.id,
                            ).go(context),
                          );
                        },
                      ),
              ),
            ConceptsError(:final message) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(message),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () =>
                          context.read<ConceptsCubit>().fetchConcepts(),
                      child: Text(context.l10n.conceptsTryAgain),
                    ),
                  ],
                ),
              ),
          };
        },
      ),
    );
  }
}
