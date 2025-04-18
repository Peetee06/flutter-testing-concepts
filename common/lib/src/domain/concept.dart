import 'package:common/src/domain/section.dart';
import 'package:common/src/typedefs.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'concept.freezed.dart';
part 'concept.g.dart';

@freezed

/// A concept.
abstract class Concept with _$Concept {
  /// Create a concept.
  const factory Concept({
    required String id,
    required Localizations title,
    required List<Section> sections,
    required List<String> challengeIds,
  }) = _Concept;

  /// Deserialize a concept from a JSON object.
  factory Concept.fromJson(Map<String, dynamic> json) =>
      _$ConceptFromJson(json);
}
