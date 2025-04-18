import 'package:bloc_app/features/concept/cubit/concept_cubit.dart';
import 'package:bloc_app/features/concept/cubit/concept_state.dart';
import 'package:bloc_app/features/concept/view/widgets/sections_view.dart';
import 'package:common/common.dart' hide Localizations;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConceptView extends StatelessWidget {
  const ConceptView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConceptCubit, ConceptState>(
      builder: (context, state) {
        return Scaffold(
          appBar: switch (state) {
            ConceptLoaded(:final concept) => AppBar(
                title: Text(
                  concept.title.localizedTo(
                    Localizations.localeOf(context),
                  ),
                ),
              ),
            _ => AppBar(),
          },
          body: switch (state) {
            ConceptInitial() => const SizedBox.shrink(),
            ConceptLoading() => const Center(
                child: CircularProgressIndicator(),
              ),
            ConceptError(:final message) => Center(
                child: Text(message),
              ),
            ConceptLoaded(:final concept) => ConceptSectionsView(
                id: concept.id,
                sections: concept.sections,
                hasChallenges: concept.challengeIds.isNotEmpty,
              ),
          },
        );
      },
    );
  }
}
