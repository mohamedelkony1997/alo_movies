

import 'package:alo_movies/data/api_services/trainingSerieswebservices.dart';
import 'package:alo_movies/data/models/trainingSeries.dart';

class trainingSeriesRepositery {
  final trainingSeriesWebServices charactersWebServices;
  trainingSeriesRepositery(this.charactersWebServices);

  Future<List<trainingSeries>> getAllChaterers() async {
    final charcters = await charactersWebServices.getAllChaterers();
    return charcters.map((chatcter) => trainingSeries.fromJson(chatcter)).toList();
  }
}
