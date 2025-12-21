// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenges_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(challengesRepository)
const challengesRepositoryProvider = ChallengesRepositoryProvider._();

final class ChallengesRepositoryProvider extends $FunctionalProvider<
    ChallengesRepository,
    ChallengesRepository,
    ChallengesRepository> with $Provider<ChallengesRepository> {
  const ChallengesRepositoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'challengesRepositoryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$challengesRepositoryHash();

  @$internal
  @override
  $ProviderElement<ChallengesRepository> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ChallengesRepository create(Ref ref) {
    return challengesRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ChallengesRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ChallengesRepository>(value),
    );
  }
}

String _$challengesRepositoryHash() =>
    r'b49259612a95331174974328b3c18151f591e955';
