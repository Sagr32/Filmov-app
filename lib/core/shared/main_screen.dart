import 'cutom_drawer.dart';

import '../../features/movie/presentation/pages/movie_screen.dart';
import '../../features/tv/presentation/pages/tv_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Main Screen that shows bottom nav bar
/// holds two screen [Movie Screen , Tv Screen]
class MainScreen extends StatefulWidget {
  /// Constructor
  const MainScreen({Key? key}) : super(key: key);

  /// route name
  static const String routeName = '/main-screen';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    MovieScreen(),
    TvScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
      drawer: const CustomDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'FILMOV',
        ),
      ),
      body: IndexedStack(
        children: _widgetOptions,
        index: _selectedIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.movie_creation_outlined,
            ),
            label: 'Movie',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tv_outlined),
            label: 'Tv',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
