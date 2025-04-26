import 'package:cached_network_image/cached_network_image.dart';
import 'package:common/common.dart' hide Localizations;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/data/services/cache_manager_provider.dart';

class SectionView extends ConsumerWidget {
  const SectionView({required this.section, super.key});
  final Section section;

  static const _verticalSpacing = 20.0;
  static const _imageSize = 200.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cacheManager = ref.watch(cacheManagerProvider);
    return ListView.separated(
      separatorBuilder: (context, index) =>
          const SizedBox(height: _verticalSpacing),
      itemCount: section.content.length,
      itemBuilder: (context, index) {
        final component = section.content[index];
        return switch (component) {
          TextComponent(:final text) => Text(
              text.localizedTo(Localizations.localeOf(context)),
            ),
          ImageComponent(:final imageUri) => CachedNetworkImage(
              imageUrl: imageUri.toString(),
              fit: BoxFit.scaleDown,
              width: _imageSize,
              height: _imageSize,
              cacheManager: cacheManager,
            ),
        };
      },
    );
  }
}
