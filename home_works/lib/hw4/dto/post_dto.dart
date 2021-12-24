
import 'package:home_works/hw4/model/post.dart';
import 'package:home_works/hw4/model/user.dart';

class PostDto {
  PostDto({
    required this.user,
    required this.postImages,
    required this.likes,
    required this.post
  });

  User user;
  List<String> postImages;
  Post post;
  List<User> likes;
}