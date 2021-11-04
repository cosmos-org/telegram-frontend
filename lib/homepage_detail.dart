import 'package:flutter/material.dart';
import 'package:project_telegram/data/data.dart';
import 'package:project_telegram/widgets/stories.dart';
import 'post_list.dart';

class Homepage_detail extends StatefulWidget {
  const Homepage_detail({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Homepage_detail();
}

class _Homepage_detail extends State<Homepage_detail> {
  @override
  Widget build(BuildContext context) {
    return  CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Container(
            padding: const EdgeInsets.all(2.0),
            color: Colors.white,
            child: Text(
              'Stories',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
          ),
          )
        ),
        SliverToBoxAdapter(
          child: Story(friends: friends)
        ),
        SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(2.0),
              color: Colors.white,
              child: Text(
                'Lastest Feed',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
        ),
        PostList(),
        ]
    );
  }
}