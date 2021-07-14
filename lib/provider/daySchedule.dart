import 'dart:collection';

import 'package:flutter/material.dart';

class SelectSchedule with ChangeNotifier {
  final List<String> _items = <String>[
      'Saturday',
      'Sunday',
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'None',
  ];

  String? selectedItem;

  UnmodifiableListView<String> get items {
    return UnmodifiableListView(this._items);
  }

  String? get selected {
    return this.selectedItem;
  }

  set selected(final String? item) {
    this.selectedItem = item;
    this.notifyListeners();
  }
}