// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Answer _$AnswerFromJson(Map<String, dynamic> json) => _Answer(
      id: json['id'] as String,
      text: Map<String, String>.from(json['text'] as Map),
    );

Map<String, dynamic> _$AnswerToJson(_Answer instance) => <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
    };
