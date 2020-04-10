class Covid19
{
  int totalCases;
  int deaths;
  int todayCases;
  int todayDeaths;
  int recovered;
  int active;
  int critical;
  int affectedCountries;
  Covid19(this.totalCases,this.deaths,this.todayCases,this.todayDeaths,this.recovered,this.active,this.critical,this.affectedCountries);
  Covid19.fromJson(Map<String,dynamic> map)
  {
    this.totalCases=map['cases'];
    this.deaths=map['deaths'];
    this.todayCases=map['todayCases'];
    this.todayDeaths=map['todayDeaths'];
    this.recovered=map['recovered'];
    this.active=map['active'];
    this.critical=map['critical'];
    this.affectedCountries=map['affectedCountries'];
  }  
}