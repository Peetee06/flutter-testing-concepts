import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_app/domain/content_component.dart';

part 'section.freezed.dart';
part 'section.g.dart';

@freezed
class Section with _$Section {
  const factory Section({
    required List<ContentComponent> content,
  }) = _Section;

  factory Section.fromJson(Map<String, dynamic> json) =>
      _$SectionFromJson(json);
}
