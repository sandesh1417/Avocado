import 'package:get/get.dart';

import '../services/now_showing_service.dart';

class NowShowsMovieController extends GetxController {
  final List<dynamic> _nowShowsMovieList = [];
  List<dynamic> get nowShowsMovieList => _nowShowsMovieList;
  var isLoaded = false.obs;

  @override
  void onInit() {
    super.onInit();
    getNowShowsMovieList();
  }

  void getNowShowsMovieList() async {
    try {
      isLoaded(true);
      var movies = await NowShowsServices().getNowShows();
      _nowShowsMovieList.addAll(movies);
      print(_nowShowsMovieList.toString());
    } finally {
      isLoaded(false);
    }
  }
}
