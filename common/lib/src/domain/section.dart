import 'package:common/src/domain/content_component.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'section.freezed.dart';
part 'section.g.dart';

@freezed

/// A section.
abstract class Section with _$Section {
  /// Create a section.
  const factory Section({
    required List<ContentComponent> content,
  }) = _Section;

  /// Deserialize a section from a JSON object.
  factory Section.fromJson(Map<String, dynamic> json) =>
      _$SectionFromJson(json);
}
