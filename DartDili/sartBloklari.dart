void main() {
  var sistemeGirmisMi = false;

  if(sistemeGirmisMi == true){
    print("anasayfaya gidildi");
  }else{
    print("login sayfasına gidildi");
  }
  
  
  int puan = 15;
  if(puan>=50){
     print("Geçti");
  }else if(puan>=40){
    print("Bütünleme");
  }else{
    print("Kaldı");
  }


  String not ="A";
  switch(not){
    case "A": {print("Süper");}
    break;
    case "B": {print("İyi");}
    break;
    case "C": {print("İdare eder");}
    break;
    case "D": {print("Kötü");}
    break;
    default: {print("Bilinmiyor");}
    break;

  }


}