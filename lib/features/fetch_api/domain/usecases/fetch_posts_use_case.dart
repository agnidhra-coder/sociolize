import 'package:api_fetch/features/fetch_api/domain/enitities/post_entity.dart';
import 'package:api_fetch/features/fetch_api/domain/repositories/posts_repository.dart';

/// Use case for fetching posts
/// Represents a specific action in the application
class FetchPostsUseCase {
  final PostsRepository repository;

  FetchPostsUseCase({required this.repository});
  
  Future<List<PostEntity>> call() async{
    return repository.fetchPosts();
  }
}