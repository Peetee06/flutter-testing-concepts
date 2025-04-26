import 'package:common/common.dart' hide Localizations;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/features/concept/concept_notifier.dart';
import 'package:riverpod_app/features/concept/view/widgets/sections_view.dart';

class ConceptView extends StatelessWidget {
  const ConceptView({required this.id, super.key});

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _ConceptAppBar(id: id),
      body: _ConceptBody(id: id),
    );
  }
}

class _ConceptAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const _ConceptAppBar({required this.id});
  final String id;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final concept = ref.watch(conceptNotifierProvider(id));
    return switch (concept) {
      AsyncData(:final value) => AppBar(
          title: Text(
            value.title.localizedTo(Localizations.localeOf(context)),
          ),
        ),
      _ => AppBar(),
    };
  }
}

class _ConceptBody extends ConsumerWidget {
  const _ConceptBody({required this.id});
  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final concept = ref.watch(conceptNotifierProvider(id));
    return switch (concept) {
      AsyncData(:final value) => SectionsView(
          id: value.id,
          sections: value.sections,
          hasChallenges: value.challengeIds.isNotEmpty,
        ),
      AsyncError(:final error) => Center(
          child: Text(error.toString()),
        ),
      _ => const Center(
          child: CircularProgressIndicator(),
        ),
    };
  }
}
