// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenges_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ChallengesNotifier)
const challengesProvider = ChallengesNotifierFamily._();

final class ChallengesNotifierProvider
    extends $AsyncNotifierProvider<ChallengesNotifier, List<Challenge>> {
  const ChallengesNotifierProvider._(
      {required ChallengesNotifierFamily super.from,
      required String super.argument})
      : super(
          retry: networkRetry,
          name: r'challengesProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$challengesNotifierHash();

  @override
  String toString() {
    return r'challengesProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ChallengesNotifier create() => ChallengesNotifier();

  @override
  bool operator ==(Object other) {
    return other is ChallengesNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$challengesNotifierHash() =>
    r'8c144218b667eafc5edffe989a02274c2a548017';

final class ChallengesNotifierFamily extends $Family
    with
        $ClassFamilyOverride<ChallengesNotifier, AsyncValue<List<Challenge>>,
            List<Challenge>, FutureOr<List<Challenge>>, String> {
  const ChallengesNotifierFamily._()
      : super(
          retry: networkRetry,
          name: r'challengesProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  ChallengesNotifierProvider call(
    String conceptId,
  ) =>
      ChallengesNotifierProvider._(argument: conceptId, from: this);

  @override
  String toString() => r'challengesProvider';
}

abstract class _$ChallengesNotifier extends $AsyncNotifier<List<Challenge>> {
  late final _$args = ref.$arg as String;
  String get conceptId => _$args;

  FutureOr<List<Challenge>> build(
    String conceptId,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      _$args,
    );
    final ref = this.ref as $Ref<AsyncValue<List<Challenge>>, List<Challenge>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<List<Challenge>>, List<Challenge>>,
        AsyncValue<List<Challenge>>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
