// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'concepts_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(concepts)
const conceptsProvider = ConceptsProvider._();

final class ConceptsProvider extends $FunctionalProvider<
        AsyncValue<List<Concept>>, List<Concept>, FutureOr<List<Concept>>>
    with $FutureModifier<List<Concept>>, $FutureProvider<List<Concept>> {
  const ConceptsProvider._()
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
  String debugGetCreateSourceHash() => _$conceptsHash();

  @$internal
  @override
  $FutureProviderElement<List<Concept>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<Concept>> create(Ref ref) {
    return concepts(ref);
  }
}

String _$conceptsHash() => r'1929127ff64e984e91627a0b05da462eff0f68c0';
