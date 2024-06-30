import 'package:flutter/material.dart';
import 'package:isakuredesigned/src/app_state.dart';
import 'package:isakuredesigned/src/menu_page_template.dart';
import 'package:isakuredesigned/src/service_menu.dart';
import 'package:provider/provider.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({
    super.key,
    required this.menu,
    required this.favoriteState,
    required this.showButton,
  });

  final ServiceMenu menu;
  final int favoriteState;
  final bool showButton;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.bodySmall!.copyWith(
      color: theme.colorScheme.primary,
    );
    var appState = context.watch<AppState>();

    if (appState.isEditFavoriteMenu && showButton) {
      Icon buttonIcon;
      switch (favoriteState) {
        case 0: // not favourite
          buttonIcon = Icon(
            Icons.add_circle,
            color: Colors.green,
          );
          break;
        case 1: // favourite, but in the all section
          buttonIcon = Icon(
            Icons.add_circle,
            color: Colors.grey[350],
          );
          break;
        case 2: // favurite in the favorite section / remove
          buttonIcon = Icon(
            Icons.do_not_disturb_on,
            color: Colors.red,
          );
          break;
        default:
          throw UnimplementedError('no widget for $favoriteState');
      }

      return SizedBox(
        width: 125,
        child: Card(
          color: Colors.grey[50],
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                IconButton(
                  /// With a toggle button
                  iconSize: 25,
                  icon: buttonIcon,
                  onPressed: () {
                    if (favoriteState != 1) {
                      appState.toggleFavoriteMenu(menu);
                    }
                  },
                ),
                Image(
                  image: menu.icon,
                  width: 80,
                ),
                Text(
                  menu.name,
                  style: style,
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return SizedBox(
        width: 125,
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => MenuPageTemplate(),
              ),
            );
          },
          child: Card(
            color: Colors.grey[50],
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  /// Without a toggle button
                  Image(
                    image: menu.icon,
                    width: 80,
                  ),
                  Text(
                    menu.name,
                    style: style,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
}
