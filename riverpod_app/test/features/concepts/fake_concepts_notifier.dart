import 'package:common/common.dart';
import 'package:riverpod_app/features/concepts/concepts_notifier.dart';

import '../../helpers/future_behavior.dart';

class FakeConceptsNotifier extends ConceptsNotifier {
  FakeConceptsNotifier({
    required this.concepts,
    this.behavior,
  });

  List<Concept> concepts;
  FutureBehavior? behavior;

  @override
  Future<List<Concept>> build() async {
    await behavior?.simulate();
    return concepts;
  }

  void updateFake({
    List<Concept>? concepts,
    FutureBehavior? behavior,
  }) {
    this.concepts = concepts ?? this.concepts;
    this.behavior = behavior;
  }
}
