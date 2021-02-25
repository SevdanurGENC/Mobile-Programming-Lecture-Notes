import 'package:flutter_json_http/test/geo.dart';

class Address {

  String street;
  String suite;
  String city;
  String zipcode;
  Geo geo;

  Address.fromJsonMap(Map<String, dynamic> map): 
    street = map["street"],
    suite = map["suite"],
    city = map["city"],
    zipcode = map["zipcode"],
    geo = Geo.fromJsonMap(map["geo"]);

}
