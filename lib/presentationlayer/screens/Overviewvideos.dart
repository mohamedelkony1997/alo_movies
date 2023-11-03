import 'package:alo_movies/bussiness_logic/cubit/overview_cubit.dart';
import 'package:alo_movies/data/models/Overview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OverviewVideos extends StatefulWidget {
  const OverviewVideos({super.key});

  @override
  State<OverviewVideos> createState() => _OverviewVideosState();
}

class _OverviewVideosState extends State<OverviewVideos> {
  late List<OverView> alloverview;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    alloverview = BlocProvider.of<OverviewCubit>(context).getAlloverview();
  }

  Widget buildblockWidget() {
    return BlocBuilder<OverviewCubit, OverviewState>(
      builder: (context, state) {
        if (state is OverViewsLoaded) {
          alloverview = (state).overviews;
          return buildloadedSeries();
        } else {
          return loadedSeriesIndacator();
        }
      },
    );
  }

  Widget buildloadedSeries() {
    return Column(children: [
      SizedBox(
        height: MediaQuery.of(context).size.height / 2.3,
        child: ListView.builder(
            itemCount: alloverview.length,
            physics: AlwaysScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Text("data"),
                ],
              );
            }),
        // Here, default theme colors are used for activeBgColor, activeFgColor, inactiveBgColor and inactiveFgColor
      ),
    ]);
  }

  Widget loadedSeriesIndacator() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: buildblockWidget(),
    ));
  }
}
