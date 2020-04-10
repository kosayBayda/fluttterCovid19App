import 'package:covid19/core/models/covid.dart';
import 'package:covid19/core/services/api.dart';
import 'package:flutter/material.dart';
class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final w=20;
  Future<Covid19> getData;
  @override
  void initState() {
    getData= Api.getCovid19();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    return Scaffold
    (
      appBar: AppBar
      (
        title: Text("Stay Home",style: TextStyle(fontStyle: FontStyle.italic),),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton
      (
        onPressed:()
        {
          Navigator.pushNamed(context, '/countries');
        },
        child:Icon(Icons.location_city),
      ),
      body:FutureBuilder<Covid19>
      (
        future: getData,
        builder:(context,snapshot)
        {
          if(!snapshot.hasData)
          {
            return Center(child: CircularProgressIndicator());
          }
          else
          {
            return Padding(
        padding: const EdgeInsets.all(8.0),
        child:ListView
        (
          children: <Widget>
          [
            StaticsticsContainer(title:"Coronavirus Cases:",value:Text(snapshot.data.totalCases.toString(),textScaleFactor:width/200,)),
            SizedBox(height: w.toDouble(),),
            StaticsticsContainer(title:"Recovered:",value:Text(snapshot.data.recovered.toString(),textScaleFactor:width/200,style: TextStyle(color: Colors.green),)),
            SizedBox(height: w.toDouble(),),
            StaticsticsContainer(title:"Deaths:",value:Text(snapshot.data.deaths.toString(),textScaleFactor:width/200,style: TextStyle(color: Colors.red[900]),)),
            SizedBox(height: w.toDouble(),),
            StaticsticsContainer(title:"Today Cases:",value:Text(snapshot.data.todayCases.toString(),textScaleFactor:width/200)),
            SizedBox(height: w.toDouble(),),  
            StaticsticsContainer(title:"Today Deaths:",value:Text(snapshot.data.todayDeaths.toString(),textScaleFactor:width/200,style: TextStyle(color: Colors.red[900]))),
            SizedBox(height: w.toDouble(),),
            StaticsticsContainer(title:"Active Cases:",value:Text(snapshot.data.active.toString(),textScaleFactor:width/200,)),
            SizedBox(height: w.toDouble(),),    
            StaticsticsContainer(title:"Critical:",value:Text(snapshot.data.critical.toString(),textScaleFactor:width/200,)),
            SizedBox(height: w.toDouble(),),
            StaticsticsContainer(title:"Affected Countries:",value:Text(snapshot.data.affectedCountries.toString(),textScaleFactor:width/200,)),
            SizedBox(height: w.toDouble(),),
          ],
        ),
      );
          }
        },
      )
    );
  }
}
class StaticsticsContainer extends StatelessWidget {
  final title;
  final value;
  final color;
  StaticsticsContainer({this.title,this.value,this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration
      (
    
        border: Border.all(color: Theme.of(context).primaryColor,width: 1.5),
        borderRadius: BorderRadius.circular(30)
      ),
      padding: EdgeInsets.all(8),
      child: Column
      (
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>
        [
          Text(title,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey[600]),textScaleFactor:2,),
          SizedBox(height: 10,),
          value
        ],
      ),
    );
  }
}
