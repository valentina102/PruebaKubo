import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:prueba_kubo/models/products_model.dart';

class ProductService {
   Future<ProductsModel> getProducts({String input=''}) async {
    try{
      var response = await http.get(Uri.parse(
          'https://api.bazzaio.com/v5/listados/listar_productos_tienda/590/0/'));
      if(response.statusCode ==200){
        ProductsModel productsModel = ProductsModel.fromJson(json.decode(response.body));
        //validar el input del buscador
        if(input.isNotEmpty){
         List<Data>? list =
          productsModel.data?.where((e) =>
          (e.nombre??'').toLowerCase().startsWith(input.toLowerCase())
          ).toList();
          productsModel.setData(list);
        }
        return productsModel;
      }
      print(response.statusCode);
      throw 'No tiene conexion con el servidor ';
    }catch(e){
      print(e);
      rethrow;

    }
  }
}
