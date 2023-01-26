import 'api/api_services.dart';
import 'api/end_points.dart';
import '../models/now_showing_movie_model.dart';

class NowShowsServices {
  Future<List<dynamic>> getNowShows() async {
    ApiService api = ApiService();
    var url = APIUrl.nowShows;
    var result = await api.get(url);
    List<dynamic> movieList =
        result["results"].map((i) => NowShowingMovieModel.fromJson(i)).toList();
    return movieList;
  }
}
