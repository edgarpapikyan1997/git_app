import 'package:json_annotation/json_annotation.dart';

part 'repo_data_model.g.dart';

@JsonSerializable()
class RepoDataModel {
  @JsonKey(name: 'html_url')
  final String htmlUrl;
  @JsonKey(name: 'watchers_count')
  final int watchersCount;
  final String language;
  final String description;
  final String name;
  final String owner;

  RepoDataModel({
    required this.htmlUrl,
    required this.watchersCount,
    required this.language,
    required this.description,
    required this.name,
    required this.owner,
  });

  factory RepoDataModel.fromJson(Map<String, dynamic> json) =>
      _$RepoDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$RepoDataModelToJson(this);

  static List<RepoDataModel> mapJSONStringToList(List<dynamic> jsonList) {
    return jsonList
        .map((json) => RepoDataModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
