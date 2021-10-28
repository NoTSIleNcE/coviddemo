import 'package:covidapp/countrydetail.dart';
import 'package:flutter/material.dart';
import 'package:covidapp/homescreen.dart';
import 'package:covidapp/countryscreen.dart';
//import 'package:covidapp/countryscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),

        //this route is to determine where u go  
        onGenerateRoute: (RouteSettings routeSettings) {
          final map = routeSettings.arguments != null ? (routeSettings.arguments as Map<String, dynamic>) : null;

          return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                switch (routeSettings.name) {
                  //to link to another second page 
                  case CountryScreen.routeName:
                    return CountryScreen(username: map!['username'], password: map['password']);
                  case CountryDetail.routeName:
                    return CountryDetail(myCountry: map!['myCountry'] );          
                  default:
                    return const HomeScreen();
                }
              });
        });
        
  }
}
