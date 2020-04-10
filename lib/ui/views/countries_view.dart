import 'package:covid19/core/models/country.dart';
import 'package:covid19/core/services/api.dart';
import 'package:covid19/ui/widgets/country_widget.dart';
import 'package:flutter/material.dart';
class CountriesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      appBar: AppBar
      (
        title:Text("Countries"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<List<Country>>
        (
          future: Api.getCountries(),
          builder: (context,snapshot)
          {
            if(!snapshot.hasData)
            {
              return Center(child: CircularProgressIndicator());
            }
            else
            {
              return GridView.builder(
                gridDelegate :SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 8,crossAxisSpacing: 8),
                itemCount: snapshot.data.length,
                itemBuilder: (context,i)
                {
                  return CountryWidget(country: snapshot.data[i],);
                }
              );
            }
          }
        ),
      ),
    );
  }
}