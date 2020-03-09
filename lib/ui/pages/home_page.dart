import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../data/models/post_model.dart';
import '../../data/repositories/post_repository.dart';
import '../shared/widgets/avatar.dart';

class HomePage extends StatelessWidget {
  final postRepository = PostRepository(
    url: 'https://jsonplaceholder.typicode.com/posts',
    client: Dio(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context: context),
      body: _body(),
    );
  }

  Widget _appBar({@required BuildContext context}) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1.0,
      leading: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Avatar(url: 'https://picsum.photos/200'),
      ),
      title: Text(
        'Página Incial',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 8.0,
          ),
          child: Icon(
            Icons.info,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }

  Widget _body() {
    return Container(
      child: _postList(),
    );
  }

  Widget _postList() {
    return FutureBuilder(
      future: postRepository.fetchPosts(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final List<Post> posts = snapshot.data;

          return ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return _postItem(
                context: context,
                post: posts.elementAt(index),
              );
            },
          );
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Padding _postItem({@required BuildContext context, Post post}) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 4.0,
      ),
      child: Card(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Avatar(url: 'https://picsum.photos/seed/picsum/200'),
              SizedBox(width: 8.0),
              Flexible(
                child: Column(
                  children: <Widget>[
                    _texts(context: context, post: post),
                    _icons(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _texts({@required BuildContext context, Post post}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Flexible(
              child: Text(
                post.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(width: 5.0),
            Text(
              '@lipsum',
              style: TextStyle(
                color: Colors.grey,
                // fontSize: 12.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                '-',
                style: TextStyle(
                  color: Colors.grey,
                  // fontSize: 12.0,
                ),
              ),
            ),
            Text(
              '${Random().nextInt(59)} minutos',
              style: TextStyle(
                color: Colors.grey,
                // fontSize: 12.0,
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            post.body,
            style: TextStyle(fontSize: 12.0),
            textAlign: TextAlign.start,
            maxLines: 4,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _icons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Icon(Icons.chat, size: 16, color: Colors.grey),
        Icon(Icons.repeat, size: 16, color: Colors.grey),
        Icon(Icons.favorite, size: 16, color: Colors.grey),
        Icon(Icons.share, size: 16, color: Colors.grey),
      ],
    );
  }
}
