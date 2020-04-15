import 'package:covid19/ui/views/countries_view.dart';
import 'package:covid19/ui/views/home_view.dart';
import 'package:flutter/material.dart';
void main()
{
  runApp(MyApp());
  // Api.getCovid19();
  // Api.getCountries();
  
}
class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp
    (
      title: "Covid-19",
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      theme: ThemeData
      (
        primarySwatch: Colors.deepOrange,
      ),
      routes: 
      {
        "/": (context)=>HomeView(),
        '/countries':(context)=>CountriesView()
      },
    );
  }
}