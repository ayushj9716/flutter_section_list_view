import 'package:flutter/material.dart';
import 'package:ikon_app/model/contact_model.dart';

class ContactState extends ChangeNotifier {

  // List<String> _allContacts = <String>[
  //   'Marco Franco',
  //   'Raul Alday',
  //   'Jessica Alba',
  //   'Roger Waters',
  //   'Darth Vader',
  //   'Homer Simpson',
  //   'Bill Gates',
  //   'Elon Musk',
  //   'Enrique Peña',
  //   'Angeles Rodriguez',
  //   'Monica Alvarado',
  //   'Estrella Fugaz',
  //   'Juana Lopez',
  // ]..sort();

  List<ContactModel> _allContacts = <ContactModel>[
    ContactModel('Marco Franco', 'Details of Marco Franco'),
    ContactModel('Raul Alday', 'Details of Raul Alday'),
    ContactModel('Jessica Alba', 'Details of Jessica Alba'),
    ContactModel('Roger Waters', 'Details of Roger Waters'),
    ContactModel('Darth Vader', 'Details of Darth Vader'),
    ContactModel('Homer Simpson', 'Details of Homer Simpson'),
    ContactModel('Bill Gates', 'Details of Bill Gates'),
    ContactModel('Elon Musk', 'Details of Elon Musk'),
    ContactModel('Enrique Peña', 'Details of Enrique Peña'),
    ContactModel('Angeles Rodriguez', 'Details of Angeles Rodriguez'),
    ContactModel('Monica Alvarado', 'Details of Monica Alvarado'),
    ContactModel('Estrella Fugaz', 'Details of Estrella Fugaz'),
    ContactModel('Juana Lopez', 'Details of Juana Lopez'),
  ]..sort((a, b) => a.name.compareTo(b.name));

  String _searchText = "";

  set searchText(String text) {
    _searchText = text;
    notifyListeners();
  }

  // List<String> get displayContacts {
  //   if (_searchText == null || _searchText.length == 0) return _allContacts;
  //   return _allContacts
  //       .where((contact) =>
  //           contact.toLowerCase().contains(_searchText.toLowerCase()))
  //       .toList();
  // }

  List<ContactModel> get displayContacts {
    if (_searchText == null || _searchText.length == 0) return _allContacts;
    return _allContacts
        .where((contact) =>
            contact.name.toLowerCase().contains(_searchText.toLowerCase()))
        .toList();
  }
}
