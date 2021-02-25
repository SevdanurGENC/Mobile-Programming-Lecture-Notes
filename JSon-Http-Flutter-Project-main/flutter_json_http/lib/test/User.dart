import 'package:flutter_json_http/test/address.dart';
import 'package:flutter_json_http/test/company.dart';

class User {

  int id;
  String name;
  String username;
  String email;
  Address address;
  String phone;
  String website;
  Company company;

  User.fromJsonMap(Map<String, dynamic> map): 
    id = map["id"],
    name = map["name"],
    username = map["username"],
    email = map["email"],
    address = Address.fromJsonMap(map["address"]),
    phone = map["phone"],
    website = map["website"],
    company = Company.fromJsonMap(map["company"]);

}
