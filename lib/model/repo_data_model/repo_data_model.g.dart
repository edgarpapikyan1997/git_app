// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepoDataModel _$RepoDataModelFromJson(Map<String, dynamic> json) =>
    RepoDataModel(
      htmlUrl: json['html_url'] as String,
      watchersCount: (json['watchers_count'] as num).toInt(),
      language: json['language'] as String,
      description: json['description'] as String,
      name: json['name'] as String,
      owner: json['owner'] as String,
    );

Map<String, dynamic> _$RepoDataModelToJson(RepoDataModel instance) =>
    <String, dynamic>{
      'html_url': instance.htmlUrl,
      'watchers_count': instance.watchersCount,
      'language': instance.language,
      'description': instance.description,
      'name': instance.name,
      'owner': instance.owner,
    };
