import 'package:cached_network_image/cached_network_image.dart';
import 'package:covid19/core/models/country.dart';
import 'package:flutter/material.dart';
class CountryWidget extends StatelessWidget {
  final Country country;
  const CountryWidget({Key key,this.country}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration
      (
        border: Border.all(color: Theme.of(context).primaryColor,width: 1.5),
      ),
      child: Column
      (
        children: <Widget>
        [
          Text(country.name,style: TextStyle(fontWeight: FontWeight.bold),),
          SizedBox(height: 1,),
          Expanded
          (
            child: CachedNetworkImage
            (
              imageUrl: country.imageUrl,
              progressIndicatorBuilder: (context, url, downloadProgress) => 
              Center(child:CircularProgressIndicator(value: downloadProgress.progress,strokeWidth:1,)),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          OneRow(title:"Total cases: ",text:Text(country.cases.toString())),
          OneRow(title:"Total deaths: ",text:Text(country.deaths.toString(),style: TextStyle(color: Colors.red[900]),),),
          OneRow(title:"Today cases: " ,text:Text(country.todayCases.toString()),),
          OneRow(title:"Today deaths: " ,text:Text(country.todayDeaths.toString(),style: TextStyle(color: Colors.red[900]),),),
          OneRow(title:"Active cases: ",text:Text( country.active.toString()),),
          OneRow(title:"Recovered: " ,text:Text(country.recovered.toString(),style: TextStyle(color: Colors.green),),),
          OneRow(title:"Critical: ",text:Text(country.critical.toString()),),
        ],
      ),
    );
  }
}
class OneRow extends StatelessWidget {
  final String title;
  final Text text;
  OneRow({this.title,this.text});
  @override
  Widget build(BuildContext context) {
    return Row
    (
      mainAxisSize: MainAxisSize.min,
      children: <Widget>
      [
        Text(title,style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.bold)),
        text
      ],
    );
  }
}