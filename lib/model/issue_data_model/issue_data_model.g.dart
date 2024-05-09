// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'issue_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Issue _$IssueFromJson(Map<String, dynamic> json) => Issue(
      title: json['title'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$IssueToJson(Issue instance) => <String, dynamic>{
      'title': instance.title,
      'createdAt': instance.createdAt.toIso8601String(),
    };
