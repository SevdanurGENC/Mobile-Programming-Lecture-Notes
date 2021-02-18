class StudentValidationMixin{

  String validateFirstName(String value){
    if (value.length < 2){
      return "Isim En Az 2 Karakter Olmalidir";
    }
  }

  String validateLastName(String value){
    if (value.length < 2){
      return "Isim En Az 2 Karakter Olmalidir";
    }
  }

  String validateGrade(String value){
    var grade = int.parse(value);
    if(grade <0 || grade > 100){
      return "0-100 Arasi Not Girisi Yapiniz.";
    }
  }

}