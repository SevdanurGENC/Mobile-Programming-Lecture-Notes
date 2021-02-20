void main(){

  //type safety
  List<String> sehirler =new List<String>(3);
  sehirler[0] ="Ankara";
  sehirler[1]="İstanbul";
  sehirler[2]="İzmir";

  print(sehirler);

  List<String> urunler = ["Laptop","Mouse","Keyboard"];
  print(urunler);

  var product1 = Product("TV",500);
  var product2 = Product("Mikrodalga Fırın",650);
  List<Product> products = [product1, product2];
  
  print(products[0].name + " " + products[0].unitPrice.toString());
}

class Product{
  String name;
  double unitPrice;

  Product(String name, double unitPrice){
    this.name = name;
    this.unitPrice = unitPrice;
  }
}

