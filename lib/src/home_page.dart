import 'package:flutter/material.dart';
import 'package:isakuredesigned/src/app_state.dart';
import 'package:provider/provider.dart';

import 'menu_card.dart';
import 'menu_list_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();

    return Center(
      child: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ProfileAndCredit(),
              SizedBox(
                height: 20,
              ),
              MainTransactionSection(),
              SizedBox(
                height: 20,
              ),
              FavoriteMenuSection(appState: appState),
              SizedBox(
                height: 20,
              ),
              PromosiMenarik(),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProfileAndCredit extends StatelessWidget {
  const ProfileAndCredit({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      /// Profile and Saldo
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              child: const Text('AH'),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Selamat siang,'),
                Text('Name'),
              ],
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('Saldo'),
            Row(
              children: [
                Icon(Icons.replay_outlined),
                Text('Rp.0'),
              ],
            )
          ],
        ),
      ],
    );
  }
}

class FavoriteMenuSection extends StatefulWidget {
  const FavoriteMenuSection({
    super.key,
    required this.appState,
  });

  final AppState appState;

  @override
  State<FavoriteMenuSection> createState() => _FavoriteMenuSectionState();
}

class _FavoriteMenuSectionState extends State<FavoriteMenuSection> {
  void _openBottomSheet(AppState appState) async {
    await showModalBottomSheet(
      useRootNavigator: false,
      isScrollControlled: true,
      context: context,
      builder: (_) => DraggableScrollableSheet(
          expand: false, builder: (_, controller) => MenuListPage()),
    );

    appState.resetEditFavoritMenu();
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();

    return Wrap(
      children: [
        ...widget.appState.favoriteMenus.map((m) => MenuCard(
              menu: m,
              favoriteState: 2,
              showButton: false,
            )),
        SizedBox(
          width: 125,
          child: GestureDetector(
            onTap: () {
              _openBottomSheet(appState);
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
        ),
      ],
    );
  }
}

class MainTransactionSection extends StatelessWidget {
  const MainTransactionSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(15),
      child: Column(
        // Kupon and main menu
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Placeholder(
                    fallbackHeight: 20,
                    fallbackWidth: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Klik Indomaret',
                        style: theme.textTheme.labelMedium,
                      ),
                      Text(
                        'Belanja sekarang',
                        style: theme.textTheme.labelSmall,
                      ),
                    ],
                  ),
                ],
              ),
              VerticalDivider(
                width: 10,
              ),
              Row(
                children: [
                  Placeholder(
                    fallbackHeight: 20,
                    fallbackWidth: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Kupon',
                        style: theme.textTheme.labelMedium,
                      ),
                      Text(
                        'Kamu memiliki 0 kupon',
                        style: theme.textTheme.labelSmall,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Divider(
            height: 25,
            thickness: 2,
          ),
          Wrap(
            runAlignment: WrapAlignment.spaceBetween,
            children: [
              ElevatedButton(
                child: Column(
                  children: [
                    Icon(Icons.add),
                    Text(
                      'Isi saldo',
                      style: theme.textTheme.labelSmall,
                    ),
                  ],
                ),
                onPressed: () {},
              ),
              ElevatedButton(
                child: Column(
                  children: [
                    Icon(Icons.atm_rounded),
                    Text(
                      'Tarik tunai',
                      style: theme.textTheme.labelSmall,
                    ),
                  ],
                ),
                onPressed: () {},
              ),
              ElevatedButton(
                child: Column(
                  children: [
                    Icon(Icons.sync_alt_rounded),
                    Text(
                      'Transfer',
                      style: theme.textTheme.labelSmall,
                    ),
                  ],
                ),
                onPressed: () {},
              ),
              ElevatedButton(
                child: Column(
                  children: [
                    Icon(Icons.location_on),
                    Text(
                      'Lokasi toko',
                      style: theme.textTheme.labelSmall,
                    ),
                  ],
                ),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PromosiMenarik extends StatelessWidget {
  const PromosiMenarik({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Promosi menarik',
            style: theme.textTheme.headlineSmall,
          ),
          Text('Lihat semua'),
        ],
      ),
      SizedBox(
        height: 10,
      ),
      Row(
        children: [
          SizedBox(
            width: 125,
            child: GestureDetector(
              onTap: () {},
              child: Card(
                color: Colors.grey[50],
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 80,
                        height: 80,
                        child: Image(
                          image: AssetImage('assets/example_promo.JPG'),
                        ),
                      ),
                      Text(
                        'Mystery Code Setiap Hari Selasa',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 125,
            child: GestureDetector(
              onTap: () {},
              child: Card(
                color: Colors.grey[50],
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 80,
                        height: 80,
                        child: Image(
                          image: AssetImage('assets/example_promo.JPG'),
                        ),
                      ),
                      Text(
                        'Mystery Code Setiap Hari Selasa',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ]);
  }
}
