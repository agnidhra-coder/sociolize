import 'dart:math';

import 'package:api_fetch/features/fetch_api/presentation/bloc/posts_bloc.dart';
import 'package:api_fetch/features/fetch_api/presentation/bloc/posts_event.dart';
import 'package:api_fetch/features/fetch_api/presentation/bloc/posts_state.dart';
import 'package:api_fetch/features/fetch_api/presentation/widgets/post_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  // Controller for scrollable list
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Fetch posts when page loads
    BlocProvider.of<PostsBloc>(context).add(FetchPosts());
  }

  // Handler for pull-to-refresh
  Future<void> _handleRefresh() async {
    // Trigger posts fetch
    BlocProvider.of<PostsBloc>(context).add(FetchPosts());

    // Wait for posts to load before completing refresh
    await for (final state in BlocProvider.of<PostsBloc>(context).stream) {
      if (state is PostsLoaded) {
        break;
      }
    }
  }

  @override
  void dispose() {
    // Clean up scroll controller
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 20, 22, 39),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 48),
            child: Text(
              'Recent Posts',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 32.0,
                fontWeight: FontWeight.w500
              ),
            ),
          ),

          // Main content area
          Expanded(
            child: BlocBuilder<PostsBloc, PostsState>(builder: (context, state) {
              if (state is PostsLoading) {
                // Show loading indicator while fetching posts
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.grey,
                  )
                );
              } 
              // Show posts when loaded
              else if (state is PostsLoaded) {
                return ScrollbarTheme(
                  data: ScrollbarThemeData(
                    thickness: WidgetStateProperty.all(6),
                    radius: Radius.circular(10),
                    crossAxisMargin: 10,
                    mainAxisMargin: 10,
                    thumbColor: WidgetStateProperty.all(const Color.fromARGB(255, 155, 155, 155))
                  ),
                  child: Scrollbar(
                    controller: _scrollController,
                    thumbVisibility: false,
                    interactive: true,
                    child: RefreshIndicator(
                      onRefresh: _handleRefresh,
                      color: const Color.fromARGB(255, 56, 56, 56),
                      strokeWidth: 2.3,
                      child: ListView.builder(
                        primary: false,
                        shrinkWrap: true,
                        physics: const AlwaysScrollableScrollPhysics(),
                        controller: _scrollController,
                        itemCount: state.posts.length,
                        itemBuilder: (context, index) {
                          // Get a random post instead of sequential
                          final randIndex = Random().nextInt(state.posts.length);
                          final post = state.posts[randIndex];
                          return PostTile(
                            id: post.id.toString(),
                            title: post.title,
                            body: post.body,
                            isLastItem: index == state.posts.length - 1,
                          );
                        }),
                    ),
                  ),
                );
              }
              // Show error message if loading fails
               else if (state is PostsError) {
                return Center(
                  child: Text(state.message),
                );
              }
              // Default state - no posts found
              return Center(
                child: Text(
                  'No Posts Found',
                  style: GoogleFonts.poppins(color: Colors.grey),
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
