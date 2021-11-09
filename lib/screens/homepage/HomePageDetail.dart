import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:project_telegram/components/post/postList.dart';
import 'package:project_telegram/constants.dart';
import 'package:project_telegram/models/user.dart';
import 'package:project_telegram/screens/homepage/widgets/stories.dart';

class HomePageDetail extends StatefulWidget {
  final User currentUser;
  const HomePageDetail({Key? key, required this.currentUser}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageDetail(currentUser: currentUser);
}

class _HomePageDetail extends State<HomePageDetail> {
   User currentUser;
  _HomePageDetail({
    required this.currentUser,
  });

   @override
  Widget build(BuildContext context) {
     final List<User> friends = Friend().getFriendList(currentUser: currentUser) as List<User>;
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
            child: Story(currentUser: currentUser,friends: friends)
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


class Friend{
  String url = hostname + friendGetListEndpoint;

  Future<List<User>> getFriendList({required User currentUser}) async {
    Map<String, String> headers = {"Content-type": "application/json"};
    headers["authorization"]=  "bearer " + currentUser.token!;
    print(currentUser.id);
    print(url);
    Response resp = await post(url,
      headers: headers,
    );
    int statusCode = resp.statusCode;
    print(statusCode);
    if (statusCode == 200) {
      final body = jsonDecode(resp.body);
      print(body);
      print(body["data"]["friends"]);

      List<dynamic> U = body["data"]["friends"]
          .map(
              (item) => User.getFriend(item)
      ).toList();
      List<User> users = U.cast<User>();
      return users;
    } else {
      throw "Unable to retrieve list friend.";
    }
  }
}