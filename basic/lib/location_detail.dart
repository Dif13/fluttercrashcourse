import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'components/banner_image.dart';
import 'components/location_tile.dart';
import 'components/default_app_bar.dart';
import 'models/location.dart';
import 'mocks/mock_location.dart';
import 'styles.dart';

const BannerImageHight = 300.0;
const BodeVerticalPadding = 20.0;
const FooterHeight = 100.0;

class LocationDetail extends StatefulWidget {
  final int locationID;

  const LocationDetail(this.locationID, {super.key});

  @override
  createState() => _LocationDetailState(locationID);
}

class _LocationDetailState extends State<LocationDetail> {
  final int locationID;
  Location location = Location.blank();

  _LocationDetailState(this.locationID);
  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(),
      body: Stack(
        children: [
          _renderBody(context, location),
          _rederFooter(context, location),
        ],
      ),
    );
  }

  loadData() async {
    final location = await Location.fetchByID(this.locationID);

    //TODO: really impotant.  What is mounted?
    if (mounted) {
      setState(() {
        this.location = location;
      });
    }
  }

  Widget _renderBody(BuildContext context, Location location) {
    var result = <Widget>[];
    result.add(BannerImage(
      url: location.url!,
      height: BannerImageHight,
    ));
    result.add(_renderHeader());
    result.addAll(_renderFacts(context, location));
    result.add(_renderBottomSpacer());
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: result,
      ),
    );
  }

  Widget _renderHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: BodeVerticalPadding,
          horizontal: Styles.horizontalPaddingDefault),
      child: LocationTile(location: this.location, darkTheme: false),
    );
  }

  List<Widget> _renderFacts(BuildContext context, Location location) {
    var result = <Widget>[];
    for (int i = 0; i < location.facts!.length; i++) {
      result.add(_sectionTitle(location.facts![i].title));
      result.add(_sectionText(location.facts![i].text));
    }
    return result;
  }

  Widget _sectionTitle(String? text) {
    return Container(
      padding: const EdgeInsets.fromLTRB(Styles.horizontalPaddingDefault, 25.0,
          Styles.horizontalPaddingDefault, 0.0),
      child: Text(text?.toUpperCase() ?? '',
          textAlign: TextAlign.left, style: Styles.headerLarge),
    );
  }

  Widget _sectionText(String? text) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: Styles.horizontalPaddingDefault, vertical: 10.0),
      child: Text(
        text ?? '',
        textAlign: TextAlign.justify,
        style: Styles.textDefault,
      ),
    );
  }

  Widget _rederFooter(BuildContext context, Location location) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          decoration: BoxDecoration(color: Colors.white.withOpacity(0.5)),
          height: FooterHeight,
          child: Container(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
            child: _renderBookButton(),
          ),
        )
      ],
    );
  }

  Widget _renderBookButton() {
    return TextButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Styles.accentColor)),
      onPressed: _handleBookPress,
      child: Text('Book'.toUpperCase(), style: Styles.textCTAButton),
    );
  }

  void _handleBookPress() async {
    final url = Uri(
      scheme: 'mailto',
      path: 'hello@tourism.com',
      queryParameters: {'subject': 'inquiry'},
    );
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Couln`t launch $url';
    }
  }
}

Widget _renderBottomSpacer() {
  return Container(height: FooterHeight);
}
