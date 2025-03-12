import 'package:api_fetch/features/fetch_api/domain/enitities/post_entity.dart';

/// Abstract base class for all possible states of the Posts feature
abstract class PostsState {}

/// Initial state when the Posts feature is first initialized
class PostsInitial extends PostsState{}

/// State representing that posts are currently being loaded
class PostsLoading extends PostsState{}

/// State representing that posts have been successfully loaded
class PostsLoaded extends PostsState{
  // The list of posts that have been loaded
  final List<PostEntity> posts;

  PostsLoaded({required this.posts});
}

/// State representing that an error occurred while loading posts
class PostsError extends PostsState{
  // Error message describing what went wrong
  final String message;

  PostsError({required this.message});

}