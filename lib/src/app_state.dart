import 'package:flutter/material.dart';
import 'package:isakuredesigned/src/service_menu.dart';

class AppState extends ChangeNotifier {
  var favoriteMenus = <ServiceMenu>[
    ServiceMenu('Pulsa & Data', AssetImage('assets/keanggotaan.png')),
    ServiceMenu('PLN', AssetImage('assets/pln.png')),
  ];
  var temporaryFavoriteMenus = <ServiceMenu>[];

  var allMenus = <ServiceMenu>[
    ServiceMenu('Pulsa & Data', AssetImage('assets/keanggotaan.png')),
    ServiceMenu('PLN', AssetImage('assets/pln.png')),
    ServiceMenu('Voucher Digital', AssetImage('assets/pulsadata.png')),
    ServiceMenu('Top Up Uang Elektronik', AssetImage('assets/saldo.png')),
    ServiceMenu('Top Up Saldo', AssetImage('assets/uangelektronik.png')),
    ServiceMenu('Keanggotaan', AssetImage('assets/voucherdigital.png')),
  ];

  Map<String, List<ServiceMenu>> allMenusTest = {
    'Top Up': <ServiceMenu>[
      ServiceMenu('Pulsa & Data', AssetImage('assets/keanggotaan.png')),
      ServiceMenu('PLN', AssetImage('assets/pln.png')),
      ServiceMenu('Voucher Digital', AssetImage('assets/pulsadata.png')),
      ServiceMenu('Top Up Uang Elektronik', AssetImage('assets/saldo.png')),
      ServiceMenu('Top Up Saldo', AssetImage('assets/uangelektronik.png')),
      ServiceMenu('Keanggotaan', AssetImage('assets/voucherdigital.png')),
    ],
    'Pendaftaran': <ServiceMenu>[
      ServiceMenu(
          'Pendaftaran BPJAMSOSTEK', AssetImage('assets/bpjamsostek.png')),
    ],
    'Tagihan': <ServiceMenu>[
      ServiceMenu('Air Minum', AssetImage('assets/air_minum.png')),
      ServiceMenu(
          'Telepon Pascabayar', AssetImage('assets/telepon_pascabayar.png')),
      ServiceMenu('Kredit Angsuran', AssetImage('assets/kredit_angsuran.png')),
    ],
  };

  bool isFavoriteFull = false;
  int maxFavorites = 5;

  void toggleFavoriteMenu(ServiceMenu menu) {
    if (temporaryFavoriteMenus.contains(menu)) {
      temporaryFavoriteMenus.remove(menu);
      isFavoriteFull = !(temporaryFavoriteMenus.length < maxFavorites);
    } else {
      isFavoriteFull = !(temporaryFavoriteMenus.length < maxFavorites);
      if (!isFavoriteFull) {
        temporaryFavoriteMenus.add(menu);
      }
    }
    notifyListeners();
  }

  bool isEditFavoriteMenu = false;

  void toggleEditFavoriteMenu() {
    if (isEditFavoriteMenu) {
      // saving the new favorites
      isEditFavoriteMenu = false;
      favoriteMenus = [...temporaryFavoriteMenus];
    } else {
      isFavoriteFull = !(favoriteMenus.length < maxFavorites);
      isEditFavoriteMenu = true;
      temporaryFavoriteMenus = [...favoriteMenus];
    }
    notifyListeners();
  }

  void resetEditFavoritMenu() {
    isEditFavoriteMenu = false;
    notifyListeners();
  }
}
