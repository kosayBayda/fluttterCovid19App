
import 'package:covid19/core/models/country.dart';
import 'package:covid19/core/models/covid.dart';
import 'package:dio/dio.dart';
class Api
{
  static BaseOptions options=new BaseOptions(baseUrl:"https://corona.lmao.ninja/v2");
  static Dio dio = new Dio(options);
  static Future<Covid19> getCovid19() async
  {
    Response res=await dio.get("/all");
    print(res.data.toString());
    return Covid19.fromJson(res.data);
  }
  static Future<List<Country>> getCountries() async
  {
    List<Country> loc=new List<Country>();
    print(DateTime.now());
    Response res=await dio.get("/countries");
    for(var country in res.data)
    {
      Country c=new Country.fromJson(country);
      loc.add(c);
    }
    loc.sort((a,b)=>a.cases.compareTo(b.cases));
    return loc.reversed.toList();
  }


}
