import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_telegram/components/header.dart';
import 'package:project_telegram/components/navigation_bar.dart';
import 'package:project_telegram/models/user.dart';

import '../../constants.dart';
import 'homepagedetail.dart';

class HomePage extends StatefulWidget {
  final User currentUser;
  const HomePage({Key? key, required this.currentUser}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState(currentUser: currentUser);
}

class _HomePageState extends State<HomePage> {
  final User currentUser;

  _HomePageState({required this.currentUser});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: Header(
            centerText: 'COSMOS',
            leftIcon:  Icons.add_circle_outline,
            leftOnPressed: () => print('add new post'),
            rightIcon: Icons.add_alert,
            rightOnPressed: () => print('notification'),
        ),
        body: HomePageDetail(currentUser: currentUser),
        bottomNavigationBar: NavigationBar()
    );
  }
}
