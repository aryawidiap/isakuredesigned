import 'package:flutter/material.dart';

import 'menu_list_page.dart';
import 'service_menu.dart';

class MoreMenuBottomSheet extends StatefulWidget {
  const MoreMenuBottomSheet({super.key});

  @override
  State<MoreMenuBottomSheet> createState() => _MoreMenuBottomSheetState();
}

class _MoreMenuBottomSheetState extends State<MoreMenuBottomSheet> {
  List<ServiceMenu> temporaryFavoriteMenus = <ServiceMenu>[];
  List<ServiceMenu> temporaryAllMenus = <ServiceMenu>[];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 125,
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
            useRootNavigator: false,
            isScrollControlled: true,
            context: context,
            builder: (_) => DraggableScrollableSheet(
                expand: false, builder: (_, controller) => MenuListPage()),
          );
        },
        child: Card(
          color: Colors.grey[50],
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(
                  width: 80,
                  height: 80,
                  child: Icon(Icons.apps_rounded),
                ),
                Text(
                  'Lihat semua',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
