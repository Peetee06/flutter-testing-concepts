// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'concepts_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ConceptsNotifier)
const conceptsProvider = ConceptsNotifierProvider._();

final class ConceptsNotifierProvider
    extends $AsyncNotifierProvider<ConceptsNotifier, List<Concept>> {
  const ConceptsNotifierProvider._()
      : super(
          from: null,
          argument: null,
          retry: networkRetry,
          name: r'conceptsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$conceptsNotifierHash();

  @$internal
  @override
  ConceptsNotifier create() => ConceptsNotifier();
}

String _$conceptsNotifierHash() => r'43ac5d7c9702cc25e030ddb8e505ac56ed36faca';

abstract class _$ConceptsNotifier extends $AsyncNotifier<List<Concept>> {
  FutureOr<List<Concept>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<List<Concept>>, List<Concept>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<List<Concept>>, List<Concept>>,
        AsyncValue<List<Concept>>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
