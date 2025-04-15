import 'package:bloc_app/common/typedefs.dart';
import 'package:bloc_app/domain/section.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'concept.freezed.dart';
part 'concept.g.dart';

@freezed
class Concept with _$Concept {
  const factory Concept({
    required String id,
    required Localizations title,
    required List<Section> sections,
    required List<String> challengeIds,
  }) = _Concept;

  factory Concept.fromJson(Map<String, dynamic> json) =>
      _$ConceptFromJson(json);
}
