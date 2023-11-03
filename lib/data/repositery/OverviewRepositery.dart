

import 'package:alo_movies/data/api_services/overviewwebservices.dart';
import 'package:alo_movies/data/models/Overview.dart';
import 'package:alo_movies/data/models/trainingSeries.dart';

class OverviewRepositery {
  final OverviewWebServices overviewWebServices;
  OverviewRepositery(this.overviewWebServices);

  Future<List<OverView>> getallOverviews() async {
    final overviews = await overviewWebServices.getallOverview();
    return overviews.map((overviews) => OverView.fromJson(overviews)).toList();
  }
}
