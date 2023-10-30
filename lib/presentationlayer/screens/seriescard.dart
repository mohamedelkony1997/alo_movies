import 'package:alo_movies/data/models/trainingSeries.dart';
import 'package:flutter/material.dart';

class SeriesCard extends StatelessWidget {
   final trainingSeries series;
  const SeriesCard({Key? key,required this.series}):super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Card(
      // ignore: prefer_const_constructors
      child: Column(children: [
        Image(height: 200, fit: BoxFit.fill, image: NetworkImage("${series.image}")),
        SizedBox(height: 15,),

        Text("${series.name}",style: TextStyle(fontSize: 30,)),
       SizedBox(height: 20,),
        Container(
          width: 200,
          child: Text("${series.desc}",style: TextStyle(fontSize: 12,))),
      ]),
    );
  }
}
