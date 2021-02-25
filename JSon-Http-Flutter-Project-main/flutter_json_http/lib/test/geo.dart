
class Geo {

  String lat;
  String lng;

  Geo.fromJsonMap(Map<String, dynamic> map): 
    lat = map["lat"],
    lng = map["lng"];

}
