import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:project_telegram/components/post/post_list.dart';
import 'package:project_telegram/constants.dart';
import 'package:project_telegram/models/user.dart';
import 'package:project_telegram/screens/homepage/widgets/stories.dart';
import 'dart:async';

class HomePageDetail extends StatefulWidget {
  final User currentUser;
  const HomePageDetail({Key? key, required this.currentUser}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageDetail(currentUser: currentUser);
}

class _HomePageDetail extends State<HomePageDetail> {
   User currentUser;
   late Friend friend;

  _HomePageDetail({
    required this.currentUser,
  });

  @override
  void initState() {
    super.initState();
    friend = Friend();
  }

   @override
  Widget build(BuildContext context) {
     // List<User> friends = await Friend().getFriendList(currentUser: currentUser);
     return FutureBuilder<List<User>>(
       future: friend.getFriendList(currentUser: currentUser),
       builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
         if (!snapshot.hasData) {
           // while data is loading:
           return const Center(
             child: CircularProgressIndicator(),
           );
         } else {
           // data loaded:
           final friends = snapshot.data!;
           return CustomScrollView(
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
                 // PostList(),
               ]
           );
         }
       },
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
      // print('User list')
      // print(users)
      return users;
    } else {
      throw "Unable to retrieve list friend.";
    }
  }
}