import 'package:flutter/material.dart';
import 'package:http_demo/models/product.dart';

class ProductListRowWidget extends StatelessWidget {
  Product product;

  ProductListRowWidget(this.product);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return buildProductItemCard(context);
  }

  Widget buildProductItemCard(BuildContext context) {
    return InkWell(
      child: Card(
        child: Column(
          children: <Widget>[
            Container(
              child: Image.network(
                  "https://pbs.twimg.com/profile_images/3024465943/8935aa5cfc7b96c0fb13a518e310004a_400x400.jpeg"),
              height: 130.0,
              width: MediaQuery.of(context).size.width / 2,
            ),
            Text(
              product.productName,
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
            Text(
              product.unitPrice.toString() + " TL",
              style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.red,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
