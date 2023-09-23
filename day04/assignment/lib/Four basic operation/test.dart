import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  bool _textFieldClicked = false;

  void _onTextFieldClick() {
    setState(() {
      _textFieldClicked = true;
    });
  }

  void _onBottomNavBarTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TextField Click"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onTap: _onTextFieldClick,
              decoration: InputDecoration(
                hintText: "Click me!",
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              _textFieldClicked ? "TextField Clicked!" : "TextField Not Clicked",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onBottomNavBarTap,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              _textFieldClicked ? Icons.home : Icons.home_filled,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _textFieldClicked ? Icons.search : Icons.search_off,
            ),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _textFieldClicked ? Icons.person : Icons.person_outline,
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
