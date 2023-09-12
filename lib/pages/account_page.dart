import "dart:math" as mth;
import "dart:developer";

import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:provider/provider.dart';

import 'package:instagram_ui/provider/data_provider.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => AccountPageState();
}

class AccountPageState extends State<AccountPage> {
  final refreshKey = GlobalKey<RefreshIndicatorState>();
  final random = mth.Random();
  int following = 100;
  int follower = 110;

  void showModal(BuildContext context, DataProvider provider) {
    String selectedUsername = provider.user.username;
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          decoration: ShapeDecoration(
            color: Colors.grey[900],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 5,
                width: MediaQuery.of(context).size.width / 10,
                margin: const EdgeInsets.only(
                  bottom: 10.0,
                ),
                decoration: const ShapeDecoration(
                  shape: StadiumBorder(),
                  color: Colors.grey,
                ),
              ),
              Column(
                children: List.generate(
                  1,
                  (index) => Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: ListTile(
                      onTap: () {
                        // replace with another username
                        setState(() {
                          selectedUsername = provider.user.username;
                        });
                        log(selectedUsername);
                      },
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 26,
                        child: CircleAvatar(
                          radius: 25.0,
                          backgroundColor: Colors.grey[900],
                          backgroundImage:
                              Image.network(provider.user.profile).image,
                        ),
                      ),
                      title: Text(
                        provider.user.username,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: Radio(
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent),
                        value: provider.user.username,
                        groupValue: selectedUsername,
                        onChanged: (newValue) {
                          log("$newValue");
                        },
                      ),
                    ),
                  ),
                ).followedBy([
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: ListTile(
                      onTap: () {
                        log("Add Account");
                      },
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 26,
                        child: CircleAvatar(
                          radius: 25.0,
                          backgroundColor: Colors.grey[900],
                          child: const Icon(
                            Icons.add_rounded,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ),
                      title: const Text(
                        "Add Account",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ]).toList(),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> handleRefresh() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      follower = random.nextInt(100) + 100;
      following = random.nextInt(100) + 50;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(
      builder: (context, value, child) {
        return DefaultTabController(
          initialIndex: 0,
          length: value.user.videos == null ? 2 : 3,
          child: Scaffold(
            appBar: AppBar(
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      value.user.username,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showModal(context, value);
                    },
                    child: const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 20,
                    ),
                  ),
                ],
              ),
              actions: [
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.add_box_outlined)),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.menu_rounded)),
                const SizedBox(
                  width: 10.0,
                ),
              ],
            ),
            body: LiquidPullToRefresh(
              key: refreshKey,
              onRefresh: handleRefresh,
              showChildOpacityTransition: false,
              animSpeedFactor: 3,
              springAnimationDurationInMilliseconds: 300,
              color: Colors.grey[900],
              backgroundColor: Colors.grey,
              height: 50,
              child: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                      expandedHeight: 200,
                      collapsedHeight: 0,
                      toolbarHeight: 0,
                      pinned: true,
                      flexibleSpace: FlexibleSpaceBar(
                        collapseMode: CollapseMode.pin,
                        background: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 5,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              profilePostsFolloweFollowing(value),
                              const SizedBox(
                                height: 15.0,
                              ),
                              bio(value),
                              const SizedBox(
                                height: 8.0,
                              ),
                              rowButtons(),
                            ],
                          ),
                        ),
                      ),
                      bottom: TabBar(
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorColor: Colors.white,
                        indicatorWeight: 1,
                        labelColor: Colors.white,
                        dividerColor: Colors.grey[900]!,
                        unselectedLabelColor: Colors.grey,
                        tabs: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.grid_on_rounded),
                          ),
                          if (value.user.videos != null)
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.movie_creation_outlined),
                            ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.assignment_ind_outlined),
                          ),
                        ],
                      ),
                    ),
                  ];
                },
                body: TabBarView(
                  children: [
                    tabPosts(value),
                    if (value.user.videos != null) tabVideos(value),
                    tabTags(value),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  tabVideos(DataProvider value) {
    if (value.user.videos == null || value.user.videos!.isEmpty) {
      return const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Capture the moment with friends",
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Create your first video",
            style: TextStyle(
              fontSize: 13.0,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ],
      );
    }
    return GridView.builder(
      itemCount: value.user.videos!.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1 / 2,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {},
          onLongPress: () {},
          child: Center(
            child: Text("$index"),
          ),
        );
      },
    );
  }

  tabTags(DataProvider value) {
    if (value.user.tags == null || value.user.tags!.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Photos and videos\nabout you",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "When people tag you in photos and videos, they will appear here.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      );
    }
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: value.user.tags?.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1 / 1,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {},
          onLongPress: () {},
          child: Center(
            child: Text("$index"),
          ),
        );
      },
    );
  }

  tabPosts(DataProvider value) {
    if (value.user.posts == null || value.user.posts!.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Capture the moment with friends",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const Text(
                "Create your first post",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      );
    }
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: value.user.posts?.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1 / 1,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {},
          onLongPress: () {},
          child: Center(
            child: Text("$index"),
          ),
        );
      },
    );
  }

  Row rowButtons() {
    return const Row(
      children: [
        Expanded(
          child: MyButton(
            child: Text(
              "Edit profile",
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 5.0,
        ),
        Expanded(
          child: MyButton(
            child: Text(
              "Share profile",
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 5.0,
        ),
        MyButton(
          child: Icon(Icons.person_add_rounded),
        ),
      ],
    );
  }

  Text bio(DataProvider value) {
    return Text(value.user.bio);
  }

  Row profilePostsFolloweFollowing(DataProvider value) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: GestureDetector(
            onTap: () {},
            child: CircleAvatar(
              radius: 35,
              backgroundImage: Image.network(value.user.profile).image,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: InkWell(
            onTap: () {},
            child: Center(
              child: Column(
                children: [
                  Text(
                    "${value.user.posts?.length ?? 0}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text("Posts"),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: InkWell(
            onTap: () {},
            child: Center(
              child: Column(
                children: [
                  Text(
                    "$follower",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text("Follower"),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: InkWell(
            onTap: () {},
            child: Center(
              child: Column(
                children: [
                  Text(
                    "$following",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text("Following"),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class MyButton extends StatelessWidget {
  final Widget child;
  final double width;
  const MyButton({
    super.key,
    required this.child,
    this.width = 30,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: width,
      child: IconButton.filled(
        style: IconButton.styleFrom(
          backgroundColor: Colors.grey[900],
          foregroundColor: Colors.white,
          iconSize: 15,
          enableFeedback: false,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        onPressed: () {},
        icon: child,
      ),
    );
  }
}
