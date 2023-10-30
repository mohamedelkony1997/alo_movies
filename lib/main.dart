
import 'package:alo_movies/app_router.dart';
import 'package:flutter/material.dart';


import 'package:responsive_framework/responsive_framework.dart';


void main() {
  runApp( MyApp(approute: AppRouter(),));
}

class MyApp extends StatelessWidget {
 

  // This widget is the root of your application.
  final AppRouter  approute;

  const MyApp({super.key, required this.approute});
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
     
       debugShowCheckedModeBanner: false,
       onGenerateRoute:approute.generateroute ,
      
    );
  }
}


