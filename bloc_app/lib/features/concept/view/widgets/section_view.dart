import 'package:bloc_app/common/extensions/localizations_extension.dart';
import 'package:bloc_app/domain/content_component.dart';
import 'package:bloc_app/domain/section.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get_it/get_it.dart';

class ConceptSectionView extends StatelessWidget {
  const ConceptSectionView({
    required this.section,
    super.key,
  });

  final Section section;

  static const _verticalSpacing = 20.0;
  static const _imageSize = 200.0;

  @override
  Widget build(BuildContext context) {
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
              cacheManager: GetIt.I<BaseCacheManager>(),
            ),
        };
      },
    );
  }
}
