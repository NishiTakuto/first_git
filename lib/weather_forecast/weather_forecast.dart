import 'package:first_flutter_app/weather_forecast/model/weather_forecast_model.dart';
import 'package:flutter/material.dart';

import 'network/network.dart';
import 'ui/mid_view.dart';

class WeatherForecast extends StatefulWidget {
  const WeatherForecast({Key? key}) : super(key: key);

  @override
  _WeatherForecastState createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  late Future<WeatherForecastModel> forecastObject;
  String _cityName = "Mumbai";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forecastObject = NetWork().getWeatherForecast(cityName: _cityName);
    /*forecastObject.then((weather) => {
      print(weather.list[0].weather[0].main)
    });*/
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text("ForeCast"),
      )*/
      body: ListView(
        children: <Widget>[
          TextFieldView(),
          Container(
            child: FutureBuilder<WeatherForecastModel>(
              future: forecastObject,
              builder: (BuildContext context, AsyncSnapshot<WeatherForecastModel> snapshot) {
                if(snapshot.hasData) {
                  return Column(
                    children: <Widget>[
                      midView(snapshot),
                    ],
                  );
                }else{
                  return Container(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

Widget TextFieldView() {
  return Container(
    child: TextField(
      decoration: InputDecoration(
        hintText: "Enter City Name",
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        contentPadding: EdgeInsets.all(8),
      ),
      onSubmitted: (value) {
        setState(() {
          _cityName = value;
          forecastObject = new Network().getWeatherForecast(cityName: _cityName);
        });
      },
    ),
  );
}

