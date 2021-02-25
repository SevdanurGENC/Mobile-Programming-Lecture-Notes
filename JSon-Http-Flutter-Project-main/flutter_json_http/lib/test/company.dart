
class Company {

  String name;
  String catchPhrase;
  String bs;

  Company.fromJsonMap(Map<String, dynamic> map): 
    name = map["name"],
    catchPhrase = map["catchPhrase"],
    bs = map["bs"];

}
