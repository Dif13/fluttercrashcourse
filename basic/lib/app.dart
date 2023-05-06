import 'package:flutter/material.dart';

import 'location_list.dart';
import 'mocks/mock_location.dart';
import 'models/location.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    List<Location> mockLocation = MockLocation.fetchAll();

    return MaterialApp(home: LocationList(mockLocation));
  }
}
