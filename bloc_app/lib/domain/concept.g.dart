// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'concept.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConceptImpl _$$ConceptImplFromJson(Map<String, dynamic> json) =>
    _$ConceptImpl(
      id: json['id'] as String,
      title: Map<String, String>.from(json['title'] as Map),
      sections: (json['sections'] as List<dynamic>)
          .map((e) => Section.fromJson(e as Map<String, dynamic>))
          .toList(),
      challengeIds: (json['challengeIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$ConceptImplToJson(_$ConceptImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'sections': instance.sections,
      'challengeIds': instance.challengeIds,
    };
