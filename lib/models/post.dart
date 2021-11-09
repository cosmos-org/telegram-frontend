
import 'image.dart';
import 'package:project_telegram/models/user.dart';

class Post {
  User author;
  String? described;
  String? timeAgo;
  List<Image>? images;
  List<String>? videos;
  List<User>? like;
  int? countComments;

  Post({
    required this.author,
    this.described,
    this.timeAgo,
    this.images,
    this.videos,
    this.like,
    this.countComments
  });

  factory Post.fromJson(Map<String, dynamic> json){
    return Post(
        author: User.fromJson(json['author']),
        described: json['described'],
        timeAgo: '10m',
        images: List<Image>.from(json['images'].map(
            (x) => Image.fromJson(x)
        )),
        videos: List<String>.from(json["videos"].map((x) => x)),
        like: json['like'],
        countComments: json['countComments']
    );}

  // Map<String, dynamic> toJson() => {
  //   "author": author.toJson(),
  //   "described": described,
  //   "timeAgo": timeAgo,
  //   "images": List<dynamic>.from(images!.map((x) => x.toJson())),
  //   "videos": List<dynamic>.from(videos!.map((x) => x)),
  //   "like": like,
  //   "countComments": countComments
  // };
}