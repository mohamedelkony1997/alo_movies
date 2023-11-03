import 'package:alo_movies/bussiness_logic/cubit/trainingSeries_cubit.dart';
import 'package:alo_movies/data/models/trainingSeries.dart';
import 'package:alo_movies/presentationlayer/screens/ClassesPage..dart';
 // Fixed the import path
import 'package:alo_movies/presentationlayer/screens/CommunityPage.dart'; // Fixed the import path
import 'package:alo_movies/presentationlayer/screens/OverviewVideos.dart'; // Fixed the import path
import 'package:alo_movies/presentationlayer/screens/seriescard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toggle_switch/toggle_switch.dart';

class SeriesScreen extends StatefulWidget {
  const SeriesScreen({Key? key}) : super(key: key); // Fixed the constructor

  @override
  State<SeriesScreen> createState() => _SeriesScreenState();
}

class _SeriesScreenState extends State<SeriesScreen> {
  late List<trainingSeries> allseries; // Fixed the type name
  @override
  void initState() {
    super.initState();
    allseries = BlocProvider.of<trainingSeriesCubit>(context).getAllCharcters(); // Fixed the type name
  }

  int _selectedPage = 0;

  Widget buildBlockWidget() {
    return BlocBuilder<trainingSeriesCubit, trainingSeriesState>( // Fixed the type name
      builder: (context, state) {
        if (state is trainingSeriesLoaded) { // Fixed the type name
          allseries = (state).series;
          return buildLoadedSeries();
        } else {
          return loadedSeriesIndicator(); // Fixed the method name
        }
      },
    );
  }

  Widget buildLoadedSeries() {
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: ListView.builder(
              itemCount: allseries.length,
              physics: AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => SeriesCard(series: allseries[index]),
            ),
          ),
          ToggleSwitch(
            initialLabelIndex: 0,
            totalSwitches: 3,
            labels: ['Overview', 'Classes', 'Community'],
            onToggle: (index) {
              setState(() {
                _selectedPage = index!;
              });
            },
          ),
          SizedBox(
               height: MediaQuery.of(context).size.height / 2.5,
            child: ListView(
              children: [
                if (_selectedPage == 0)
                  OverviewVideos()
                else if (_selectedPage == 1)
                  ClassesPage()
                else if (_selectedPage == 2)
                  CommunityPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget loadedSeriesIndicator() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("AloMoves App"), centerTitle: true),
        body: buildBlockWidget(),
      ),
    );
  }
}
