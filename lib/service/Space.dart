import 'package:spacex_app/service/networking.dart';

Uri openSpaceURL = Uri.parse('https://api.spacexdata.com/v4/launches/latest');

class SpaceModel {
  Future<dynamic> getSpaceinfo() async {
    NetworkHelper networkHelper = NetworkHelper(url: openSpaceURL);

    var SpaceData = await networkHelper.getData();

    return SpaceData;
  }
}
