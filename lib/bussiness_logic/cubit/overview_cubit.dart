import 'package:alo_movies/data/models/Overview.dart';
import 'package:alo_movies/data/repositery/OverviewRepositery.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'overview_state.dart';

class OverviewCubit extends Cubit<OverviewState> {
 final OverviewRepositery overviewsresp;
   List<OverView> overviews=[];
OverviewCubit(this.overviewsresp) : super(OverviewInitial());
  List<OverView> getAlloverview() {
    overviewsresp.getallOverviews().then((overviews) {
      emit(OverViewsLoaded(overviews));
      this.overviews = overviews;
    });
    return overviews;
  }
}
