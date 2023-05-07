import 'package:flutter/material.dart';
import 'package:lesson01/styles.dart';
import 'package:lesson01/models/location.dart';

const LoationTileHeight = 100.0;

class LocationTile extends StatelessWidget {
  const LocationTile(
      {super.key, required this.location, required this.darkTheme});

  final Location location;
  final bool darkTheme;

  @override
  Widget build(BuildContext context) {
    final title = location.name?.toUpperCase();
    final subTitle = location.userItinerarySummary?.toUpperCase();
    final caption = location.tuorPackageName?.toUpperCase();

    return Container(
      padding: EdgeInsets.all(0.0),
      height: LoationTileHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$title',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: this.darkTheme
                ? Styles.locationTileTitleDark
                : Styles.locationTileTitleLight,
          ),
          Text('$subTitle', style: Styles.locationTileSubTitle),
          Text('$caption', style: Styles.locationTileCaption),
        ],
      ),
    );
  }
}
