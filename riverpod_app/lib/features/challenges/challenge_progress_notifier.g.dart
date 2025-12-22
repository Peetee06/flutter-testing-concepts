// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_progress_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Notifier that manages the user's progress on a specific challenge.
///
/// This demonstrates a use case where a Notifier is needed because:
/// - State is mutable (selecting answers, submitting)
/// - Multiple methods modify the state
/// - The UI needs to trigger state changes imperatively

@ProviderFor(ChallengeProgressNotifier)
const challengeProgressProvider = ChallengeProgressNotifierFamily._();

/// Notifier that manages the user's progress on a specific challenge.
///
/// This demonstrates a use case where a Notifier is needed because:
/// - State is mutable (selecting answers, submitting)
/// - Multiple methods modify the state
/// - The UI needs to trigger state changes imperatively
final class ChallengeProgressNotifierProvider
    extends $NotifierProvider<ChallengeProgressNotifier, ChallengeProgress> {
  /// Notifier that manages the user's progress on a specific challenge.
  ///
  /// This demonstrates a use case where a Notifier is needed because:
  /// - State is mutable (selecting answers, submitting)
  /// - Multiple methods modify the state
  /// - The UI needs to trigger state changes imperatively
  const ChallengeProgressNotifierProvider._(
      {required ChallengeProgressNotifierFamily super.from,
      required String super.argument})
      : super(
          retry: null,
          name: r'challengeProgressProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$challengeProgressNotifierHash();

  @override
  String toString() {
    return r'challengeProgressProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ChallengeProgressNotifier create() => ChallengeProgressNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ChallengeProgress value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ChallengeProgress>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ChallengeProgressNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$challengeProgressNotifierHash() =>
    r'40032b42207ac850bf8803a57625194992060438';

/// Notifier that manages the user's progress on a specific challenge.
///
/// This demonstrates a use case where a Notifier is needed because:
/// - State is mutable (selecting answers, submitting)
/// - Multiple methods modify the state
/// - The UI needs to trigger state changes imperatively

final class ChallengeProgressNotifierFamily extends $Family
    with
        $ClassFamilyOverride<ChallengeProgressNotifier, ChallengeProgress,
            ChallengeProgress, ChallengeProgress, String> {
  const ChallengeProgressNotifierFamily._()
      : super(
          retry: null,
          name: r'challengeProgressProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  /// Notifier that manages the user's progress on a specific challenge.
  ///
  /// This demonstrates a use case where a Notifier is needed because:
  /// - State is mutable (selecting answers, submitting)
  /// - Multiple methods modify the state
  /// - The UI needs to trigger state changes imperatively

  ChallengeProgressNotifierProvider call(
    String challengeId,
  ) =>
      ChallengeProgressNotifierProvider._(argument: challengeId, from: this);

  @override
  String toString() => r'challengeProgressProvider';
}

/// Notifier that manages the user's progress on a specific challenge.
///
/// This demonstrates a use case where a Notifier is needed because:
/// - State is mutable (selecting answers, submitting)
/// - Multiple methods modify the state
/// - The UI needs to trigger state changes imperatively

abstract class _$ChallengeProgressNotifier
    extends $Notifier<ChallengeProgress> {
  late final _$args = ref.$arg as String;
  String get challengeId => _$args;

  ChallengeProgress build(
    String challengeId,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      _$args,
    );
    final ref = this.ref as $Ref<ChallengeProgress, ChallengeProgress>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<ChallengeProgress, ChallengeProgress>,
        ChallengeProgress,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
