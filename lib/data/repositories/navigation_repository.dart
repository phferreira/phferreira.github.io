import 'package:flutter/material.dart';
import 'package:phferreira/data/models/navigation_item.dart';

class NavigationRepository {
  static const List<NavigationItem> items = [
    NavigationItem(icon: Icons.person, label: 'About'),
    NavigationItem(icon: Icons.computer, label: 'Experience'),
    NavigationItem(icon: Icons.work, label: 'Work'),
    NavigationItem(icon: Icons.contacts, label: 'Contact'),
  ];
}
