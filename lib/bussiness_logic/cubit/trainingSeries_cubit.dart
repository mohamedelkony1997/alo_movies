import 'package:alo_movies/data/models/trainingSeries.dart';
import 'package:alo_movies/data/repositery/trainingSeriesRepositry.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';


part 'trainingSeries_state.dart';

class trainingSeriesCubit extends Cubit<trainingSeriesState> {
  final trainingSeriesRepositery seriesresp;
   List<trainingSeries> series=[];
trainingSeriesCubit(this.seriesresp) : super(ChatectersInitial());
  List<trainingSeries> getAllCharcters() {
    seriesresp.getAllChaterers().then((series) {
      emit(trainingSeriesLoaded(series));
      this.series = series;
    });
    return series;
  }
}
