import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'dart:convert';

class WorldTime {

  String location;
  String time;
  String flag;    // URL to an assets folder
  String url;     // Location for world time api end points
  bool isDaytime; // Check if it's daytime

  WorldTime({ this.location, this.flag, this.url, this.isDaytime });

  Future<void> getTime() async {

    try {
      // make request from worldtimeapi
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);

      // get props from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      // Create date time object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      
      // Ternary Operator
      isDaytime = now.hour > 6 && now.hour < 18 ? true : false;

      // Store date time object to time var
      time = DateFormat.jm().format(now);

    } catch(e) {
      print('Caught Error: $e');
      time = "Could not get time data";
    }
  }
}