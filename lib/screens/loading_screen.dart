import 'package:flutter/material.dart';
import 'package:spacex_app/service/Space.dart';

import 'spaceX_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    SpaceModel spaceModel = SpaceModel();

    var SpaceXData = await spaceModel.getSpaceinfo();

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SpaceXScreen(
                  SpaceData: SpaceXData,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://i.pinimg.com/originals/01/37/e0/0137e0bb2e393cb1aaba38bd23c4d4a7.png'),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
      ),
    ));
  }
}
