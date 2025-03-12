import 'package:api_fetch/features/fetch_api/domain/usecases/fetch_posts_use_case.dart';
import 'package:api_fetch/features/fetch_api/presentation/bloc/posts_event.dart';
import 'package:api_fetch/features/fetch_api/presentation/bloc/posts_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// BLoC for managing posts state
/// Handles events and emits states
class PostsBloc extends Bloc<PostsEvent, PostsState>{
  final FetchPostsUseCase fetchPostsUseCase;

  PostsBloc({required this.fetchPostsUseCase}) : super (PostsInitial()){
    // Register event handlers
    on<FetchPosts> (_onFetchPosts);
  }

  /// Handler for FetchPosts event
  /// Emits loading state, fetches posts, and emits loaded or error state
  Future<void> _onFetchPosts(FetchPosts event, Emitter<PostsState> emit) async {
    emit(PostsLoading());
    try{
      final posts = await fetchPostsUseCase();
      // Emit loaded state with posts
      emit(PostsLoaded(posts: posts));
    } catch(e){
      // Emit error state if fetching fails
      emit(PostsError(message: 'Failed to load posts'));
      print(e);
    }
  }

}