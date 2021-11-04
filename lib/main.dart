import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_telegram/homepage_detail.dart';

var appbarcolor = Colors.blue;
var backgroundColor = Colors.grey[200];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'COSMOS',
      home: MyHomePage()
      );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: appbarcolor,
        leading: IconButton(
          icon: const Icon(Icons.add_circle_outline),
          tooltip: 'Add new post',
          onPressed: () {
            // ScaffoldMessenger.of(context).showSnackBar(
            //     const SnackBar(content: Text('Post')));
          },
        ),
        title: const Center(
          child: Text('CosMos'),
        ),
        actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add_alert),
              tooltip: 'Show Notification',
              onPressed: () {
                // ScaffoldMessenger.of(context).showSnackBar(
                //     const SnackBar(content: Text('Notification')));
                },
            ),
          ]
      ),
      body: const Homepage_detail(),
      bottomNavigationBar:   BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: appbarcolor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.90),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        // onTap: (value) {
        //   // Respond to item press.
        // },
        items: [
          BottomNavigationBarItem(
            title: Text('Home Page'),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text('Search'),
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            title: Text('Message'),
            icon: Icon(Icons.message),
          ),
          BottomNavigationBarItem(
            title: Text('Profile'),
            icon: Icon(Icons.person),
          ),
        ],
      )
    );
  }
}
