import 'package:flutter/material.dart';
import 'package:lesson01/models/location.dart';
import 'location_detail.dart';
import 'location_list.dart';
import 'mocks/mock_location.dart';

void main() {
  final List<Location> mockLocation = MockLocation.fetchAll();
  //final Location mockLocation = MockLocation.fetchAny();

  return runApp(
    MaterialApp(
      home: LocationList(mockLocation),
    ),
  );
}
