// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'concept_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$conceptNotifierHash() => r'28f14a871e6e434ee6a125ccb3a0f274c8b63594';

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

abstract class _$ConceptNotifier
    extends BuildlessAutoDisposeAsyncNotifier<Concept> {
  late final String id;

  FutureOr<Concept> build(
    String id,
  );
}

/// See also [ConceptNotifier].
@ProviderFor(ConceptNotifier)
const conceptNotifierProvider = ConceptNotifierFamily();

/// See also [ConceptNotifier].
class ConceptNotifierFamily extends Family<AsyncValue<Concept>> {
  /// See also [ConceptNotifier].
  const ConceptNotifierFamily();

  /// See also [ConceptNotifier].
  ConceptNotifierProvider call(
    String id,
  ) {
    return ConceptNotifierProvider(
      id,
    );
  }

  @override
  ConceptNotifierProvider getProviderOverride(
    covariant ConceptNotifierProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'conceptNotifierProvider';
}

/// See also [ConceptNotifier].
class ConceptNotifierProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ConceptNotifier, Concept> {
  /// See also [ConceptNotifier].
  ConceptNotifierProvider(
    String id,
  ) : this._internal(
          () => ConceptNotifier()..id = id,
          from: conceptNotifierProvider,
          name: r'conceptNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$conceptNotifierHash,
          dependencies: ConceptNotifierFamily._dependencies,
          allTransitiveDependencies:
              ConceptNotifierFamily._allTransitiveDependencies,
          id: id,
        );

  ConceptNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  FutureOr<Concept> runNotifierBuild(
    covariant ConceptNotifier notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(ConceptNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: ConceptNotifierProvider._internal(
        () => create()..id = id,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ConceptNotifier, Concept>
      createElement() {
    return _ConceptNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ConceptNotifierProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ConceptNotifierRef on AutoDisposeAsyncNotifierProviderRef<Concept> {
  /// The parameter `id` of this provider.
  String get id;
}

class _ConceptNotifierProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ConceptNotifier, Concept>
    with ConceptNotifierRef {
  _ConceptNotifierProviderElement(super.provider);

  @override
  String get id => (origin as ConceptNotifierProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
