import 'package:json_annotation/json_annotation.dart';

part 'demo.g.dart';

@JsonSerializable()
class Demo {
  Demo();

  String name;
  String email;
  String age;
  
  factory Demo.fromJson(Map<String, dynamic> json) => _$DemoFromJson(json);

  Map<String, dynamic> toJson() => _$DemoToJson(this);
}