// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'concept_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(concept)
const conceptProvider = ConceptFamily._();

final class ConceptProvider
    extends $FunctionalProvider<AsyncValue<Concept>, Concept, FutureOr<Concept>>
    with $FutureModifier<Concept>, $FutureProvider<Concept> {
  const ConceptProvider._(
      {required ConceptFamily super.from, required String super.argument})
      : super(
          retry: networkRetry,
          name: r'conceptProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$conceptHash();

  @override
  String toString() {
    return r'conceptProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Concept> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Concept> create(Ref ref) {
    final argument = this.argument as String;
    return concept(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ConceptProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$conceptHash() => r'7869cf2654dae15a82968b3999551e7a7a344919';

final class ConceptFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Concept>, String> {
  const ConceptFamily._()
      : super(
          retry: networkRetry,
          name: r'conceptProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  ConceptProvider call(
    String id,
  ) =>
      ConceptProvider._(argument: id, from: this);

  @override
  String toString() => r'conceptProvider';
}
