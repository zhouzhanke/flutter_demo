// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'demo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Demo _$DemoFromJson(Map<String, dynamic> json) {
  return Demo()
    ..name = json['name'] as String
    ..email = json['email'] as String
    ..age = json['age'] as String;
}

Map<String, dynamic> _$DemoToJson(Demo instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'age': instance.age
    };
