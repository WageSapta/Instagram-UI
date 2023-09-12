import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_ui/pages/account_page.dart';
import 'package:instagram_ui/pages/add_page.dart';
import 'package:instagram_ui/pages/home_page.dart';
import 'package:instagram_ui/pages/reel_page.dart';
import 'package:instagram_ui/pages/search_page.dart';
import 'package:instagram_ui/provider/data_provider.dart';
import 'package:provider/provider.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const HomePage(),
    const SearchPage(),
    const SizedBox(),
    const ReelPage(),
    const AccountPage(),
  ];

  _navbar(DataProvider data) => [
        const BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home),
          label: "",
          tooltip: "",
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.search_rounded),
          activeIcon: Icon(Icons.search_rounded),
          label: "",
          tooltip: "",
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.add_box_outlined),
          activeIcon: Icon(Icons.add_box),
          label: "",
          tooltip: "",
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.movie_outlined),
          activeIcon: Icon(Icons.movie),
          label: "",
          tooltip: "",
        ),
        BottomNavigationBarItem(
          icon: CircleAvatar(
            radius: 13,
            backgroundImage: Image.network(
              data.user.profile,
              fit: BoxFit.cover,
            ).image,
          ),
          // activeIcon: Icon(Icons.account_circle),
          label: "",
          tooltip: "",
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(
      builder: (context, value, child) {
        return Scaffold(
          body: _pages[_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.black,
            elevation: 1,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            currentIndex: _currentIndex,
            iconSize: 25,
            type: BottomNavigationBarType.fixed,
            onTap: (e) {
              if (e == 2) {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (_) => const AddPage(),
                  ),
                );
                return;
              }
              setState(() {
                _currentIndex = e;
              });
            },
            items: _navbar(value),
          ),
        );
      },
    );
  }
}
