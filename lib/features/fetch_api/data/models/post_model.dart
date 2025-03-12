import 'package:api_fetch/features/fetch_api/domain/enitities/post_entity.dart';

/// Model class for Post data from API
/// Extends PostEntity to maintain clean architecture
class PostModel extends PostEntity {
  PostModel(
      {required super.userId,
      required super.id,
      required super.title,
      required super.body});

  // Factory constructor to create a PostModel from JSON
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        body: json['body']
      );
  }
}
