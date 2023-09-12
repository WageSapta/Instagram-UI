import 'dart:developer';

import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagram_ui/provider/data_provider.dart';
import 'package:instagram_ui/provider/home_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey _popupKey = GlobalKey();

  void showCustomPopupMenu(BuildContext context) {
    final RenderBox button =
        _popupKey.currentContext!.findRenderObject() as RenderBox;
    final Offset position = button.localToGlobal(Offset.zero);

    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        position.dx,
        position.dy + button.size.height + 10,
        position.dx + button.size.width,
        position.dy + button.size.height + 10,
      ),
      items: <PopupMenuItem<String>>[
        const PopupMenuItem<String>(
          value: '/following',
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text('Following'), Icon(Icons.people_outline_outlined)],
          ),
        ),
        const PopupMenuItem<String>(
          value: '/favorite',
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text('Favorite'), Icon(Icons.star_border_rounded)],
          ),
        ),
      ],
    ).then((value) {
      if (value != null) {
        log('Selected: $value');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<DataProvider, HomeProvider>(
      builder: (context, value, home, child) {
        return Scaffold(
          body: SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  floating: true,
                  title: GestureDetector(
                    key: _popupKey,
                    onTap: () {
                      showCustomPopupMenu(context);
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Instagram",
                          style: TextStyle(
                            fontFamily: GoogleFonts.lobster().fontFamily,
                          ),
                        ),
                        const Icon(Icons.keyboard_arrow_down_rounded),
                      ],
                    ),
                  ),
                  actions: [
                    IconButton(
                      icon: const Icon(
                        Icons.favorite_border_outlined,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.message_outlined,
                      ),
                      onPressed: () {},
                    ),
                    const SizedBox(width: 5),
                  ],
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 110,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: (value.friends
                                  .where((element) => element.status != null))
                              .length +
                          1,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 15, right: 18),
                            child: Stack(
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    CircleAvatar(
                                      radius: 36,
                                      backgroundImage:
                                          NetworkImage(value.user.profile),
                                    ),
                                    const Text(
                                      "Your story",
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                Positioned(
                                  right: 0,
                                  top: 50,
                                  child: CircleAvatar(
                                    radius: 14,
                                    backgroundColor: Colors.black,
                                    child: Container(
                                      margin: const EdgeInsets.all(3.0),
                                      decoration: const ShapeDecoration(
                                        color: Colors.blue,
                                        shape: CircleBorder(),
                                      ),
                                      child: const Center(
                                        child: Icon(
                                          Icons.add_rounded,
                                          color: Colors.white,
                                          size: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        }
                        var item = (value.friends
                                .where((element) => element.status != null))
                            .toList()[index - 1];
                        return Padding(
                          padding: const EdgeInsets.only(right: 18.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 86,
                                width: 86,
                                alignment: Alignment.center,
                                decoration: ShapeDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topRight,
                                    colors: [
                                      Colors.yellow,
                                      Colors.orange,
                                      Colors.red,
                                      Colors.pink,
                                      Colors.purple,
                                      Colors.deepPurpleAccent.shade700,
                                    ],
                                  ),
                                  shape: const CircleBorder(),
                                ),
                                child: CircleAvatar(
                                  radius: 40,
                                  backgroundColor: Colors.black,
                                  child: CircleAvatar(
                                    radius: 36,
                                    backgroundImage: NetworkImage(item.profile),
                                  ),
                                ),
                              ),
                              Text(
                                item.name,
                                style: const TextStyle(
                                  fontSize: 11,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Divider(
                    color: Colors.white.withOpacity(.1),
                  ),
                ),
                SliverList.builder(
                  itemCount: value.posts.length,
                  itemBuilder: (context, index) {
                    var item = value.posts[index];
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 55,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 32,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0),
                                    alignment: Alignment.center,
                                    decoration: ShapeDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.bottomLeft,
                                        end: Alignment.topRight,
                                        colors: [
                                          Colors.yellow,
                                          Colors.orange,
                                          Colors.red,
                                          Colors.pink,
                                          Colors.purple,
                                          Colors.deepPurpleAccent.shade700,
                                        ],
                                      ),
                                      shape: const CircleBorder(),
                                    ),
                                    child: CircleAvatar(
                                      radius: 15,
                                      backgroundColor: Colors.black,
                                      child: CircleAvatar(
                                        radius: 14,
                                        backgroundImage:
                                            NetworkImage(item.profile),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    item.username,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.more_vert_rounded),
                              )
                            ],
                          ),
                        ),
                        Stack(
                          children: [
                            SizedBox(
                              height: 280,
                              child: PageView.builder(
                                allowImplicitScrolling: true,
                                controller: home.listPostController[index],
                                itemCount: value.posts[index].images.length,
                                onPageChanged: (page) {
                                  home.onPageChanged(index, page + 1);
                                },
                                itemBuilder: (context, i) {
                                  var image = value.posts[index].images[i];
                                  return Image.network(
                                    image,
                                    fit: BoxFit.scaleDown,
                                  );
                                },
                              ),
                            ),
                            Positioned(
                              right: 0,
                              top: 0,
                              child: Container(
                                margin: const EdgeInsets.all(10.0),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                decoration: ShapeDecoration(
                                  color: Colors.black.withOpacity(.8),
                                  shape: const StadiumBorder(),
                                ),
                                child: Center(
                                  child: Text(
                                    "${home.listCurrentPage[index]}/${value.posts[index].images.length}",
                                    style: const TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.favorite_border_rounded,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.mode_comment_outlined,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.send_outlined,
                                        ),
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.bookmark_border_rounded,
                                      size: 28.0,
                                    ),
                                  ),
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  "12.445 likes",
                                  style: TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 3),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: ExpandableText(
                                  item.description,
                                  expandText: '',
                                  prefixText: item.username,
                                  prefixStyle: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ), 
                                  onPrefixTap: () {},
                                  collapseOnTextTap: true,
                                  expandOnTextTap: true,
                                  maxLines: 2,
                                  linkColor: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 3),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: const Text(
                                    "See all 30 comments",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
