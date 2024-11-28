import 'package:flutter/material.dart';

class Counter {
  int value;
  Color color;
  String label;

  Counter({required this.value, required this.color, required this.label});
}

class GlobalState extends ChangeNotifier {
  List<Counter> counters = [];

  void addCounter(Color color, String label) {
    counters.add(Counter(value: 0, color: color, label: label));
    notifyListeners();
  }

  void removeCounter(int index) {
    counters.removeAt(index);
    notifyListeners();
  }

  void incrementCounter(int index) {
    counters[index].value++;
    notifyListeners();
  }

  void decrementCounter(int index) {
    if (counters[index].value > 0) {
      counters[index].value--;
      notifyListeners();
    }
  }
}
