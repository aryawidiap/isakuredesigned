import 'package:flutter/material.dart';

class MenuPageTemplate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Daftar layanan'),
          shadowColor: null,
          backgroundColor: Color(0xFF409FEF),
          foregroundColor: Colors.white,
          actions: [
            Icon(Icons.help),
          ],
        ),
        body: Container(
          color: Theme.of(context).colorScheme.primaryContainer,
          child: ListView(
            children: List<Widget>.generate(
              10,
              (index) => const ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text('AH'),
                ),
                title: Text('Penyedia ABC'),
                trailing: Icon(Icons.keyboard_arrow_right_rounded),
              ),
            ),
          ),
        ),
      );
    });
  }
}
