import 'package:flutter/material.dart';
import 'package:project_telegram/data/data.dart';
import 'package:project_telegram/user_model.dart';
import 'package:project_telegram/widgets/profile_avatar.dart';

class Story extends StatelessWidget{
  final List<User> friends;

  const Story({
    Key? key,
    required this.friends,
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
                                  imageUrl: currentUser.imageUrl
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
                          imageUrl: user.imageUrl
                      )
                  ),
                  Text(
                    user.name,
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
