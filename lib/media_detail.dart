import 'package:flutter/material.dart';

import 'package:project_telegram/actionbtn.dart';

class MediaDetail extends StatefulWidget {
  @override
  _MediaDetail createState() => _MediaDetail();
}
List<String> storyUrl = [
  "https://images.unsplash.com/photo-1600055882386-5d18b02a0d51?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=621&q=80",
  "https://images.unsplash.com/photo-1600174297956-c6d4d9998f14?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
  "https://images.unsplash.com/photo-1600008646149-eb8835bd979d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=666&q=80",
  "https://images.unsplash.com/photo-1502920313556-c0bbbcd00403?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=967&q=80",
];
class _MediaDetail extends State<MediaDetail> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context){
      return GridView.count(
        crossAxisCount:2,
        mainAxisSpacing: 5.0,
        crossAxisSpacing: 5.0,
        padding: const EdgeInsets.all(5.0),
        children: media_fill(4),//Where is this function ?
      );
  }
  List<Widget> media_fill(numberOfTiles) {
    List<Container> containers = new List<Container>.generate(numberOfTiles,
            (int index) {
          //index = 0, 1, 2,...
          final imageName = storyUrl[index];
          return new Container(
            child: new Image.network(
                imageName,
                fit: BoxFit.fill
            ),
          );
        });
    return containers;
  }
}

class CommentDetail extends StatefulWidget {

  @override
  _CommentDetail createState() => _CommentDetail();
}
class _CommentDetail extends State<CommentDetail> {
  List<List<String>> comments = [
    [  "https://images.unsplash.com/photo-1457449940276-e8deed18bfff?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
      'User 1','6h45','Comment1'],
    [  "https://images.unsplash.com/photo-1457449940276-e8deed18bfff?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
      'User 1','6h45','Comment1'],

  ];
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: genCommentBoxs(comments),
    );
  }
  List<Widget> genCommentBoxs(comments){
    List<Widget> arr  = [];
    var iter = comments.iterator;
    while (iter.moveNext()) {
      var curent_comment_infor = iter.current;
      Widget commentBox = Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(curent_comment_infor[0]),
            radius: 25.0,
          ),
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  curent_comment_infor[1],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  curent_comment_infor[3],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  curent_comment_infor[2],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Divider(
                  thickness: 1.5,
                  color: Color(0xFF505050),
                )
              ],
            ),
          ),
        ]
      );
      arr.add(commentBox);

    }
    return arr;
  }
}

