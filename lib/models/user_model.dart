import 'package:instagram_ui/models/highlight_model.dart';
import 'package:instagram_ui/models/post_model.dart';
import 'package:instagram_ui/models/status_model.dart';
import 'package:instagram_ui/models/tag_model.dart';
import 'package:instagram_ui/models/video_model.dart';

class UserModel {
  final String id;
  final String username;
  final String name;
  final String profile;
  final String bio;
  final List<HighlightModel>? highlights;
  final List<PostModel>? posts;
  final List<VideoModel>? videos;
  final List<TagModel>? tags;
  final List<StatusModel>? status;
  UserModel({
    required this.id,
    required this.username,
    required this.name,
    required this.profile,
    required this.bio,
    this.highlights,
    this.status,
    this.posts,
    this.videos,
    this.tags,
  });
}
