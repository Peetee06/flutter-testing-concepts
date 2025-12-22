// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenges_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(challenges)
const challengesProvider = ChallengesFamily._();

final class ChallengesProvider extends $FunctionalProvider<
        AsyncValue<List<Challenge>>, List<Challenge>, FutureOr<List<Challenge>>>
    with $FutureModifier<List<Challenge>>, $FutureProvider<List<Challenge>> {
  const ChallengesProvider._(
      {required ChallengesFamily super.from, required String super.argument})
      : super(
          retry: networkRetry,
          name: r'challengesProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$challengesHash();

  @override
  String toString() {
    return r'challengesProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<Challenge>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<Challenge>> create(Ref ref) {
    final argument = this.argument as String;
    return challenges(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ChallengesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$challengesHash() => r'ec6eac15a1e2098cd57b491257dc996d02354f8c';

final class ChallengesFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<Challenge>>, String> {
  const ChallengesFamily._()
      : super(
          retry: networkRetry,
          name: r'challengesProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  ChallengesProvider call(
    String conceptId,
  ) =>
      ChallengesProvider._(argument: conceptId, from: this);

  @override
  String toString() => r'challengesProvider';
}
