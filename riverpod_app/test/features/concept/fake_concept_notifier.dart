import 'package:common/common.dart';
import 'package:riverpod_app/features/concept/concept_notifier.dart';

import '../../helpers/future_behavior.dart';

class FakeConceptNotifier extends ConceptNotifier {
  FakeConceptNotifier({
    required this.concept,
    this.behavior,
  });

  Concept concept;
  FutureBehavior? behavior;

  @override
  Future<Concept> build(String id) async {
    if (concept.id != id) {
      throw AssertionError('Concept id mismatch');
    }
    await behavior?.simulate();
    return concept;
  }

  void updateFake({
    Concept? concept,
    FutureBehavior? behavior,
  }) {
    this.concept = concept ?? this.concept;
    this.behavior = behavior;
  }
}
