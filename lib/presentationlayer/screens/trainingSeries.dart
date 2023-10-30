import 'package:alo_movies/bussiness_logic/cubit/trainingSeries_cubit.dart';
import 'package:alo_movies/data/models/trainingSeries.dart';
import 'package:alo_movies/presentationlayer/screens/seriescard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toggle_switch/toggle_switch.dart';

class SeriesScreen extends StatefulWidget {
  
  const SeriesScreen({super.key});

  @override
  State<SeriesScreen> createState() => _SeriesScreenState();
}

class _SeriesScreenState extends State<SeriesScreen> {
  late List<trainingSeries> allseries;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allseries = BlocProvider.of<trainingSeriesCubit>(context).getAllCharcters();
  }

  Widget buildblockWidget() {
    return BlocBuilder<trainingSeriesCubit, trainingSeriesState>(
      builder: (context, state) {
        if (state is trainingSeriesLoaded) {
          allseries = (state).series;
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
        height: MediaQuery.of(context).size.height / 2,
        child: ListView.builder(
          itemCount: allseries.length,
          physics: AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => SeriesCard(series: allseries[index])
        ),
      ),
      // Here, default theme colors are used for activeBgColor, activeFgColor, inactiveBgColor and inactiveFgColor
ToggleSwitch(
  initialLabelIndex: 0,
  totalSwitches: 3,
  labels: ['Overview', 'Classes', 'Community'],
  onToggle: (index) {
    print('switched to: $index');
  },
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
          appBar: AppBar(title: Text("AloMoves App"),centerTitle: true),
      body: buildblockWidget(),
    ));
  }
}
