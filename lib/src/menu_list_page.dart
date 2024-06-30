import 'package:flutter/material.dart';
import 'package:isakuredesigned/src/app_state.dart';
import 'package:isakuredesigned/src/menu_card.dart';
import 'package:provider/provider.dart';

import 'service_menu.dart';

class MenuListPage extends StatelessWidget {
  const MenuListPage({
    super.key,
  });

  Column buildSection(String sectionTitle, TextStyle sectionSubtitleStyle,
      List<ServiceMenu> sectionMenus, List<ServiceMenu> favoriteMenus) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          sectionTitle,
          style: sectionSubtitleStyle,
        ),
        Wrap(
          alignment: WrapAlignment.start,
          children: [
            ...sectionMenus.map((m) => MenuCard(
                  menu: m,
                  favoriteState: favoriteMenus.contains(m) ? 1 : 0,
                  showButton: true,
                )),
          ],
        ),
      ],
    );
  }

  List<Widget> buildAllMenus(
      {required Map<String, List<ServiceMenu>> allMenus,
      required TextStyle sectionSubtitleStyle,
      required List<ServiceMenu> favoriteMenus}) {
    List<Widget> allMenuColumns = [];

    for (var serviceGroup in allMenus.keys) {
      allMenuColumns.add(buildSection(serviceGroup, sectionSubtitleStyle,
          allMenus[serviceGroup]!, favoriteMenus));
      allMenuColumns.add(SizedBox(
        height: 20,
      ));
    }

    return allMenuColumns;
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    final theme = Theme.of(context);
    final sectionTitleStyle = theme.textTheme.titleLarge;
    final sectionSubtitleStyle = theme.textTheme.titleMedium;

    List<ServiceMenu> localFavoriteMenus = <ServiceMenu>[];

    localFavoriteMenus = [...appState.favoriteMenus];

    if (appState.isEditFavoriteMenu) {
      localFavoriteMenus = [...appState.temporaryFavoriteMenus];
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
              children: localFavoriteMenus
                  .map((m) => MenuCard(
                        menu: m,
                        favoriteState: 2,
                        showButton: true,
                      ))
                  .toList(),
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            ...buildAllMenus(
                allMenus: appState.allMenusTest,
                sectionSubtitleStyle: sectionSubtitleStyle!,
                favoriteMenus: localFavoriteMenus),
            Text('sungai percobaan'),
          ],
        ),
      ],
    );
  }
}
