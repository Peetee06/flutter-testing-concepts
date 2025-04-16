// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'section.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Section _$SectionFromJson(Map<String, dynamic> json) => _Section(
      content: (json['content'] as List<dynamic>)
          .map((e) => ContentComponent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SectionToJson(_Section instance) => <String, dynamic>{
      'content': instance.content.map((e) => e.toJson()).toList(),
    };
