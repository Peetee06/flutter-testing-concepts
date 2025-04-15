// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_component.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ImageComponentImpl _$$ImageComponentImplFromJson(Map<String, dynamic> json) =>
    _$ImageComponentImpl(
      imageUri: const UriJsonConverter().fromJson(json['imageUri'] as String),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$ImageComponentImplToJson(
        _$ImageComponentImpl instance) =>
    <String, dynamic>{
      'imageUri': const UriJsonConverter().toJson(instance.imageUri),
      'type': instance.$type,
    };

_$TextComponentImpl _$$TextComponentImplFromJson(Map<String, dynamic> json) =>
    _$TextComponentImpl(
      text: Map<String, String>.from(json['text'] as Map),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$TextComponentImplToJson(_$TextComponentImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'type': instance.$type,
    };
