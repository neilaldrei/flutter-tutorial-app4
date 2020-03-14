import 'package:flutter/material.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/loading.dart';
import 'package:world_time/pages/choose_location.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/home',
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/location': (context) => ChooseLocation(),
  }
));

/*
  Widget Lifecycle


  Stateless 
  - State does not change overtime
  - Build function only runs once

  Stateful
  - State CAN change over time
  - SetState() triggers the build function

  _ initState() 
    > Called only once when widget is created
    > Subscribe to streams or any object that could change our widget data
  _ Build()
    > Builds the widget tree
    > A build is triggered every time we use setState()
  _ Dispose()
    > When the widget / state is removed
 */