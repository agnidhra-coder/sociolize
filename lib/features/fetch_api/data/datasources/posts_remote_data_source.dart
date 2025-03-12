import 'dart:convert';

import 'package:api_fetch/features/fetch_api/data/models/post_model.dart';
import 'package:http/http.dart' as http;

// Responsible for fetching post data from remote API
class PostsRemoteDataSource {
  final String baseUrl = "https://jsonplaceholder.typicode.com";

  // Fetches posts from the remote API
  // Returns a list of PostModel objects
  // Throws an exception if the request fails
  Future<List<PostModel>> fetchPosts() async{
    // Make GET request to the posts endpoint
    final response = await http.get(
      Uri.parse('$baseUrl/posts'),
    );

    // Check if request was successful
    if(response.statusCode == 200){
      // Parse JSON response into a List and then to PostModel
      List data = jsonDecode(response.body);
      return data.map((json) => PostModel.fromJson(json)).toList();
    } else {
        throw Exception(
          'Failed to fetch posts'
        );
    }
  }
}