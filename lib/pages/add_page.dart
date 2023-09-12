import 'dart:math';

import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  int? selectedItem;
  double topPosition = 0.0;
  double leftPosition = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.close),
        ),
        title: const Text(
          "New post",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          SizedBox(
            height: kToolbarHeight,
            width: kToolbarHeight * 1.5,
            child: InkWell(
              onTap: () {},
              child: const Center(
                child: Text(
                  "Next",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              pinned: true,
              expandedHeight: MediaQuery.of(context).size.height / 1.7,
              collapsedHeight: 0,
              toolbarHeight: 0,
              backgroundColor: Colors.red,
              flexibleSpace: Container(
                color: Colors.grey[900],
                child: Center(
                  child: Text("${selectedItem ?? 'Empty'}"),
                ),
              ),
              bottom: _buttom(context),
            ),
          ];
        },
        body: Stack(
          children: [
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 1,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1,
              ),
              itemCount: 100,
              itemBuilder: (context, index) {
                final randomColor = Random().nextInt(255 - index * 2);
                return InkWell(
                  onTap: () {
                    setState(() {
                      selectedItem = index;
                    });
                  },
                  child: Material(
                    color: Color.fromRGBO(
                        randomColor, randomColor, randomColor, 100),
                    child: Center(
                      child: Text(
                        "${selectedItem == index ? '✓' : index}",
                        style: TextStyle(
                          color: selectedItem == index ? Colors.blue : null,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  PreferredSize _buttom(BuildContext context) {
    return PreferredSize(
      preferredSize:
          Size(MediaQuery.of(context).size.width, kToolbarHeight - 6),
      child: Material(
        color: Colors.black,
        child: Row(
          children: [
            GestureDetector(
              onTap: () {},
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 15.0,
                  ),
                  Text(
                    "Latest",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Icon(Icons.keyboard_arrow_down_rounded),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: IconButton(
                style: IconButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.grey[900],
                ),
                onPressed: () {},
                icon: const Icon(
                  Icons.filter_none_rounded,
                  size: 18,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: IconButton(
                style: IconButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.grey[900],
                ),
                onPressed: () {},
                icon: const Icon(
                  Icons.camera_alt_outlined,
                  size: 18,
                ),
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}
