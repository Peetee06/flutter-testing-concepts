// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_component.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageComponent _$ImageComponentFromJson(Map<String, dynamic> json) =>
    ImageComponent(
      imageUri: const UriJsonConverter().fromJson(json['imageUri'] as String),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$ImageComponentToJson(ImageComponent instance) =>
    <String, dynamic>{
      'imageUri': const UriJsonConverter().toJson(instance.imageUri),
      'type': instance.$type,
    };

TextComponent _$TextComponentFromJson(Map<String, dynamic> json) =>
    TextComponent(
      text: Map<String, String>.from(json['text'] as Map),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$TextComponentToJson(TextComponent instance) =>
    <String, dynamic>{
      'text': instance.text,
      'type': instance.$type,
    };
