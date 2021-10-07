import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:prueba_kubo/utils/preference.dart';

class Searcher extends StatelessWidget{
  TextEditingController controller;
   Function(String) onSubmited;
   Function(String) onSuggestionSelected;
   List<String> Function(String) onSuggestionCallback ;

  Searcher ({required this.controller, required this.onSubmited, required this.onSuggestionSelected, required this.onSuggestionCallback});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: TypeAheadField(
        textFieldConfiguration: TextFieldConfiguration(
            decoration: InputDecoration(
                hintText: 'Buscador',
                suffixIcon: Icon(Icons.search),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                        color: Colors.white
                    )
                )
            ),
          onSubmitted: onSubmited
        ),
        itemBuilder: (context, String suggestion) {
          return ListTile(
            title: Text(suggestion)
          );
        },
        onSuggestionSelected: (String suggestion) {
          onSuggestionSelected(suggestion);
        },
        suggestionsCallback: ( String pattern) async {
          return onSuggestionCallback(pattern);
        },
      )
    );
  }

}