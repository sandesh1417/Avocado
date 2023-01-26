import '../models/now_shows_model.dart';
import 'api/api_constants.dart';
import 'api/api_services.dart';

class NowShowsRepository {
  ApiService api = ApiService();

  Future<List<dynamic>> fetchData() async {
    var url = APIUrl.nowShows;

    try {
      var result = await api.get(url);
      var response = result;
      List<dynamic> dataList = response["results"]
          .map((i) => NowShowingMovieModel.fromJson(i))
          .toList();

      return dataList;
    } catch (e) {
      throw (e.toString());
    }
  }
}
