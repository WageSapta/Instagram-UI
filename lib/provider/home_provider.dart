import 'package:flutter/material.dart';
import 'package:instagram_ui/provider/data_provider.dart';

class HomeProvider extends ChangeNotifier {
  final _listPostController = List<PageController>.generate(
    DataProvider().posts.length,
    (index) => PageController(),
  );
  final _listCurrentPage = List<int>.generate(
    DataProvider().posts.length,
    (index) => 1,
  );

  List<PageController> get listPostController => _listPostController;
  List<int> get listCurrentPage => _listCurrentPage;

  void onPageChanged(int i, int val) {
    _listCurrentPage[i] = val;
    notifyListeners();
  }
}
