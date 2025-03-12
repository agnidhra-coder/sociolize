import 'package:api_fetch/features/fetch_api/data/datasources/posts_remote_data_source.dart';
import 'package:api_fetch/features/fetch_api/data/repositories/posts_repository_impl.dart';
import 'package:api_fetch/features/fetch_api/domain/usecases/fetch_posts_use_case.dart';
import 'package:api_fetch/features/fetch_api/presentation/bloc/posts_bloc.dart';
import 'package:api_fetch/features/fetch_api/presentation/pages/posts_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  // Initialize repository
  final postsRepository = PostsRepositoryImpl(postsRemoteDataSource: PostsRemoteDataSource());
  runApp(MyApp(postsRepository: postsRepository,));
}

class MyApp extends StatelessWidget {
  final PostsRepositoryImpl postsRepository;

  const MyApp({super.key, required this.postsRepository});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      // Provide BLoCs to the widget tree
      providers: [
        BlocProvider(
          create: (_) => PostsBloc(
            fetchPostsUseCase: FetchPostsUseCase(repository: postsRepository)
          )
        )
      ], 
      child: MaterialApp(
        title: 'Sociolize',
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(),
        ),
        debugShowCheckedModeBanner: false,
        home: PostsPage(),
      )
    );
  }
}
