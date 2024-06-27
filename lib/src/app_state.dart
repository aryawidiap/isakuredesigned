import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:isakuredesigned/src/service_menu.dart';

class AppState extends ChangeNotifier {
  var current = WordPair.random();

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  var favorites = <WordPair>[];

  var favoriteMenus = <ServiceMenu>[
    ServiceMenu('Pulsa & Data', AssetImage('assets/keanggotaan.png')),
    ServiceMenu('PLN', AssetImage('assets/pln.png')),
  ];
  var tempFavoriteMenus = <ServiceMenu>[];

  var allMenus = <ServiceMenu>[
    ServiceMenu('Pulsa & Data', AssetImage('assets/keanggotaan.png')),
    ServiceMenu('PLN', AssetImage('assets/pln.png')),
    ServiceMenu('Voucher Digital', AssetImage('assets/pulsadata.png')),
    ServiceMenu('Top Up Uang Elektronik', AssetImage('assets/saldo.png')),
    ServiceMenu('Top Up Saldo', AssetImage('assets/uangelektronik.png')),
    ServiceMenu('Keanggotaan', AssetImage('assets/voucherdigital.png')),
  ];

  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }

  bool isFavoriteFull = false;
  int maxFavorites = 5;

  void toggleFavoriteMenu(ServiceMenu menu) {
    if (tempFavoriteMenus.contains(menu)) {
      tempFavoriteMenus.remove(menu);
      isFavoriteFull = !(favoriteMenus.length < maxFavorites);
    } else {
      isFavoriteFull = !(favoriteMenus.length < maxFavorites);
      if (!isFavoriteFull) {
        tempFavoriteMenus.add(menu);
      }
    }
    notifyListeners();
  }

  bool isEditFavoriteMenu = false;

  void toggleEditFavoriteMenu() {
    if (isEditFavoriteMenu) {
      // saving the new favorites
      isEditFavoriteMenu = false;
      favoriteMenus = tempFavoriteMenus;
    } else {
      isFavoriteFull = !(favoriteMenus.length < maxFavorites);
      isEditFavoriteMenu = true;
      tempFavoriteMenus = favoriteMenus;
    }
    notifyListeners();
  }
}
