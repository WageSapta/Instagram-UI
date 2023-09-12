class PostModel {
  final String username;
  final String profile;
  final String description;
  final List<String> images;
  final List<String> likes;
  final List<UserCommentModel> comments;
  final DateTime date;
  PostModel({
    required this.username,
    required this.profile,
    required this.description,
    required this.images,
    required this.likes,
    required this.comments,
    required this.date,
  });
}

class UserCommentModel {
  final String username;
  final String comment;
  final DateTime date;

  UserCommentModel({
    required this.username,
    required this.comment,
    required this.date,
  });
}
