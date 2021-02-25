/// araba_adi : "Mini Cooper"
/// ulke : "ingiltire"
/// kurulus_tarihi : 1983
/// logo : "https://img.favpng.com/11/0/4/2018-mini-cooper-bmw-car-logo-png-favpng-KcApUkv51qFJZJw52i4Ax387h.jpg"
/// model : [{"model_adi":"S Serisi","fiyat":170000,"benzinli":true},{"model_adi":"G Serisi","fiyat":19000,"benzinli":false}]

class Araba {
  String _arabaAdi;
  String _ulke;
  int _kurulusTarihi;
  String _logo;
  List<Model> _model;

  String get arabaAdi => _arabaAdi;
  String get ulke => _ulke;
  int get kurulusTarihi => _kurulusTarihi;
  String get logo => _logo;
  List<Model> get model => _model;

  Araba({
      String arabaAdi, 
      String ulke, 
      int kurulusTarihi, 
      String logo, 
      List<Model> model}){
    _arabaAdi = arabaAdi;
    _ulke = ulke;
    _kurulusTarihi = kurulusTarihi;
    _logo = logo;
    _model = model;
}

  Araba.fromJson(dynamic json) {
    _arabaAdi = json["araba_adi"];
    _ulke = json["ulke"];
    _kurulusTarihi = json["kurulus_tarihi"];
    _logo = json["logo"];
    if (json["model"] != null) {
      _model = [];
      json["model"].forEach((v) {
        _model.add(Model.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["araba_adi"] = _arabaAdi;
    map["ulke"] = _ulke;
    map["kurulus_tarihi"] = _kurulusTarihi;
    map["logo"] = _logo;
    if (_model != null) {
      map["model"] = _model.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// model_adi : "S Serisi"
/// fiyat : 170000
/// benzinli : true

class Model {
  String _modelAdi;
  int _fiyat;
  bool _benzinli;

  String get modelAdi => _modelAdi;
  int get fiyat => _fiyat;
  bool get benzinli => _benzinli;

  Model({
      String modelAdi, 
      int fiyat, 
      bool benzinli}){
    _modelAdi = modelAdi;
    _fiyat = fiyat;
    _benzinli = benzinli;
}

  Model.fromJson(dynamic json) {
    _modelAdi = json["model_adi"];
    _fiyat = json["fiyat"];
    _benzinli = json["benzinli"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["model_adi"] = _modelAdi;
    map["fiyat"] = _fiyat;
    map["benzinli"] = _benzinli;
    return map;
  }

}