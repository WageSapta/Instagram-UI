import 'package:flutter/material.dart';
import 'package:instagram_ui/models/highlight_model.dart';
import 'package:instagram_ui/models/post_model.dart';
import 'package:instagram_ui/models/status_model.dart';
import 'package:instagram_ui/models/user_model.dart';

class DataProvider extends ChangeNotifier {
  final UserModel _user = UserModel(
    id: "1",
    username: "slvr",
    name: "Silverdevil",
    profile:
        "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60",
    bio: "Flutter developer",
  );

  final List<UserModel> _friends = [
    UserModel(
      id: "2",
      username: "AlexSmith89",
      name: "Alex",
      profile:
          "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8dXNlcnxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60",
      bio: "this is alex",
      status: [
        StatusModel(
          description: "healing",
          image:
              "https://images.unsplash.com/photo-1498598457418-36ef20772bb9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dmlld3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60",
          date: DateTime.now().subtract(const Duration(hours: 3, minutes: 30)),
        ),
        StatusModel(
          description: "sunset",
          image:
              "https://images.unsplash.com/photo-1521352055584-782f2bedec4c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fHZpZXd8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60",
          date: DateTime.now().subtract(const Duration(hours: 1, minutes: 10)),
        ),
      ],
    ),
    UserModel(
      id: "3",
      username: "LilyJohnson23",
      name: "Lily",
      profile:
          "https://images.unsplash.com/photo-1546961329-78bef0414d7c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fHVzZXJ8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60",
      bio: "this is lily",
      status: [
        StatusModel(
          description: "i love sun",
          image:
              "https://images.unsplash.com/photo-1474418397713-7ede21d49118?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8dmlldyUyMHdvbWVufGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60",
          date: DateTime.now().subtract(const Duration(hours: 1, minutes: 30)),
        ),
      ],
      highlights: [
        HighlightModel(
          images: [
            HighlightImageModel(
              image:
                  "https://media.istockphoto.com/id/1384618716/photo/group-of-happy-friends-taking-selfie-pic-outside-happy-different-young-people-having-fun.webp?b=1&s=170667a&w=0&k=20&c=wWtYoTCWJUZqJK-ehBglTVxA4PtuDUZf1FVWLP2ddcA=",
              date: DateTime.now().subtract(
                const Duration(days: 20, hours: 3, minutes: 30),
              ),
            )
          ],
          name: "friends",
        )
      ],
    ),
    UserModel(
      id: "4",
      username: "KevinDavis47",
      name: "Kevin",
      profile:
          "https://images.unsplash.com/photo-1639149888905-fb39731f2e6c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fHVzZXJ8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60",
      bio: "this is kevin",
      status: [
        StatusModel(
          description: "my setup before work",
          image:
              "https://images.unsplash.com/photo-1499951360447-b19be8fe80f5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8dmlldyUyMHdvcmt8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60",
          date: DateTime.now().subtract(const Duration(hours: 1, minutes: 30)),
        ),
      ],
      posts: [
        PostModel(
          username: "KevinDavis47",
          profile:
              "https://images.unsplash.com/photo-1639149888905-fb39731f2e6c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fHVzZXJ8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60",
              description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
          images: [
            "https://images.unsplash.com/photo-1568374414300-12db9c7a1922?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8dmlldyUyMGxhbmRzY2FwZSUyMDE2JTNBOXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60",
            "https://images.unsplash.com/photo-1606667772237-5981957c6574?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8dmlldyUyMGxhbmRzY2FwZSUyMDE2JTNBOXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60"
          ],
          likes: ["LilyJohnson23"],
          comments: [
            UserCommentModel(
                username: "LilyJohnson23",
                comment: "good",
                date: DateTime.now()),
          ],
          date: DateTime.now()
              .subtract(const Duration(days: 20, hours: 5, minutes: 20)),
        )
      ],
    ),
    UserModel(
      id: "5",
      username: "EmilyBrown56",
      name: "Emily",
      profile:
          "https://images.unsplash.com/photo-1619895862022-09114b41f16f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fHVzZXJ8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60",
      bio: "this is emily",
      posts: [
        PostModel(
          username: "EmilyBrown56",
          profile:
              "https://images.unsplash.com/photo-1619895862022-09114b41f16f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fHVzZXJ8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60",
          description: "my journey",
          images: [
            "https://images.unsplash.com/photo-1558695419-b5a0ddff172f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fHZpZXdzJTIwc3Vuc2V0fGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60",
            "https://images.unsplash.com/photo-1629601255171-cd39e46474bf?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fHZpZXdzJTIwc3Vuc2V0fGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60",
          ],
          likes: ["AlexSmith89", "LilyJohnson23"],
          comments: [
            UserCommentModel(
                username: "AlexSmith89", comment: "good", date: DateTime.now()),
          ],
          date: DateTime.now()
              .subtract(const Duration(days: 10, hours: 5, minutes: 20)),
        ),
      ],
    ),
  ];

  final List<PostModel> _posts = [
    PostModel(
      username: "KevinDavis47",
      profile:
          "https://images.unsplash.com/photo-1639149888905-fb39731f2e6c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fHVzZXJ8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
      images: [
        "https://images.unsplash.com/photo-1568374414300-12db9c7a1922?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8dmlldyUyMGxhbmRzY2FwZSUyMDE2JTNBOXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60",
        "https://images.unsplash.com/photo-1606667772237-5981957c6574?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8dmlldyUyMGxhbmRzY2FwZSUyMDE2JTNBOXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60"
      ],
      likes: ["LilyJohnson23"],
      comments: [
        UserCommentModel(
            username: "LilyJohnson23", comment: "good", date: DateTime.now()),
      ],
      date: DateTime.now()
          .subtract(const Duration(days: 20, hours: 5, minutes: 20)),
    ),
    PostModel(
      username: "EmilyBrown56",
      profile:
          "https://images.unsplash.com/photo-1619895862022-09114b41f16f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fHVzZXJ8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60",
          description: "my journey",
      images: [
        "https://images.unsplash.com/photo-1558695419-b5a0ddff172f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fHZpZXdzJTIwc3Vuc2V0fGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60",
        "https://images.unsplash.com/photo-1629601255171-cd39e46474bf?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fHZpZXdzJTIwc3Vuc2V0fGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60",
      ],
      likes: ["AlexSmith89", "LilyJohnson23"],
      comments: [
        UserCommentModel(
            username: "AlexSmith89", comment: "good", date: DateTime.now()),
      ],
      date: DateTime.now()
          .subtract(const Duration(days: 10, hours: 5, minutes: 20)),
    ),
  ];

  UserModel get user => _user;
  List<UserModel> get friends => _friends;
  List<PostModel> get posts => _posts;
}
