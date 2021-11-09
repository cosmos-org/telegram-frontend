import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:project_telegram/components/profileAvatar.dart';
import 'package:project_telegram/constants.dart';
import 'package:project_telegram/models/user.dart';

class Story extends StatelessWidget{
  final List<User> friends;
  final User currentUser;

  Story({
    Key? key,
    required this.friends,
    required this.currentUser
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      color: Colors.white,
      child: ListView.builder(
          padding:  const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 4.0,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: 1 + friends.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:[
                              Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: ProfileAvatar(
                                  imageUrl: currentUser.avatar!.filename
                              )
                              ),
                            Text(
                              'Your Story',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12.0,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]
              );
            }
            final User user = friends[index - 1];
            return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ProfileAvatar(
                          imageUrl: user.avatar!.filename
                      )
                  ),
                  Text(
                    user.username,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.0,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ]
            );
          }
      ),
    );
  }
}
