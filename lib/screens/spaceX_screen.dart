import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'package:spacex_app/service/Space.dart';

const colorizeColors = [
  Colors.purple,
  Colors.blue,
  Colors.yellow,
  Colors.red,
];

const colorizeTextStyle = TextStyle(
  fontSize: 50.0,
  fontFamily: 'Horizon',
);

class SpaceXScreen extends StatefulWidget {
  SpaceXScreen({this.SpaceData});

  final SpaceData;

  @override
  _SpaceXScreenState createState() => _SpaceXScreenState();
}

class _SpaceXScreenState extends State<SpaceXScreen> {
  late String Patch;
  late String Name;
  late String Details;
  late String Id;
  late int Cores;
  String message = "";

  SpaceModel spaceModel = SpaceModel();
  @override
  void initState() {
    super.initState();
    print(widget.SpaceData);
    updateUI(widget.SpaceData);
  }

  // ignore: non_constant_identifier_names
  void updateUI(SpaceData) {
    setState(() {
      if (SpaceData == null) {
        Patch = "";
        Name = "";
        Details = "";
        Id = "";
        Cores = 0;
        return;
      }

      Name = SpaceData['name'];
      Patch = SpaceData['links']['patch']['small'];
      Details = SpaceData['details'];
      Id = SpaceData['id'];
      Cores = SpaceData['cores'][0]['flight'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'https://i.pinimg.com/originals/47/ad/b9/47adb95a09f4541ef3096fc3b646edd0.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.8), BlendMode.dstATop),
            ),
          ),
          constraints: BoxConstraints.expand(),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/bwhi1apicaaamlo.jpg_large.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment(-1, -1),
                  child: Container(
                    height: MediaQuery.of(context).size.width * 0.2,
                    width: MediaQuery.of(context).size.width * 0.2,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage('$Patch'),
                        fit: BoxFit.fill,
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.65,
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 12.0,
                      fontFamily: 'Space Mono',
                    ),
                    child: AnimatedTextKit(
                      repeatForever: true,
                      pause: Duration(seconds: 3),
                      animatedTexts: [
                        TypewriterAnimatedText(
                          'Name of SpaceX\'s last mission:',
                        ),
                        TypewriterAnimatedText(Name,
                            textAlign: TextAlign.center),
                        TypewriterAnimatedText(
                          ' Details of Mission is:',
                        ),
                        TypewriterAnimatedText(
                          Details,
                        ),
                        TypewriterAnimatedText(
                          'İd of SpaceX\'s last mission: ',
                        ),
                        TypewriterAnimatedText(Id, textAlign: TextAlign.center),
                        TypewriterAnimatedText(
                          'Flights number of SpaceX\'s last mission:  ',
                        ),
                        TypewriterAnimatedText(Cores.toString(),
                            textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
