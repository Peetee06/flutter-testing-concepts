// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cache_manager_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(cacheManager)
const cacheManagerProvider = CacheManagerProvider._();

final class CacheManagerProvider extends $FunctionalProvider<BaseCacheManager?,
    BaseCacheManager?, BaseCacheManager?> with $Provider<BaseCacheManager?> {
  const CacheManagerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'cacheManagerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$cacheManagerHash();

  @$internal
  @override
  $ProviderElement<BaseCacheManager?> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  BaseCacheManager? create(Ref ref) {
    return cacheManager(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BaseCacheManager? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BaseCacheManager?>(value),
    );
  }
}

String _$cacheManagerHash() => r'36ba4b5cde4a890015bbce58ca82d0900edacb54';
