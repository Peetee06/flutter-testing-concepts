// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'concept_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ConceptNotifier)
const conceptProvider = ConceptNotifierFamily._();

final class ConceptNotifierProvider
    extends $AsyncNotifierProvider<ConceptNotifier, Concept> {
  const ConceptNotifierProvider._(
      {required ConceptNotifierFamily super.from,
      required String super.argument})
      : super(
          retry: null,
          name: r'conceptProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$conceptNotifierHash();

  @override
  String toString() {
    return r'conceptProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ConceptNotifier create() => ConceptNotifier();

  @override
  bool operator ==(Object other) {
    return other is ConceptNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$conceptNotifierHash() => r'28f14a871e6e434ee6a125ccb3a0f274c8b63594';

final class ConceptNotifierFamily extends $Family
    with
        $ClassFamilyOverride<ConceptNotifier, AsyncValue<Concept>, Concept,
            FutureOr<Concept>, String> {
  const ConceptNotifierFamily._()
      : super(
          retry: null,
          name: r'conceptProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  ConceptNotifierProvider call(
    String id,
  ) =>
      ConceptNotifierProvider._(argument: id, from: this);

  @override
  String toString() => r'conceptProvider';
}

abstract class _$ConceptNotifier extends $AsyncNotifier<Concept> {
  late final _$args = ref.$arg as String;
  String get id => _$args;

  FutureOr<Concept> build(
    String id,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      _$args,
    );
    final ref = this.ref as $Ref<AsyncValue<Concept>, Concept>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<Concept>, Concept>,
        AsyncValue<Concept>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
