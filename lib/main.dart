import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animations/animations.dart'; 

// GlobalState untuk menyimpan data counter
class GlobalState extends ChangeNotifier {
  int counter = 0;
  String label = "Label Text";

  void increment() {
    counter++;
    notifyListeners();
  }

  void decrement() {
    if (counter > 0) {
      counter--;
      notifyListeners();
    }
  }

  void updateLabel(String newLabel) {
    label = newLabel;
    notifyListeners();
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => GlobalState(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App with Animations',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CounterPage(),
    );
  }
}

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final globalState = Provider.of<GlobalState>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Counter with Animations")),
      body: Center( // Centering the entire column in the body
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center the content vertically
            crossAxisAlignment: CrossAxisAlignment.center, // Center the content horizontally
            children: [
              // Animasi menggunakan FadeScaleTransition
              FadeScaleTransition(
                animation: AlwaysStoppedAnimation(1.0), // Kontrol animasi
                child: Text(
                  'Counter: ${globalState.counter}',
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              // Button untuk increment
              ElevatedButton(
                onPressed: () => globalState.increment(),
                child: Text('Increment'),
              ),
              SizedBox(height: 20),
              // Button untuk decrement
              ElevatedButton(
                onPressed: () => globalState.decrement(),
                child: Text('Decrement'),
              ),
              SizedBox(height: 20),
              // Button untuk mengubah label
              ElevatedButton(
                onPressed: () => globalState.updateLabel("New Label!"),
                child: Text('Change Label'),
              ),
              SizedBox(height: 20),
              // Label dengan animasi fade menggunakan FadeScaleTransition
              FadeScaleTransition(
                animation: AlwaysStoppedAnimation(1.0),
                child: Text(
                  globalState.label,
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
