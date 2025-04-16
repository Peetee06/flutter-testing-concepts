import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_app/common/typedefs.dart';
import 'package:riverpod_app/domain/section.dart';

part 'concept.freezed.dart';
part 'concept.g.dart';

@freezed
abstract class Concept with _$Concept {
  /// Represents a learning concept containing multiple sections and challenges.
  const factory Concept({
    required String id,
    required Localizations title,
    required List<Section> sections,
    required List<String> challengeIds,
  }) = _Concept;

  factory Concept.fromJson(Map<String, dynamic> json) =>
      _$ConceptFromJson(json);
}
