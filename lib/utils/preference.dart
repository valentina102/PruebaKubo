import 'package:shared_preferences/shared_preferences.dart';

class Preference {
  static final _instance = Preference._internal();
  // Constructores
  Preference._internal();

  factory Preference(){
    return _instance;
  }
  late SharedPreferences _sharedPreferences ;

  //Llama la libreria de las preferencias
  initPrefs() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }
  //Guarda en una lista las palabras buscadas
  List<String> get searchStorage => _sharedPreferences.getStringList('keySearch')??[];
  //Asigna el valor a la lista
  set searchStorage(List<String> keySearch){ _sharedPreferences.setStringList('keySearch', keySearch);}
}
