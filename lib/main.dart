import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/app_state.dart';
import 'src/placeholder_page.dart';
import 'src/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MaterialApp(
        title: 'iSaku Redesigned App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF409FEF)),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;
  bool shadowColor = false;
  double? scrolledUnderElevation;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = HomePage();
        break;
      case 1:
        page = PlaceholderPage();
        break;
      case 2:
        page = PlaceholderPage();
        break;
      case 3:
        page = PlaceholderPage();
        break;
      case 4:
        page = PlaceholderPage();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('i.saku'),
          shadowColor:
              shadowColor ? Theme.of(context).colorScheme.shadow : null,
          backgroundColor: Color(0xFF409FEF),
          foregroundColor: Colors.white,
          actions: [
            Icon(Icons.upgrade),
            Icon(Icons.notifications),
            Icon(Icons.help),
          ],
        ),
        bottomNavigationBar: NavigationBar(
          // extended: constraints.maxWidth >= 600,
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.receipt_long),
              label: 'Mutasi',
            ),
            NavigationDestination(
              icon: Icon(Icons.qr_code_2_rounded),
              label: 'QRIS',
            ),
            NavigationDestination(
              icon: Icon(Icons.stars),
              label: 'Favorit',
            ),
            NavigationDestination(
              icon: Icon(Icons.person),
              label: 'Profil',
            ),
          ],
          selectedIndex: selectedIndex,
          onDestinationSelected: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
        ),
        body: Container(
          color: Theme.of(context).colorScheme.primaryContainer,
          child: page,
        ),
      );
    });
  }
}
