import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ReelPage extends StatefulWidget {
  const ReelPage({Key? key}) : super(key: key);

  @override
  State<ReelPage> createState() => _ReelPageState();
}

class _ReelPageState extends State<ReelPage>
    with SingleTickerProviderStateMixin {
  final _pageController = PageController(initialPage: 0);
  bool _isVisible = true;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      final direction = _pageController.position.userScrollDirection;
      if (direction == ScrollDirection.forward) {
        if (!_isVisible) {
          setState(() {
            _isVisible = true;
          });
        }
      } else if (direction == ScrollDirection.reverse) {
        if (_isVisible) {
          setState(() {
            _isVisible = false;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: 3,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Container(
                      color: Color.fromARGB(255, 100, 150 * index, 300 * index),
                    ),
                    interfaceReel(context)
                  ],
                );
              },
            ),
            Positioned(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    opacity: _isVisible ? 1 : 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10),
                      child: PopupMenuButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        position: PopupMenuPosition.under,
                        offset: const Offset(0, 10),
                        enableFeedback: false,
                        tooltip: "",
                        itemBuilder: (context) {
                          return <PopupMenuEntry<String>>[
                            const PopupMenuItem<String>(
                              value: '/following',
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Following'),
                                  Icon(Icons.people_outline_outlined)
                                ],
                              ),
                            ),
                          ];
                        },
                        child: const Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Reels",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down_rounded,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  SizedBox interfaceReel(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding:
            const EdgeInsets.only(top: 10, bottom: 15, right: 10, left: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 42,
                            padding: const EdgeInsets.symmetric(horizontal: 2),
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
                            child: const CircleAvatar(
                              radius: 19,
                              backgroundColor: Colors.black,
                              child: CircleAvatar(
                                radius: 18,
                                backgroundImage: NetworkImage(
                                    "http://via.placeholder.com/150"),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            "Username",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            height: 30,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.white),
                            ),
                            child: const Center(
                              child: Text(
                                "Follow",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      const ExpandableText(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                        expandText: '',
                        collapseOnTextTap: true,
                        expandOnTextTap: true,
                        maxLines: 1,
                        linkColor: Colors.grey,
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 30,
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: ShapeDecoration(
                          color: Colors.grey[900]!.withOpacity(.5),
                          shape: const StadiumBorder(),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.music_note_rounded,
                              size: 20,
                            ),
                            SizedBox(width: 5),
                            Text(
                              "Username • Song name",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 10),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_border_rounded,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      "443k",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.mode_comment_outlined,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      "1.367",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.send_outlined,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      "978",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.more_vert_rounded,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: Material(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey,
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
