class VideoModel {
  final int id;
  final int idUser;
  final int likes;
  final int comments;
  final int share;
  final String description;
  VideoModel({
    required this.id,
    required this.idUser,
    required this.likes,
    required this.comments,
    required this.share,
    required this.description,
  });
}
