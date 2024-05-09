import 'package:json_annotation/json_annotation.dart';

part 'issue_data_model.g.dart';

@JsonSerializable()
class Issue {
  final String title;
  final DateTime createdAt;

  Issue({required this.title, required this.createdAt});

  factory Issue.fromJson(Map<String, dynamic> json) =>
      _$IssueFromJson(json);

}