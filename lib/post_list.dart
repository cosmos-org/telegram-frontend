
import 'package:flutter/cupertino.dart';
import 'package:project_telegram/post_model.dart';
import 'package:project_telegram/widgets/post_container.dart';

import 'data/data.dart';

class PostList extends StatelessWidget {
  const PostList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
                (context, index){
              final Post post = posts[index];
              return PostContainer(post: post);
            }
        ));
  }
}
