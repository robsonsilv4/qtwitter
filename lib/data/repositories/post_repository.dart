import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../models/post_model.dart';

abstract class IPostRepository {
  Future<List<Post>> fetchPosts();
}

class PostRepository extends IPostRepository {
  final String url;
  final Dio client;

  PostRepository({
    @required this.url,
    @required this.client,
  });

  @override
  Future<List<Post>> fetchPosts() async {
    final List<Post> posts = [];

    try {
      final response = await client.get(url);

      response.data.forEach(
        (post) => posts.add(
          Post.fromJson(post),
        ),
      );

      return posts;
    } catch (error) {
      print(error.toString());
      return posts;
    }
  }
}
