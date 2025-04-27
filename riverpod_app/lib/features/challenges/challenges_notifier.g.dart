// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenges_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$challengesNotifierHash() =>
    r'85ec3d6ae08c6488543e12562565466e855f402b';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$ChallengesNotifier
    extends BuildlessAutoDisposeAsyncNotifier<List<Challenge>> {
  late final String conceptId;

  FutureOr<List<Challenge>> build(
    String conceptId,
  );
}

/// See also [ChallengesNotifier].
@ProviderFor(ChallengesNotifier)
const challengesNotifierProvider = ChallengesNotifierFamily();

/// See also [ChallengesNotifier].
class ChallengesNotifierFamily extends Family<AsyncValue<List<Challenge>>> {
  /// See also [ChallengesNotifier].
  const ChallengesNotifierFamily();

  /// See also [ChallengesNotifier].
  ChallengesNotifierProvider call(
    String conceptId,
  ) {
    return ChallengesNotifierProvider(
      conceptId,
    );
  }

  @override
  ChallengesNotifierProvider getProviderOverride(
    covariant ChallengesNotifierProvider provider,
  ) {
    return call(
      provider.conceptId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'challengesNotifierProvider';
}

/// See also [ChallengesNotifier].
class ChallengesNotifierProvider extends AutoDisposeAsyncNotifierProviderImpl<
    ChallengesNotifier, List<Challenge>> {
  /// See also [ChallengesNotifier].
  ChallengesNotifierProvider(
    String conceptId,
  ) : this._internal(
          () => ChallengesNotifier()..conceptId = conceptId,
          from: challengesNotifierProvider,
          name: r'challengesNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$challengesNotifierHash,
          dependencies: ChallengesNotifierFamily._dependencies,
          allTransitiveDependencies:
              ChallengesNotifierFamily._allTransitiveDependencies,
          conceptId: conceptId,
        );

  ChallengesNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.conceptId,
  }) : super.internal();

  final String conceptId;

  @override
  FutureOr<List<Challenge>> runNotifierBuild(
    covariant ChallengesNotifier notifier,
  ) {
    return notifier.build(
      conceptId,
    );
  }

  @override
  Override overrideWith(ChallengesNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: ChallengesNotifierProvider._internal(
        () => create()..conceptId = conceptId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        conceptId: conceptId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ChallengesNotifier, List<Challenge>>
      createElement() {
    return _ChallengesNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChallengesNotifierProvider && other.conceptId == conceptId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, conceptId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ChallengesNotifierRef
    on AutoDisposeAsyncNotifierProviderRef<List<Challenge>> {
  /// The parameter `conceptId` of this provider.
  String get conceptId;
}

class _ChallengesNotifierProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ChallengesNotifier,
        List<Challenge>> with ChallengesNotifierRef {
  _ChallengesNotifierProviderElement(super.provider);

  @override
  String get conceptId => (origin as ChallengesNotifierProvider).conceptId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
