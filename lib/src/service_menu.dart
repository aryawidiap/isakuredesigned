import 'package:flutter/material.dart';

class ServiceMenu {
  final String name;
  final AssetImage icon;

  ServiceMenu(this.name, this.icon);

  @override
  int get hashCode => name.hashCode;

  @override
  bool operator ==(Object other) {
    return other is ServiceMenu && other.name == name;
  }
}
