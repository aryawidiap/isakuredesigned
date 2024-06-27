import 'package:flutter/material.dart';

import 'menu_list_page.dart';

class MoreMenuBottomSheet extends StatelessWidget {
  const MoreMenuBottomSheet({super.key});

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
