class Country
{
  String name;
  String imageUrl;
  int cases;
  int todayCases;
  int deaths;
  int todayDeaths;
  int recovered;
  int active;
  int critical;
  Country.fromJson(Map map)
  {
    this.name=map['country']; 
    this.cases=map['cases'];
    this.todayCases=map['todayCases'];
    this.deaths=map['deaths'];
    this.todayDeaths=map['todayDeaths'];
    this.recovered=map['recovered'];
    this.active=map['active'];
    this.critical=map['critical'];
    this.imageUrl=map['countryInfo']['flag'];
  }
  
}