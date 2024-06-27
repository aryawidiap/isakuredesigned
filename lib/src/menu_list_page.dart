import 'package:flutter/material.dart';
import 'package:isakuredesigned/src/app_state.dart';
import 'package:isakuredesigned/src/menu_card.dart';
import 'package:provider/provider.dart';

class MenuListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    final theme = Theme.of(context);
    final sectionTitleStyle = theme.textTheme.titleLarge;
    final sectionSubtitleStyle = theme.textTheme.titleMedium;
    var showFavoriteMenu = <MenuCard>[];

    if (appState.isEditFavoriteMenu) {
      showFavoriteMenu = appState.tempFavoriteMenus
          .map((m) => MenuCard(
                menu: m,
                favoriteState: 2,
                showButton: true,
              ))
          .toList();
    } else {
      showFavoriteMenu = appState.favoriteMenus
          .map((m) => MenuCard(
                menu: m,
                favoriteState: 2,
                showButton: true,
              ))
          .toList();
    }

    return ListView(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
      children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Semua Menu',
                  style: theme.textTheme.headlineMedium,
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Menu favorit',
                  style: sectionTitleStyle,
                ),
                ElevatedButton(
                  onPressed: () {
                    appState.toggleEditFavoriteMenu();
                  },
                  style: appState.isEditFavoriteMenu
                      ? ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: theme.colorScheme.onPrimary)
                      : ElevatedButton.styleFrom(
                          backgroundColor: theme.colorScheme.primary,
                          foregroundColor: theme.colorScheme.onPrimary),
                  child: appState.isEditFavoriteMenu
                      ? Text('Simpan')
                      : Text('Edit'),
                ),
              ],
            ),
            Wrap(
              alignment: WrapAlignment.start,
              children: showFavoriteMenu,
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Column(
          children: [
            Row(
              children: [
                Text(
                  'Menu Lainnya',
                  style: sectionTitleStyle,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Top up',
                  style: sectionSubtitleStyle,
                ),
                Wrap(
                  alignment: WrapAlignment.start,
                  children: [
                    ...appState.allMenus.map((m) => MenuCard(
                          menu: m,
                          favoriteState:
                              appState.tempFavoriteMenus.contains(m) ? 1 : 0,
                          showButton: true,
                        )),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pendaftaran',
                  style: sectionSubtitleStyle,
                ),
                Wrap(
                  alignment: WrapAlignment.start,
                  children: [
                    ...appState.allMenus.map((m) => MenuCard(
                          menu: m,
                          favoriteState:
                              appState.tempFavoriteMenus.contains(m) ? 1 : 0,
                          showButton: true,
                        )),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tagihan',
                  style: sectionSubtitleStyle,
                ),
                Wrap(
                  alignment: WrapAlignment.start,
                  children: [
                    ...appState.allMenus.map((m) => MenuCard(
                          menu: m,
                          favoriteState:
                              appState.tempFavoriteMenus.contains(m) ? 1 : 0,
                          showButton: true,
                        )),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
