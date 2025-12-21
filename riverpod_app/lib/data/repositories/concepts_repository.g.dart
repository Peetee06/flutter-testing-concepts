// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'concepts_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(conceptsRepository)
const conceptsRepositoryProvider = ConceptsRepositoryProvider._();

final class ConceptsRepositoryProvider extends $FunctionalProvider<
    ConceptsRepository,
    ConceptsRepository,
    ConceptsRepository> with $Provider<ConceptsRepository> {
  const ConceptsRepositoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'conceptsRepositoryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$conceptsRepositoryHash();

  @$internal
  @override
  $ProviderElement<ConceptsRepository> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ConceptsRepository create(Ref ref) {
    return conceptsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ConceptsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ConceptsRepository>(value),
    );
  }
}

String _$conceptsRepositoryHash() =>
    r'487ef1733e079799d3d00b31fa162c327e29b247';
