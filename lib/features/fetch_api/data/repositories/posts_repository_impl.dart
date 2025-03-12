import 'package:api_fetch/features/fetch_api/data/datasources/posts_remote_data_source.dart';
import 'package:api_fetch/features/fetch_api/domain/enitities/post_entity.dart';
import 'package:api_fetch/features/fetch_api/domain/repositories/posts_repository.dart';


// Implementation of PostsRepository
// Acts as a bridge between data sources and domain layer
class PostsRepositoryImpl implements PostsRepository{
  final PostsRemoteDataSource postsRemoteDataSource;

  PostsRepositoryImpl({required this.postsRemoteDataSource});

  // Fetches posts from the remote data source
  @override
  Future<List<PostEntity>> fetchPosts() async{
    return await postsRemoteDataSource.fetchPosts();
  }
}