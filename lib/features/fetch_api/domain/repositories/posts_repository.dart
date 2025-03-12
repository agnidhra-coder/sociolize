import 'package:api_fetch/features/fetch_api/domain/enitities/post_entity.dart';

abstract class PostsRepository {
  /// Fetches posts from a data source
  Future<List<PostEntity>> fetchPosts();
}