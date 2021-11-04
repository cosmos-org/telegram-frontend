
import 'package:project_telegram/user_model.dart';

class Post{
  final User user;
  final String caption;
  final String timeAgo;
  final List<String> imageUrl;
  final int likes;
  final int comments;

  const Post({
    required this.user,
    required this.caption,
    required this.timeAgo,
    required this.comments,
    required this.likes,
    required this.imageUrl
  });
}