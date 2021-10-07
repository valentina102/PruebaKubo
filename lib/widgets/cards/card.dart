import 'package:flutter/material.dart';
import 'package:prueba_kubo/models/products_model.dart';
import 'package:prueba_kubo/pages/product_detail.dart';

class ItemCard extends StatelessWidget {
  Data? product;
  ItemCard(
      {required this.product});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        splashColor: Colors.green.withAlpha(30),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (_)=>ProductDetail(
           producto: product,
          )));
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      product?.imagen??'',
                      height: 150,
                    ),
                  ),
                  Positioned(
                    left: -2,
                    bottom: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.green,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 13, vertical: 8),
                        child: Text(
                          product?.valorPromo??'0' + ' %',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              Text(
                product?.nombre??'',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              SizedBox(height: 3),
              Text(
                '\$ ' + (product?.precio??'0') + ' COP',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.red,
                    decoration: TextDecoration.lineThrough,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 3),
              Text(
                '\$ ' +
                    (int.parse(product?.precio??'0') - (int.parse(product?.precio??'0') * (int.parse(product?.valorPromo??'0')/ 100))).toString() +
                    ' COP',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.favorite_border, color: Colors.grey),
                  Icon(Icons.shopping_basket_outlined, color: Colors.grey),
                ],
              )
            ],
          ),
        ),
      )
    );
    //);
  }
}
