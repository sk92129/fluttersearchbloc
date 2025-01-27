import 'package:flutter/material.dart';
import 'package:searchsimple/modules/search/data/data.dart';


class MySearchController {
  final BuildContext context;

  MySearchController({required this.context});

  onChange(String value) {
    value = value.toLowerCase();
    List<String> listOfNames =
        searchable.where((name) => name.toLowerCase().contains(value)).toList();
    if (value.isEmpty) {
      listOfNames = [];
      //context.read<SearchBloc>().add(SearchingEvent(listOfNames));
    }
    //context.read<SearchBloc>().add(SearchingEvent(listOfNames));
  }
}
