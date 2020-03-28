import 'package:flutter/material.dart';
import 'package:expanding_bottom_bar/expanding_bottom_bar.dart';
import 'package:wonderwall/screens/Home.dart';
import 'package:wonderwall/screens/Setting.dart';
import 'package:wonderwall/screens/Category.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = [Home(), Category(), Setting()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wonderwall'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: ExpandingBottomBar(
        navBarHeight: 90.0,
        items: [
          ExpandingBottomBarItem(
            icon: Icons.home,
            selectedColor: Colors.purple,
            text: "Home",
          ),
          ExpandingBottomBarItem(
            icon: Icons.category,
            selectedColor: Colors.amber,
            text: "Category",
          ),
          ExpandingBottomBarItem(
            icon: Icons.settings,
            selectedColor: Colors.teal,
            text: "Setting",
          ),
        ],
        selectedIndex: _selectedIndex,
        onIndexChanged: (int value) {
          setState(() {
            _selectedIndex = value;
          });
        },
      ),
    );
  }
}
