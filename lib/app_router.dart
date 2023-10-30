import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:alo_movies/bussiness_logic/cubit/trainingSeries_cubit.dart';
import 'package:alo_movies/constants/strings.dart';
import 'package:alo_movies/data/api_services/trainingSerieswebservices.dart';
import 'package:alo_movies/data/repositery/trainingSeriesRepositry.dart';
import 'package:alo_movies/presentationlayer/screens/trainingSeries.dart';

class AppRouter {
  late trainingSeriesRepositery _seriesRepositery;
  late trainingSeriesCubit trainingseriescubit;
  AppRouter() {
    _seriesRepositery = trainingSeriesRepositery(trainingSeriesWebServices());
    trainingseriescubit = trainingSeriesCubit(_seriesRepositery);
  }
  Route? generateroute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case seriesScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => trainingSeriesCubit(
                trainingSeriesRepositery(trainingSeriesWebServices())),
            child: SeriesScreen(),
          )
        );
    }
  }
}
