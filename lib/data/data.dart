
import 'package:project_telegram/post_model.dart';
import 'package:project_telegram/user_model.dart';

final User currentUser = User(
    name: 'Van Anh',
    imageUrl: 'https://images.unsplash.com/photo-1578133671540-edad0b3d689e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1351&q=80');

final List<User> friends=[
   User(
    name: 'Son',
    imageUrl: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  ),
  User(
      name: 'Lam',
      imageUrl: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80'
  ),
  User(
      name: 'Duong',
      imageUrl: 'https://images.unsplash.com/photo-1492562080023-ab3db95bfbce?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1331&q=80'
  ),
  User(
      name: 'Huy',
      imageUrl: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=80'
  )
];

final List<Post> posts = [
  Post(
    user: currentUser,
    caption: 'Hôm nay trời đẹp thế nhở ỏ ỏ ỏ',
    timeAgo: '10m',
    imageUrl: ['https://images.unsplash.com/photo-1525253086316-d0c936c814f8'],
    likes: 1000,
    comments: 200,
  ),
  Post(
      user: friends[0],
      caption: 'Vân Anh thật xinh xắn',
      timeAgo: '1m',
      imageUrl: ['https://images.unsplash.com/photo-1575535468632-345892291673?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
        'https://images.unsplash.com/photo-1475688621402-4257c812d6db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1267&q=80'],
      comments: 1000,
      likes: 15,
  ),
  Post(
      user: friends[1],
      caption: 'say hi',
      timeAgo: '5m',
      comments: 0,
      likes: 5,
      imageUrl: []
  ),
];