
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:project_telegram/components/post/post_container.dart';
import 'package:project_telegram/constants.dart';
import 'package:project_telegram/models/post.dart';


class PostList extends StatelessWidget {

  List<Post>? posts = Posts().getListPosts() as List<Post>?;
  PostList({
    Key? key,
    this.posts}
    ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
                (context, index){
              final Post post = posts![index];
              return PostContainer(post: post);
            }
        ));
  }
}

class Posts {
  final String url = hostname + postGetListEndpoint;

  Future<List<Post>> getListPosts() async {
    Response resp = await get(url);
    int statusCode = resp.statusCode;
    print(statusCode);
    if (statusCode == 200) {
      List<dynamic> body = jsonDecode(resp.body);
      List<dynamic> P = body
          .map(
              (dynamic item) => Post.fromJson(item)
      ).toList();
      List<Post> posts = P.cast<Post>();
      return posts;
    } else {
      throw "Unable to retrieve posts.";
    }
  }
}

