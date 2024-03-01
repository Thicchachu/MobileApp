import 'package:flutter/material.dart';
import 'package:assignment/screens/task_page.dart';

void main() {
  runApp(MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>(); // Define GlobalKey

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey, // Set navigatorKey
      home: Scaffold(
        key: Key('home_scaffold'), // Add a key for accessibility
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to Plan IT',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Your Personal task management and planning solution',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 32),
              ElevatedButton(
                key: Key('get_started_button'), // Add a key for accessibility
                onPressed: () {
                  navigatorKey.currentState!.push(MaterialPageRoute(builder: (context) => TaskBoardPage())); // Navigate to TaskBoardPage
                },
                child: Text('Let’s get started'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.grey[300]), // Set the button color
                  foregroundColor: MaterialStateProperty.all(Colors.black), // Set the text color
                  textStyle: MaterialStateProperty.all(TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
