import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prueba_kubo/models/products_model.dart';

class ProductDetail extends StatelessWidget {
  Data? producto;
  ProductDetail({required this.producto});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(producto?.nombre??''),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        foregroundColor: Colors.black38,
      ),
      body: SingleChildScrollView(
          child: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: Image.network(producto?.imagen ?? ''),
            ),
            SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                producto?.imagen??'',
                height: 100,
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                producto?.nombre ?? '',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Icon(Icons.favorite_border,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(right: 53),
                          child: Text(
                            producto?.descripcion ?? '',
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '\$ ' + (producto?.precio ?? '0') + ' COP',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.red,
                              decoration: TextDecoration.lineThrough,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 3),
                        Text(
                          '\$ ' +
                              (int.parse(producto?.precio ?? '0') -
                                      (int.parse(producto?.precio ?? '0') *
                                          (int.parse(
                                                  producto?.valorPromo ?? '0') /
                                              100)))
                                  .toString() +
                              ' COP',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.green),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.arrow_drop_down),
                                Text(
                                  '0',
                                  style: TextStyle(fontSize: 18),
                                ),
                                Icon(Icons.arrow_drop_up),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 85),
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.green)),
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Icon(Icons.shopping_basket_outlined,
                                      color: Colors.white),
                                  Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Text('Añadir al carrito',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)),
                                  )
                                ],
                              )),
                        ),
                        SizedBox(height: 20),
                        ExpandablePanel(
                            collapsed: ExpandableButton(  // <-- Expands when tapped on the cover photo
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Descripción', style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20
                                  ),),
                                  Icon(Icons.arrow_drop_down),
                                ],
                              )
                            ),
                            expanded: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Descripción', style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20
                                    ),),
                                    Icon(Icons.arrow_drop_down),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Text(
                                  producto?.descripcion ?? '',
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 16),
                                )
                              ],
                            )
                            ),
                        SizedBox(height: 20),
                      ]),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
