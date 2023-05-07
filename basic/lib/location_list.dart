import 'package:flutter/material.dart';
import 'package:lesson01/location_detail.dart';
import 'package:lesson01/styles.dart';
import 'models/location.dart';

class LocationList extends StatefulWidget {
  @override
  createState() => _LocationListState();
}

class _LocationListState extends State<LocationList> {
  List<Location> locations = [];

  @override
  void initState() {
    super.initState();
    loadDate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Locations',
          style: Styles.naviBarTitle,
        ),
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: _listViewItemBuilder,
      ),
    );
  }

  loadDate() async {
    final locations = await Location.fetchAll();
    setState(() {
      this.locations = locations;
    });
  }

  Widget _listViewItemBuilder(BuildContext context, int index) {
    final location = this.locations[index];
    return ListTile(
      contentPadding: const EdgeInsets.all(10.0),
      leading: _itemThambnail(location),
      title: _itemTitle(location),
      onTap: () => _navigateToLocationDetail(context, location.id!),
    );
  }

  void _navigateToLocationDetail(BuildContext context, int locationID) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LocationDetail(locationID),
      ),
    );
  }

  Widget _itemThambnail(Location location) {
    return Container(
      constraints: const BoxConstraints.tightFor(width: 100.0),
      child: Image.network(
        location.url!,
        fit: BoxFit.fitWidth,
      ),
    );
  }

  Widget _itemTitle(Location location) {
    return Text(
      '${location.name}',
      style: Styles.textDefault,
    );
  }
}
