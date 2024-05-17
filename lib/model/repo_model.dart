class RepositoryModel {
  final String name;
  final String description;
  bool isFavorite;

  RepositoryModel(
      {required this.name, required this.description, this.isFavorite = false});

  factory RepositoryModel.fromJson(Map<String, dynamic> json) {
    return RepositoryModel(
      name: json['full_name'],
      description: json['description'] ?? 'No description',
    );
  }
}
