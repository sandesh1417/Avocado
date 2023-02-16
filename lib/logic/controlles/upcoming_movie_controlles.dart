import 'package:get/get.dart';

import '../../data/services/upcoming_service.dart';

class UpcomingMovieController extends GetxController {
  final List<dynamic> _upcomingMovieList = [];
  List<dynamic> get upcomingMovieList => _upcomingMovieList;
  var isLoaded = false.obs;

  @override
  void onInit() {
    super.onInit();
    getUpcomingMovieList();
  }

  void getUpcomingMovieList() async {
    try {
      isLoaded(true);
      var movies = await UpcomingShowsServices().getUpcomingShows();
      _upcomingMovieList.addAll(movies);
    } finally {
      isLoaded(false);
    }
  }
}