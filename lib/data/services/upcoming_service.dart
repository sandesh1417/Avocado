import 'package:avocado/data/models/upcoming_movie_model.dart';

import 'api/api_services.dart';
import 'api/end_points.dart';

class UpcomingShowsServices {
  Future<List<dynamic>> getUpcomingShows() async {
    ApiService api = ApiService();
    var url = APIUrl.nowShows;
    var result = await api.get(url);
    List<dynamic> movieList =
        result["results"].map((i) => UpcomingMovieModel.fromJson(i)).toList();
    return movieList;
  }
}
