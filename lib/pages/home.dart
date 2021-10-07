import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:prueba_kubo/models/products_model.dart';
import 'package:prueba_kubo/services/product_service.dart';
import 'package:prueba_kubo/utils/preference.dart';
import 'package:prueba_kubo/widgets/cards/card.dart';
import 'package:prueba_kubo/widgets/searchers/search.dart';

class HomePage extends StatefulWidget {
  //Trae el metdo que trae el servicio del modelo
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ProductService productService = ProductService();

  var stringSearch = '';

  var controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body:SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/frutas_pancho.png',
                      height: 200,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Searcher(controller: controller, onSubmited: (String input){
                    stringSearch = input;
                    List<String> finalSetStorage = Preference().searchStorage;
                    finalSetStorage.add(input);
                    Preference().searchStorage = finalSetStorage;
                    setState(() {
                    });
                  },
                  onSuggestionSelected: (String suggestion){
                    stringSearch = suggestion;
                    controller.text = suggestion;
                    setState(() {
                    });
                  },
                  onSuggestionCallback: (String suggestion){
                   return  Preference().searchStorage.where((e) =>
                        e.toLowerCase().startsWith(suggestion.toLowerCase())
                    ).toList();
                  },),
                  SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text('Todos los productos',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  FutureBuilder<ProductsModel>(
                    future: productService.getProducts(input: stringSearch),
                    builder: (context, snapshot) {
                      //Recarga el future cada que se guarda algun cambio
                      if(snapshot.connectionState ==ConnectionState.done){
                       if(snapshot.data?.data?.isNotEmpty == true){
                         return GridView.builder(
                           itemBuilder: (context, index){
                             return ItemCard(
                                 product: snapshot.data?.data?[index]
                             );
                           },
                           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                               crossAxisCount: 2,
                               mainAxisExtent: 320
                           ),
                           itemCount: snapshot.data?.data?.length??0,

                           shrinkWrap: true,
                           physics: BouncingScrollPhysics(),
                         );
                       }else {
                         return Center(
                           child: Image.asset(
                             'assets/images/producto_no_encontrado.png',
                             height: 200,
                           ),
                         );
                       }
                      }else if (snapshot.hasError){
                        return Center(
                          child: Image.asset(
                            'assets/images/error.png',
                            height: 200,
                          ),
                        );
                      }else {
                        return Center(
                          child: CircularProgressIndicator(
                            color: Colors.green,
                          ),
                        );
                      }
                    }
                  )
                ]),
          ),
        ),
      )
    );
  }
}
