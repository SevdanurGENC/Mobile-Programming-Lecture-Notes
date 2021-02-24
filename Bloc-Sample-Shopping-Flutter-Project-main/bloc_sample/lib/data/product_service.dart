import 'package:bloc_sample/models/product.dart';

class ProductService {
  static List<Product> products = new List<Product>();

  ProductService._internal();

  static ProductService _singleton = ProductService._internal();

  factory ProductService() {
    return _singleton;
  }

  static List<Product> getAll() {
    products.add(new Product(1, "Acer Laptop", 6000));
    products.add(new Product(2, "Macbook Laptop", 10000));
    products.add(new Product(3, "Lenovo Laptop", 7000));
    return products;
  }
}
